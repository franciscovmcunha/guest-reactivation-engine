------------------------------------------------------------------
----------------------FACT GUESTS DATABESE------------------------
-- OBJECTIVE: CREATE A SINGLE ANALYTICAL RESERVATION DATASET
-- ESTABLISH THE FOUNDATION FOR GOLD MARTS
------------------------------------------------------------------

------------------------------------------------------------------
----------------------GUEST ENRICHMENT----------------------------
-- OBJECTIVE: ENABLE CUSTOMER-CENTRIC ANALYSIS
------------------------------------------------------------------

WITH guest_contact_integration AS (
    SELECT
        reservation_id,
        reservation_id_is_valid,
        guest_name,
        birth_date,
        gender,
        country,
        guest_id,
        guest_type,
        check_in_date,
        check_out_date,
        stay_dates_are_valid,
        room_id,
        room_category,
        source_company,
        is_ota,
        is_ta,
        meal_plan,
        reservation_guests_count,
        adults_count,
        children_count,
        infants_count,
        has_children,
        has_infants,
        room_tariff,
        room_tariff_is_amount,
        room_tariff_rate_plan,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name

    FROM {{ ref('guests_dataset_normalization') }}

),

------------------------------------------------------------------
----------------------STAY ENRICHMENT-----------------------------
-- OBJECTIVE: DERIVE STAY-LEVEL METRICS
-- ENABLE OCCUPANCY AND LENGTH-OF-STAY ANALYSIS
------------------------------------------------------------------
stay_enriched_v1 AS (
    SELECT
    *,
    (check_out_date
    -
    check_in_date)
    AS days_of_stay,
    EXTRACT(
    YEAR
    FROM AGE(CURRENT_DATE, birth_date)
    )::INT
    AS guest_age

    FROM guest_contact_integration
),
stay_enriched_v2 AS (
    SELECT 
    *,
    CASE 
        WHEN days_of_stay = 1
        THEN 'one_night_stay'
        WHEN days_of_stay BETWEEN 2 AND 3
        THEN 'short_stay'
        WHEN days_of_stay BETWEEN 4 AND 6
        THEN 'weekly_stay'
        WHEN days_of_stay BETWEEN 7 and 9
        THEN 'long_stay'
        ELSE 'extended_holiday'
    END
    AS stay_pattern,
    CASE
        WHEN EXTRACT(DOW FROM check_in_date) IN (5, 6)
        AND days_of_stay >= 2
        THEN TRUE
        ELSE FALSE
    END
    AS is_weekend_traveler,
    CASE
        WHEN guest_age < 18
        THEN 'child'
        WHEN guest_age BETWEEN 18 AND 24
        THEN 'youthful_traveler'
        WHEN guest_age BETWEEN 25 AND 34
        THEN 'young_adult'
        WHEN guest_age BETWEEN 35 AND 49
        THEN 'adult'
        WHEN guest_age BETWEEN 50 AND 64
        THEN 'mature_adult'
        WHEN guest_age >= 65
        THEN 'senior'
        ELSE 'unknown'
    END
    AS age_segment
    FROM stay_enriched_v1
),

------------------------------------------------------------------
----------------------COMMERCIAL ENRICHMENT-----------------------
-- OBJECTIVE: CONSOLIDATE REVENUE AND CHANNEL ATTRIBUTES
-- ENABLE COMMERCIAL PERFORMANCE ANALYSIS
------------------------------------------------------------------

commercial_enrichment_v1 AS (
    SELECT
    *,
    CASE
        WHEN room_tariff IS NOT NULL
        THEN days_of_stay * room_tariff
    END
    AS stay_revenue
    FROM stay_enriched_v2
),
commercial_enrichment_v2 AS (
    SELECT
    *,
    CASE
        WHEN stay_revenue >= 1200
        THEN TRUE
        ELSE FALSE
    END
    AS is_high_value_stay
    FROM commercial_enrichment_v1
)

------------------------------------------------------------------
----------------------FINAL PROJECTION----------------------------
-- OBJECTIVE: EXPOSE A UNIFIED RESERVATION FACT TABLE
-- PROVIDE A REUSABLE FOUNDATION FOR BUSINESS MARTS
------------------------------------------------------------------

    SELECT
        reservation_id,
        reservation_id_is_valid,
        guest_id,
        guest_name,
        birth_date,
        guest_age,
        age_segment,
        gender,
        country,
        guest_type,
        check_in_date,
        check_out_date,
        stay_pattern,
        is_weekend_traveler,
        stay_dates_are_valid,
        room_id,
        room_category,
        source_company,
        is_ota,
        is_ta,
        meal_plan,
        reservation_guests_count,
        adults_count,
        children_count,
        infants_count,
        has_children,
        has_infants,
        room_tariff,
        room_tariff_is_amount,
        room_tariff_rate_plan,
        stay_revenue,
        is_high_value_stay,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name
    FROM commercial_enrichment_v2