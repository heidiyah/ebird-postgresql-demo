--Purpose: Create final table schema for filtered data
--Table: Taxonomy

--NOTE: Constraints can be assigned now

CREATE TABLE tax (
    TAXONOMIC_ORDER int,
    TAXON_CONCEPT_ID text,
    CATEGORY text,
    COMMON_NAME text UNIQUE NOT NULL PRIMARY KEY,
    SCIENTIFIC_NAME text,
    SUBSPECIES_COMMON_NAME text,
    SUBSPECIES_SCIENTIFIC_NAME text
);