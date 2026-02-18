#!/bin/bash
# Purpose: load data into database by chunks, table by table
# Table: observation

CHUNK_DIR="/observation_chunks"               # path to table chunks
LOG_DIR="/observation_chunks/copy_logs"       # path to error logs
DB="ebird"                                    # database name
USER="postgres"                               # database username
TABLE="observation_temp"                      # temporary table name (will isolate rows based on desired primary key later)

# --- Copy table chunks into database ---
for f in "$CHUNK_DIR"/*; do
  base=$(basename "$f")
  psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$f' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/$base.out" 2> "$LOG_DIR/$base.err"
done