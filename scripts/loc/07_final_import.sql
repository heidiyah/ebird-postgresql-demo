--Purpose: Import data from staging table to final table w/ constraints and a SELECT DISTINCT on primary key for normalization
--Table: Location

INSERT INTO loc (
    COUNTRY,
    COUNTRY_CODE,
    STATE,
    STATE_CODE,
    COUNTY,
    COUNTY_CODE,
    IBA_CODE,
    BCR_CODE,
    USFWS_CODE,
    ATLAS_BLOCK,
    LOCALITY,
    LOCALITY_ID,
    LOCALITY_TYPE,
    LATITUDE,
    LONGITUDE
)
SELECT DISTINCT ON (LOCALITY_ID) *
FROM loc_temp;