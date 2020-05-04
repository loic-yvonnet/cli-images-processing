#!/bin/bash

# Usage:
# cd dir_with_heic_files
# ../heic_to_pdf.sh my.pdf

# Convert heic to jpg
mkdir __tmp__heic_jpg
for file in *.HEIC; do heif-convert -q 75 $file __tmp__heic_jpg/${file}.jpg; done

# Resize the images
mkdir __tmp__jpg_resized
for file in __tmp__heic_jpg/*.jpg; do convert -resize 25% __tmp__heic_jpg/$file __tmp__jpg_resized/$file; done

# Create the PDF (and rotate by 90 degrees so that images appear as expected)
convert -rotate 90 __tmp__jpg_resized/*.jpg $1

# Remove the temporary directories
rm -rf __tmp__heic_jpg
rm -rf __tmp__jpg_resized
