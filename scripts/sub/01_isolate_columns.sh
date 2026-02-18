#!/bin/bash
# Purpose: split large eBird master file into manageable chunks for database import, table by table
# Table: submission

INPUT_FILE="ebd_relJun-2025.txt"        # path to the master file
OUTPUT_DIR="submission_chunks"     # folder to store chunks

# --- Create output directory if it doesn't exist ---
mkdir -p "$OUTPUT_DIR"

# --- Columns to keep (tab-separated) ---
COLUMNS="27,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50"

# --- Split master file into chunks with desired columns ---
tail -n +2 "$INPUT_FILE" \
| cut -f"$COLUMNS" \
| split -l 1000000 -d -a 4 --additional-suffix=.tsv - "$OUTPUT_DIR/chunk_"
