#!/bin/bash
#Script to generate a ~461 MB test file for the Bonus Exercise
#Author: Athanasios Exarchou (it2022134)

OUTPUT_DIR="sample_data"
OUTPUT_FILE="$OUTPUT_DIR/largeFile.txt"
TARGET_SIZE=$((461 * 1024 * 1024)) #461 MB in bytes

#Ensures sample_data exists
mkdir -p "$OUTPUT_DIR"

echo "Generating $OUTPUT_FILE (~461 MB)..."

#Use base64 on /dev/urandom, then cut to size
base64 /dev/urandom | tr -dc '0-9 \n' | head -c "$TARGET_SIZE" > "$OUTPUT_FILE"

echo "Done! Created $(stat -c %s "$OUTPUT_FILE") bytes (~$(du -h "$OUTPUT_FILE" | cut -f1))."
