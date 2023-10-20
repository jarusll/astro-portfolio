#!/bin/bash
# Define the source and destination directories
src_dir="./src/submodules/diary/"
dest_dir="./public/"

# make public dir
make -p ./public

# Use find to copy all files except index.md
find $src_dir -type f ! -name 'index.md' ! -name .git ! -name .gitignore -exec cp {} $dest_dir \;

# loop & compress images
# find $dest_dir -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | parallel cwebp {} -o {} -progress -q 50 -short
# for file in $dest_dir/*; do
#   if [[ $file =~ \.(png|jpg|jpeg) ]]; then
#     cwebp $file -o $file -q 50
#   fi
# done
