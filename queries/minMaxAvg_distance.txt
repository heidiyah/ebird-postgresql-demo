SELECT 
    MIN(effort_distance_km) AS min_distance,
    MAX(effort_distance_km) AS max_distance,
    AVG(effort_distance_km) AS avg_distance
FROM sub
WHERE effort_distance_km IS NOT NULL;