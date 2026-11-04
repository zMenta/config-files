#!/bin/bash
# Dependencies: fd, nsxiv, shuf (also another script)

TARGET_DIR="."
if [ -d "$1" ]; then
    TARGET_DIR=$1
else
    echo "Error: Directory '$TARGET_DIR' does not exist." >&2
    exit 1
fi

# shuffle the list of images and returns the first one
# RANDOM_IMAGE=$(fd -t f -e jpg -e jpeg -e png -e gif -e webp -e bmp . "$TARGET_DIR" | shuf -n 1)
RANDOM_IMAGE=$(fd -t f . "$TARGET_DIR" | shuf -n 1)

if [ -z "$RANDOM_IMAGE" ]; then
    echo "No images found in '$TARGET_DIR'." >&2
    exit 1
fi

~/.scripts/./nsxiv-rifle.sh "$RANDOM_IMAGE"
