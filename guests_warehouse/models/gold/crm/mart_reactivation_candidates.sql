------------------------------------------------------------------
-----------------REACTIVATION CANDIDATES MART---------------------
-- OBJECTIVE: IDENTIFY CONTACTABLE FORMER GUESTS
-- SUPPORT RETENTION AND REACTIVATION CAMPAIGNS
-- ENABLE TARGETED CRM OUTREACH INITIATIVES
------------------------------------------------------------------

WITH reactivation_canditates AS (

    SELECT
        *
    FROM {{ ref('mart_contactable_guests') }}
    WHERE email_is_valid = true


)

SELECT
        reservation_id,
        guest_name,
        birth_date,
        guest_age,
        age_segment,
        gender,
        guest_type,
        check_in_date,
        check_out_date,
        stay_pattern,
        is_weekend_traveler,
        room_id,
        room_category,
        source_company,
        reservation_guests_count,
        adults_count,
        children_count,
        infants_count,
        has_children,
        has_infants,
        room_tariff,
        stay_revenue,
        is_high_value_stay,
        stay_status,
        reservation_status,
        email,
        country,
        hotel_name
FROM reactivation_canditates

