#!/bin/bash
# Purpose: load data into database, table by table
# Table: SED

FILE="ebd_sampling_relJul-2025.txt"                 # path to file
LOG_DIR="/ebd_sampling_relJul-2025/copy_logs"       # path to error logs
DB="ebird"                                          # database name
USER="postgres"                                     # database username
TABLE="sed"                                         # table name

# --- Make directory if it doesn't exist ---
mkdir -p "$LOG_DIR"

# --- Copy table chunks into database ---
psql -U "$USER" -d "$DB" -c "COPY $TABLE FROM '$FILE' WITH (FORMAT csv, DELIMITER E'\t', HEADER TRUE, NULL '', ENCODING 'UTF8', QUOTE '\"', ESCAPE '\"');" \
    > "$LOG_DIR/sed.out" 2> "$LOG_DIR/sed.err"