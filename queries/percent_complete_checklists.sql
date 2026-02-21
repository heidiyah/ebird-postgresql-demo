-- Calculates the percentage of complete and incomplete checklists

SELECT 
    all_species_reported,
    COUNT(*) AS count,
    100.0 * COUNT(*) / SUM(COUNT(*)) OVER () AS percent
FROM sub
GROUP BY all_species_reported;