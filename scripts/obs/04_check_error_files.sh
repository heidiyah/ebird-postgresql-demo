#!/bin/bash
# Purpose: count non-empty PostgreSQL copy error files
# Table: observation

# --- Configuration ---
LOG_DIR="observation_chunks/copy_logs"     # path to copy logs

# --- Count non-empty .err files ---
echo "Checking for non-empty .err files in $LOG_DIR..."
ERROR_COUNT=$(find "$LOG_DIR" -name "*.err" -type f -size +0c | wc -l)

echo "Found $ERROR_COUNT non-empty error file(s)."
