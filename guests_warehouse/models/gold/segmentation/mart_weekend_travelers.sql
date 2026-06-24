------------------------------------------------------------------
--------------------WEEKEND TRAVELERS MART------------------------
-- OBJECTIVE: IDENTIFY WEEKEND-ORIENTED GUESTS
-- ANALYZE SHORT-LEISURE AND ESCAPADE PATTERNS
-- ENABLE WEEKEND REACTIVATION CAMPAIGNS
------------------------------------------------------------------

WITH weekend_traveler_dataset AS (
    SELECT DISTINCT ON( hotel_name || '_' || reservation_id) *
    FROM {{ ref('mart_reactivation_candidates') }}
    WHERE is_weekend_traveler = true
)

SELECT
	hotel_name,
    COUNT(*)
FROM weekend_traveler_dataset
WHERE is_weekend_traveler = true
GROUP BY 1
ORDER BY hotel_name