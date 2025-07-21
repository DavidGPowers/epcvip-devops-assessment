
# # ========================================================================================================
# # for production use, an s3 bucket is likely a better choice, especially when using CI/CD pipelines
# # so the state metadata is available and can be locked to a avoid race conditions due to concurrent access
# # ========================================================================================================
# terraform {
#   backend "s3" {
#     key          = "infrastructure/shared-resources-primary/terraform.tfstate"
#     region       = "us-east-2"
#     encrypt      = true
#     use_lockfile = true
#   }
# }


terraform {
  // see environment specific local state path in backend-{env}.config files
  backend "local" {}
}