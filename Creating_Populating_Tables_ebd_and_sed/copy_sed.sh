# !/bin/bash

FILE="/var/lib/postgresql/data/heidi/ebd_sampling_relJul-2025/ebd_sampling_relJul-2025/ebd_sampling_relJul-2025.txt"
LOG_DIR="/var/lib/postgresql/data/heidi/ebd_sampling_relJul-2025/ebd_sampling_relJul-2025/copy_logs"
DB="ebird"
USER="postgres"
TABLE="sed_temp"

mkdir -p "$LOG_DIR"

psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$FILE' WITH (FORMAT csv, DELIMITER E'\t', HEADER TRUE, NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/sed.out" 2> "$LOG_DIR/sed.err"