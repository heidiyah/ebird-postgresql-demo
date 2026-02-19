--Purpose: Create final table schema for filtered data
--Table: Observation

--NOTE: Constraints can be assigned now

CREATE TABLE obs (
    GLOBAL_UNIQUE_IDENTIFIER text UNIQUE NOT NULL PRIMARY KEY,
    LAST_EDITED_DATE timestamp,
    COMMON_NAME text REFERENCES taxon(COMMON_NAME),
	EXOTIC_CODE text,
    OBSERVATION_COUNT text, --will need to cast when querying numerically
    BREEDING_CODE text,
    BREEDING_CATEGORY text,
    BEHAVIOR_CODE text,
    AGE_SEX text,
	SAMPLING_EVENT_IDENTIFIER text REFERENCES submission(SAMPLING_EVENT_IDENTIFIER),
    CHECKLIST_COMMENTS text,
    SPECIES_COMMENTS text
);