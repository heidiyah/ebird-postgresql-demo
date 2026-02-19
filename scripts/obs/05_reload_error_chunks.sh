#!/bin/bash
# Purpose: reload chunks that produced errors, after addressing cause of error
# Table: observation

CHUNK_DIR="/observation_chunks"               # path to table chunks
LOG_DIR="/observation_chunks/copy_logs"       # path to error logs
DB="ebird"                                 # database name
USER="postgres"                            # database username
TABLE="observation_temp"                      # temporary table name (will isolate rows based on desired primary key later)

# --- Re-copy table chunks that failed due to errors into database ---
for errfile in "$LOG_DIR"/chunk_*.err; do
    if [ -s "$errfile" ]; then
        chunknum=$(basename "$errfile" .err)
        chunkfile="$CHUNK_DIR/${chunknum}"

        psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$chunkfile' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');"

        if [ $? -eq 0 ]; then
            echo "Reload successful: $chunkfile"
        else
            echo "Reload failed: $chunkfile"
        fi
    fi
done