# alb_logging.tf
# This file defines resources for ALB access logging.

# Data source to get the current AWS account ID
data "aws_caller_identity" "current" {}

# Data source to get the the region-specific AWS account ID for ELB service
# This ID is required for the S3 bucket policy to allow ALB to write logs
# Refer to AWS documentation for the correct account ID for your region:
# https://docs.aws.amazon.com/elasticloadbalancing/latest/application/enable-access-logs.html#grant-access-to-s3-bucket
data "aws_elb_service_account" "main" {
  count = var.enable_access_logs ? 1 : 0
}

resource "aws_s3_bucket" "alb_access_logs_bucket" {
  count = var.enable_access_logs ? 1 : 0

  bucket = var.access_logs_s3_bucket_name
  # Object ownership is now managed via the aws_s3_bucket_ownership_controls resource.
  # Server-side encryption is now managed via the aws_s3_bucket_server_side_encryption_configuration resource.
  # Lifecycle rules are now managed via the aws_s3_bucket_lifecycle_configuration resource.

  # Removed: The 'dynamic "versioning"' block is deprecated and moved to a dedicated resource.

  tags = merge(
    local.common_tags,
    {
      Name = "${var.access_logs_s3_bucket_name}"
    }
  )
}

# New resource: Manages S3 Bucket Versioning for the access logs bucket.
# This replaces the deprecated 'versioning' block within the aws_s3_bucket resource.
resource "aws_s3_bucket_versioning" "alb_access_logs_bucket_versioning" {
  count = var.enable_access_logs && var.access_logs_s3_bucket_versioning_enabled ? 1 : 0

  bucket = aws_s3_bucket.alb_access_logs_bucket[0].id
  versioning_configuration {
    status = "Enabled" # Always enabled if this resource is created
  }

  # Ensure this resource depends on the bucket being created first
  depends_on = [aws_s3_bucket.alb_access_logs_bucket]
}


# Manages S3 Object Ownership for the bucket.
# Required to ensure that objects written by other accounts (like ALB log delivery)
# are owned by the bucket owner.
resource "aws_s3_bucket_ownership_controls" "alb_access_logs_bucket_ownership" {
  count = var.enable_access_logs ? 1 : 0

  bucket = aws_s3_bucket.alb_access_logs_bucket[0].id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }

  # Ensure this resource depends on the bucket being created first
  depends_on = [aws_s3_bucket.alb_access_logs_bucket]
}

# Manages S3 Server Side Encryption for the bucket.
resource "aws_s3_bucket_server_side_encryption_configuration" "alb_access_logs_bucket_encryption" {
  count = var.enable_access_logs ? 1 : 0

  bucket = aws_s3_bucket.alb_access_logs_bucket[0].id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }

  # Ensure this resource depends on the bucket being created first
  depends_on = [aws_s3_bucket.alb_access_logs_bucket]
}

# Manages S3 Lifecycle Configuration for the bucket.
resource "aws_s3_bucket_lifecycle_configuration" "alb_access_logs_bucket_lifecycle" {
  count = var.enable_access_logs && var.access_logs_s3_bucket_lifecycle_enabled ? 1 : 0

  bucket = aws_s3_bucket.alb_access_logs_bucket[0].id

  rule {
    id     = "alb-logs-lifecycle"
    status = "Enabled" # This 'status' refers to the lifecycle rule itself

    # Rule to abort incomplete multipart uploads
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }

    # Filter to apply this lifecycle rule to objects with the specified prefix
    filter {
      prefix = var.access_logs_s3_prefix
    }

    # Rule to transition logs to Infrequent Access after N days
    dynamic "transition" {
      for_each = var.access_logs_s3_bucket_transition_days != null ? [1] : []
      content {
        days          = var.access_logs_s3_bucket_transition_days
        storage_class = "STANDARD_IA"
      }
    }

    # Rule to expire logs after N days
    dynamic "expiration" {
      for_each = var.access_logs_s3_bucket_expiration_days != null ? [1] : []
      content {
        days = var.access_logs_s3_bucket_expiration_days
      }
    }
  }

  # Ensure this resource depends on the bucket being created first
  depends_on = [aws_s3_bucket.alb_access_logs_bucket]
}


resource "aws_s3_bucket_policy" "alb_access_logs_bucket_policy" {
  count = var.enable_access_logs ? 1 : 0

  bucket = aws_s3_bucket.alb_access_logs_bucket[0].id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = data.aws_elb_service_account.main[0].arn
        },
        Action = "s3:PutObject",
        Resource = [
          "${aws_s3_bucket.alb_access_logs_bucket[0].arn}/${var.access_logs_s3_prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
          "${aws_s3_bucket.alb_access_logs_bucket[0].arn}/${var.access_logs_s3_prefix}/AWSLogs/${data.aws_caller_identity.current.account_id}", # Required for bucket-level permissions sometimes
        ]
      },
      {
        Effect = "Allow",
        Principal = {
          AWS = data.aws_elb_service_account.main[0].arn
        },
        Action   = "s3:GetBucketAcl",
        Resource = aws_s3_bucket.alb_access_logs_bucket[0].arn
      }
    ]
  })

  # Ensure the policy depends on the ownership controls being set
  depends_on = [aws_s3_bucket_ownership_controls.alb_access_logs_bucket_ownership]
}
