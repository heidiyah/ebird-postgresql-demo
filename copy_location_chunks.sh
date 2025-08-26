#!/bin/bash

CHUNK_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/location_normalization"
LOG_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/location_normalization/copy_logs"
DB="ebird"
USER="postgres"
TABLE="location_temp"

for f in "$CHUNK_DIR"/*; do
  base=$(basename "$f")
  psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$f' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/$base.out" 2> "$LOG_DIR/$base.err"
done


#for rerunning error files:

# CHUNK_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/submission_normalization"
# LOG_DIR="/var/lib/postgresql/data/heidi/ebd_relJun-2025/submission_normalization/copy_logs"
# DB="ebird"
# USER="postgres"
# TABLE="submission_temp"

# for errfile in "$LOG_DIR"/chunk_*.err; do
#     if [ -s "$errfile" ]; then
#         chunknum=$(basename "$errfile" .err)
#         chunkfile="$CHUNK_DIR/${chunknum}"

#         psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$chunkfile' WITH (FORMAT csv, DELIMITER E'\t', NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');"

#         if [ $? -eq 0 ]; then
#             echo "Reload successful: $chunkfile"
#         else
#             echo "Reload failed: $chunkfile"
#         fi
#     fi
# done