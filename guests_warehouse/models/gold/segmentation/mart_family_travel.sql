------------------------------------------------------------------
---------------------FAMILY TRAVEL MART---------------------------
-- OBJECTIVE: ANALYZE FAMILY TRAVEL BEHAVIOR
-- IDENTIFY HOUSEHOLD AND CHILDREN-RELATED STAYS
-- ENABLE FAMILY-FOCUSED COMMERCIAL STRATEGIES
------------------------------------------------------------------


WITH guest_family_status_dataset AS (
    SELECT
       *
    FROM {{ ref('mart_contactable_guests') }}
),

family_stay_revenue_distribution_analysis AS (
    SELECT
        *,
        CASE
            WHEN adults_count >= 1
            AND(children_count >= 1
            OR infants_count >= 1)
            THEN 'true'
            ELSE 'false'
        END 
        AS is_family_stay
    FROM guest_family_status_dataset
)

SELECT 
    hotel_name,
    SUM(CASE 
        WHEN is_family_stay = 'true'
        THEN 1
        ELSE 0
    END
    ) AS family_status_count
FROM family_stay_revenue_distribution_analysis
GROUP BY 1

