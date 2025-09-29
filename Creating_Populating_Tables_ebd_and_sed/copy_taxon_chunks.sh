#!/bin/bash

CHUNK_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/taxon_normalization"
LOG_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/taxon_normalization/copy_logs"
DB="ebird"
USER="postgres"
TABLE="taxon_temp"

for f in "$CHUNK_DIR"/*; do
  base=$(basename "$f")
  psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$f' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/$base.out" 2> "$LOG_DIR/$base.err"
done

