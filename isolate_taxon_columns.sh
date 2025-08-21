#!/bin/bash

INPUT_FILE="ebd_relJun-2025.txt"
OUTPUT_DIR="taxon_normalization"
mkdir -p "$OUTPUT_DIR"

# Columns to keep (tab-separated)
COLUMNS="3,4,5,6,7,8,9"

tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 600000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
