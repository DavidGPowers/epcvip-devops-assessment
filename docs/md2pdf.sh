#!/bin/bash

# A script to convert all Markdown files in the current directory to PDF using pandoc.
# This version includes settings for paper size and margins to prevent truncation.

# --- SETTINGS ---
# Set the paper size (e.g., letter, a4)
PAPER_SIZE="letter"
# Set the page margins (e.g., 1in, 2.5cm)
MARGIN="0.5in"
# --- END SETTINGS ---



echo "Using settings: Paper Size=$PAPER_SIZE, Margin=$MARGIN"
echo "---"

# Loop through all files ending with .md
for mdfile in `find ../ -name \*.md`; do
    # Define the output PDF filename by replacing the .md extension with .pdf
    pdffile="${mdfile%.md}.pdf"
    pdffile=`echo $pdffile | tr '/' '_' | sed -e 's/^...//'`

    echo "Converting '$mdfile' to '$pdffile'..."

    # Use pandoc to perform the conversion.
    # The -V flag sets variables. We use it to control page geometry.
    # The --pdf-engine=xelatex flag is used for better font and Unicode support.
    pandoc "$mdfile" \
        -o "$pdffile" \
        --pdf-engine=xelatex \
        -V papersize:$PAPER_SIZE \
        -V geometry:margin=$MARGIN

    # Check if the conversion was successful
    if [ $? -eq 0 ]; then
        echo "Successfully converted '$mdfile' to '$pdffile'."
    else
        echo "Error converting '$mdfile'. Please check for errors."
    fi
    echo "---"
done

echo "All Markdown files have been processed."
