--Purpose: Create table schema for unfiltered data
--Table: Location

--NOTE: For faster INSERT constraints are assigned after initial ingestion

CREATE TABLE loc_temp (
    COUNTRY text,
    COUNTRY_CODE text,
    STATE text,
    STATE_CODE text,
    COUNTY text,
    COUNTY_CODE text,
    IBA_CODE text,
    BCR_CODE text,
    USFWS_CODE text,
    ATLAS_BLOCK text,
    LOCALITY text,
    LOCALITY_ID text,
    LOCALITY_TYPE text,
    LATITUDE numeric(10,7),
    LONGITUDE numeric(10,7)
);