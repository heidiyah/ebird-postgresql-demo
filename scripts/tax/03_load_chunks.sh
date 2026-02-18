#!/bin/bash
# Purpose: load data into database by chunks, table by table
# Table: taxonomy

CHUNK_DIR="/taxonomy_chunks"               # path to table chunks
LOG_DIR="/taxonomy_chunks/copy_logs"       # path to error logs
DB="ebird"                                 # database name
USER="postgres"                            # database username
TABLE="taxonomy_temp"                      # temporary table name (will isolate rows based on desired primary key later)

# --- Copy table chunks into database ---
for f in "$CHUNK_DIR"/*; do
  base=$(basename "$f")
  psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$f' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/$base.out" 2> "$LOG_DIR/$base.err"
done