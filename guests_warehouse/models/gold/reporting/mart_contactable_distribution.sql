------------------------------------------------------------------
-------------------CONTACTABLE GUESTS MART------------------------
-- OBJECTIVE: IDENTIFY REACHABLE GUEST POPULATIONS PER HOTEL
-- CONSOLIDATE VALID EMAIL
-- ENABLE CRM AND MARKETING ACTIVATION
------------------------------------------------------------------



WITH guests_database AS (
    SELECT *
    FROM {{ ref('fct_guests_database') }}
)

SELECT
    hotel_name,
    COUNT(DISTINCT(reservation_id)) 
    AS total_guests,
    COUNT(DISTINCT reservation_id)
        FILTER (WHERE email_is_valid = true)
        AS contactable_guests,
    COUNT(DISTINCT reservation_id)
        FILTER (WHERE email_is_valid = false)
        AS non_contactable_guests,
    ROUND(
        100.0 *
        COUNT(DISTINCT reservation_id)
            FILTER (WHERE email_is_valid = true)
        /
        NULLIF(COUNT(DISTINCT reservation_id),0),
        2
    ) AS contactability_rate
FROM guests_database
GROUP BY hotel_name



