--Purpose: Import data from staging table to final table w/ constraints and a SELECT DISTINCT on primary key for normalization
--Table: Taxonomy

INSERT INTO tax (
    TAXONOMIC_ORDER,
    CATEGORY,
    TAXON_CONCEPT_ID,
    COMMON_NAME,
    SCIENTIFIC_NAME,
    SUBSPECIES_COMMON_NAME,
    SUBSPECIES_SCIENTIFIC_NAME
)
SELECT DISTINCT ON (COMMON_NAME) *
FROM tax_temp;