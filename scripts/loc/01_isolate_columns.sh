#!/bin/bash
# Purpose: split large eBird master file into manageable chunks for database import, table by table
# Table: location

INPUT_FILE="ebd_relJun-2025.txt"        # path to the master file
OUTPUT_DIR="location_chunks"     # folder to store chunks

# --- Create output directory if it doesn't exist ---
mkdir -p "$OUTPUT_DIR"

# --- Columns to keep (tab-separated) ---
COLUMNS="16,17,18,19,20,21,22,23,24,25,26,27,28,29,30"

# --- Split master file into chunks with desired columns ---
tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 1000000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
