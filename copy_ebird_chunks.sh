#!/bin/bash

CHUNK_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/split_chunks"
LOG_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/copy_logs"
DB="ebird"
USER="postgres"
TABLE="ebird"

for f in "$CHUNK_DIR"/*; do
  base=$(basename "$f")
  psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$f' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/$base.out" 2> "$LOG_DIR/$base.err"
done

