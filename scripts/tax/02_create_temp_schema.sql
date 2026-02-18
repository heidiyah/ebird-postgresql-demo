--Purpose: Create table schema for unfiltered data
--Table: Taxonomy

--NOTE: For faster INSERT constraints are assigned after initial ingestion

CREATE TABLE tax_temp (
    TAXONOMIC_ORDER int,
    TAXON_CONCEPT_ID text,
    CATEGORY text,
    COMMON_NAME text,
    SCIENTIFIC_NAME text,
    SUBSPECIES_COMMON_NAME text,
    SUBSPECIES_SCIENTIFIC_NAME text
);