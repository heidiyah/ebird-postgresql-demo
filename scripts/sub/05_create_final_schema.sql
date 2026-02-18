--Purpose: Create final table schema for filtered data
--Table: Submission

--NOTE: Constraints can be assigned now

CREATE TABLE sub (
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
    DURATION_MINUTES int,
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