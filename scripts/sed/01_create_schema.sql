--Purpose: Create table schema for data
--Table: SED

--NOTE: If the other tables are done first, the SED table can likely be done without a temp table as I did here.

CREATE TABLE sed (
    LAST_EDITED_DATE timestamp,
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
    LOCALITY_ID text, --UNIQUE NOT NULL PRIMARY KEY --REFERENCES location(LOCALITY_ID),,
    LOCALITY_TYPE text,
    LATITUDE numeric(10,7),
    LONGITUDE numeric(10,7),
    OBSERVATION_DATE date,
    TIME_OBSERVATIONS_STARTED time,
    OBSERVER_ID text,
    OBSERVER_ORCID_ID text,
    SAMPLING_EVENT_IDENTIFIER text, --UNIQUE NOT NULL PRIMARY KEY,
    OBSERVATION_TYPE text,
    PROTOCOL_NAME text,
    PROTOCOL_CODE text,
    PROJECT_NAMES text,
    PROJECT_IDENTIFIERS text,
    DURATION_MINUTES int,
    EFFORT_DISTANCE_KM numeric(8,3),
    EFFORT_AREA_HA numeric(8,3),
    NUMBER_OBSERVERS smallint,
    ALL_SPECIES_REPORTED boolean,
    GROUP_IDENTIFIER text,
    CHECKLIST_COMMENTS text
);