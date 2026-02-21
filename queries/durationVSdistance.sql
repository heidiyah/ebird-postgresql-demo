-- Pulls the distance and duration of each submission

SELECT duration_minutes, effort_distance_km
FROM sub
WHERE duration_minutes IS NOT NULL
  AND effort_distance_km IS NOT NULL;