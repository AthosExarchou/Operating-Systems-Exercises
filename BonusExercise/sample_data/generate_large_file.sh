#!/bin/bash
#Script to generate a ~461 MB test file for the Bonus Exercise
#Author: Athanasios Exarchou (it2022134)

OUTPUT_DIR="sample_data"
OUTPUT_FILE="$OUTPUT_DIR/largeFile.txt"
TARGET_SIZE=$((461 * 1024 * 1024)) #461 MB in bytes

#Ensures sample_data exists
mkdir -p "$OUTPUT_DIR"

echo "Generating $OUTPUT_FILE (~461 MB)..."

#Uses /dev/urandom to fill with random numbers 0–99
#Each number is written as 2 digits + space (≈3 bytes per number)
bytes_written=0
while [ $bytes_written -lt $TARGET_SIZE ]; do
  echo -n "$((RANDOM % 100)) " >> "$OUTPUT_FILE"
  bytes_written=$(stat -c %s "$OUTPUT_FILE")
done

echo "Created $(stat -c %s "$OUTPUT_FILE") bytes (~$(du -h "$OUTPUT_FILE" | cut -f1))."
