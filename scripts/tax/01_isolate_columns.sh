#!/bin/bash
# Purpose: split large eBird master file into manageable chunks for database import, table by table
# Table: taxonomy

INPUT_FILE="ebd_relJun-2025.txt"        # path to the master file
OUTPUT_DIR="taxonomy_chunks"     # folder to store chunks

# --- Create output directory if it doesn't exist ---
mkdir -p "$OUTPUT_DIR"

# --- Columns to keep (tab-separated) ---
COLUMNS="3,4,5,6,7,8,9"

# --- Split master file into chunks with desired columns ---
tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 600000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
