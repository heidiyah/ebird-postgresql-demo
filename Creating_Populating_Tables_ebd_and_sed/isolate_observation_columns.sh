#!/bin/bash

INPUT_FILE="ebd_relJun-2025.txt"
OUTPUT_DIR="observation_normalization"
mkdir -p "$OUTPUT_DIR"

# Columns to keep (tab-separated), will select columns in numerical order regardless of what's written here
COLUMNS="1,35,2,6,11,12,13,14,15,51,52,10"

tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 1000000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
