------------------------------------------------------------------
-------------------CONTACTABLE GUESTS MART------------------------
-- OBJECTIVE: IDENTIFY REACHABLE GUEST WITH VALID EMAIL
-- ENABLE CRM AND MARKETING ACTIVATION
------------------------------------------------------------------

SELECT
DISTINCT ON (hotel_name || '_' || reservation_id) *
FROM {{ ref('fct_guests_database') }}
