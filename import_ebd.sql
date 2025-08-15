--sample file
\COPY ebird FROM 'Z:\Data Analysis\ebird_data\ebd_relJun-2025\ebd_relJun-2025\one_thou_rows.txt' WITH (FORMAT text, DELIMITER E'\t', HEADER true, NULL '', ENCODING 'UTF8'); 

--full file
\COPY ebird FROM 'Z:\Data Analysis\ebird_data\ebd_relJun-2025\ebd_relJun-2025\ebd_relJun-2025.txt' WITH (FORMAT text, DELIMITER E'\t', HEADER true, NULL '', ENCODING 'UTF8'); 

--truncate
TRUNCATE TABLE ebird RESTART IDENTITY;

--copy server-side
COPY ebird
FROM '/var/lib/postgresql/data/heidi/ebd_relJun-2025/ebd_relJun-2025.txt'
WITH (FORMAT text, DELIMITER E'\t', HEADER true, NULL '', ENCODING 'UTF8');