--initial table import
CREATE TABLE ebird (
    GLOBAL_UNIQUE_IDENTIFIER text,
    LAST_EDITED_DATE timestamp,
    TAXONOMIC_ORDER text,
    CATEGORY text,
    TAXON_CONCEPT_ID text,
    COMMON_NAME text,
    SCIENTIFIC_NAME text,
    SUBSPECIES_COMMON_NAME text,
    SUBSPECIES_SCIENTIFIC_NAME text,
    EXOTIC_CODE text,
    OBSERVATION_COUNT text,
    BREEDING_CODE text,
    BREEDING_CATEGORY text,
    BEHAVIOR_CODE text,
    AGE_SEX text,
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
    LATITUDE float,
    LONGITUDE float,
    OBSERVATION_DATE date,
    TIME_OBSERVATIONS_STARTED time,
    OBSERVER_ID text,
    OBSERVER_ORCID_ID text,
    SAMPLING_EVENT_IDENTIFIER text,
    OBSERVATION_TYPE text,
    PROTOCOL_NAME text,
    PROTOCOL_CODE text,
    PROJECT_NAMES text,
    PROJECT_IDENTIFIERS text,
    DURATION_MINUTES float,
    EFFORT_DISTANCE_KM float,
    EFFORT_AREA_HA float,
    NUMBER_OBSERVERS float,
    ALL_SPECIES_REPORTED int,
    GROUP_IDENTIFIER text,
    HAS_MEDIA int,
    APPROVED int,
    REVIEWED int,
    REASON text,
    CHECKLIST_COMMENTS text,
    SPECIES_COMMENTS text
)

--creating orthogonal tables

CREATE TABLE taxon (
    TAXONOMIC_ORDER int,
    TAXON_CONCEPT_ID text,
    CATEGORY text,
    COMMON_NAME text UNIQUE NOT NULL PRIMARY KEY,
    SCIENTIFIC_NAME text,
    SUBSPECIES_COMMON_NAME text,
    SUBSPECIES_SCIENTIFIC_NAME text
);

CREATE TABLE observation (
    GLOBAL_UNIQUE_IDENTIFIER text UNIQUE NOT NULL PRIMARY KEY,
    SAMPLING_EVENT_IDENTIFIER text REFERENCES submission(SAMPLING_EVENT_IDENTIFIER),
    LAST_EDITED_DATE timestamp,
    COMMON_NAME text REFERENCES taxon(COMMON_NAME),
    OBSERVATION_COUNT text, --will need to cast when querying numerically
    BREEDING_CODE text,
    BREEDING_CATEGORY text,
    BEHAVIOR_CODE text,
    AGE_SEX text,
    CHECKLIST_COMMENTS text,
    SPECIES_COMMENTS text,
    EXOTIC_CODE text
);

CREATE TABLE submission (
    LOCALITY_ID text REFERENCES location(LOCALITY_ID),
    OBSERVATION_DATE date,
    TIME_OBSERVATIONS_STARTED time,
    OBSERVER_ID text,
    OBSERVER_ORCID_ID text,
    SAMPLING_EVENT_IDENTIFIER text UNIQUE NOT NULL PRIMARY KEY,
    OBSERVATION_TYPE text,
    PROTOCOL_NAME text,
    PROTOCOL_CODE text,
    PROJECT_NAMES text,
    PROJECT_IDENTIFIERS text,
    DURATION_MINUTES smallint,
    EFFORT_DISTANCE_KM numeric(8,3),
    EFFORT_AREA_HA numeric(8,3),
    NUMBER_OBSERVERS smallint,
    ALL_SPECIES_REPORTED boolean,
    GROUP_IDENTIFIER text,
    HAS_MEDIA boolean,
    APPROVED boolean,
    REVIEWED boolean,
    REASON text
);

CREATE TABLE location (
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

--Populate tables from master table, positions must match
INSERT INTO table_name (
    column_1,
    column_2,
    ...
)
SELECT --DISTINCT ON (PKEY column) 
    column_1,
    column_2,
    ...
FROM ebird;