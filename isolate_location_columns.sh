#!/bin/bash

INPUT_FILE="ebd_relJun-2025.txt"
OUTPUT_DIR="location_normalization"
mkdir -p "$OUTPUT_DIR"

# Columns to keep (tab-separated)
COLUMNS="16,17,18,19,20,21,22,23,24,25,26,27,28,29,30"

tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 1000000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
