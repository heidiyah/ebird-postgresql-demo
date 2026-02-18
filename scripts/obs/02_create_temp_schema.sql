--Purpose: Create table schema for unfiltered data
--Table: Observation

--NOTE: For faster INSERT constraints are assigned after initial ingestion

CREATE TABLE obs_temp (
    GLOBAL_UNIQUE_IDENTIFIER text,
    LAST_EDITED_DATE timestamp,
    COMMON_NAME text,
	EXOTIC_CODE text,
    OBSERVATION_COUNT text, --will need to cast when querying numerically since some entries are 'X'
    BREEDING_CODE text,
    BREEDING_CATEGORY text,
    BEHAVIOR_CODE text,
    AGE_SEX text,
	SAMPLING_EVENT_IDENTIFIER text,
    CHECKLIST_COMMENTS text,
    SPECIES_COMMENTS text
);