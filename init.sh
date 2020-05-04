#!/bin/bash

# Install the dependencies
sudo apt-get install libheif1 libheif-examples imagemagick img2pdf

# Check the ghostscript version
export ghostscript_version=`gs -v | head -n 1 | cut -d' ' -f3`
if [[ "$ghostscript_version" != "9.26" ]]
then
    echo "Make sure your ghostscript version if greater than 9.24"
    echo "and check https://www.kb.cert.org/vuls/id/332928/"
    echo "Ghostscript version: $ghostscript_version"
    exit 1
fi

# Patch the ghostcript policy (we just checked that we have the fix for the afore-mentioned vulnerability)
sudo cp ./policy.xml /etc/ImageMagick-6/policy.xml
