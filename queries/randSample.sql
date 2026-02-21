-- Pulls random rows based on desired percentage, shows top 10 species from selection

WITH sample_obs AS (
    SELECT *
    FROM obs TABLESAMPLE SYSTEM (0.001)  -- adjust fraction to get ~1000 rows
    WHERE observation_count <> 'X'
)
SELECT t.common_name, SUM(sample_obs.observation_count::bigint) AS total_obs
FROM sample_obs
JOIN tax AS t
    ON sample_obs.common_name = t.common_name  -- use correct FK if different
GROUP BY t.common_name
ORDER BY total_obs DESC
LIMIT 10;