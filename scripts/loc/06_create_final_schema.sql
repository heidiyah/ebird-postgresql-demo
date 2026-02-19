--Purpose: Create final table schema for filtered data
--Table: Location

--NOTE: Constraints can be assigned now

CREATE TABLE loc (
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
    LOCALITY_ID text UNIQUE NOT NULL PRIMARY KEY,
    LOCALITY_TYPE text,
    LATITUDE numeric(10,7),
    LONGITUDE numeric(10,7)
);