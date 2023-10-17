#!/bin/bash
# Define the source and destination directories
src_dir="./src/submodules/diary/"
dest_dir="./public/"

# make public dir
make -p ./public

# Use find to copy all files except index.md
find $src_dir -type f ! -name 'index.md' ! -name .git ! -name .gitignore -exec cp {} $dest_dir \;

# Then use find to delete the copied files from the source directory
find $src_dir -type f ! -name 'index.md' ! -name .git ! -name .gitignore -exec rm {} \;
