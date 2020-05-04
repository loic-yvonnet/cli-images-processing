#!/bin/bash

# Usage:
# cd dir_with_heic_files
# ../heic_to_pdf.sh my.pdf

# Convert heic to jpg
mkdir .tmp_heic_to_pdf
for file in *.HEIC; do heif-convert -q 75 $file .tmp_heic_to_pdf/${file}.jpg; done

# Resize the images
cd .tmp_heic_to_pdf
mkdir resized
for file in *.jpg; do convert -resize 25% $file resized/$file; done
cd ..

# Create the PDF (and rotate by 90 degrees so that images appear as expected)
convert -rotate 90 .tmp_heic_to_pdf/resized/*.jpg $1

# Remove the temporary directories
rm -rf .tmp_heic_to_pdf
