--------------------GUEST AGE ANALYSIS MART-----------------------
-- OBJECTIVE: ANALYZE AGE DISTRIBUTION OF GUESTS
-- IDENTIFY AGE-BASED CUSTOMER SEGMENTS
-- ENABLE DEMOGRAPHIC PERFORMANCE ANALYSIS
------------------------------------------------------------------

SELECT
	hotel_name,
	age_segment,
    COUNT(*)
FROM {{ ref('mart_reactivation_candidates') }}
GROUP BY age_segment, hotel_name
HAVING age_segment <> 'youthful_traveler'
AND age_segment <> 'child'
ORDER BY hotel_name