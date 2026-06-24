/*======================================================================================================================
AUTHOR: Francisco Cunha
LAYER: SILVER
MODEL: reservation_normalization
OBJECTIVE: STANDARDIZE GUEST'S DATA ATTRIBUTES FOR ANALYTICAL CONSUMPTION
======================================================================================================================*/


------------------------------------------------------------------
--------------------------SOURCE LAYER----------------------------
-- OBJECTIVE: LOAD STANDARDIZED STAGING DATA
-- PROVIDE A CONTROLLED ENTRY POINT FOR TRANSFORMATIONS
------------------------------------------------------------------

WITH standardized_columns AS (
    SELECT 
        reservation_id AS reservation_id,
        guest_name AS guest_name,
        birth_date AS birth_date,    
        gender AS gender,   
        country AS country,
        tax_number AS guest_id,
        guest_type AS guest_type,
        check_in_date AS check_in_date,
        check_out_date AS check_out_date,
        room_number AS room_id,
        room_category AS room_category,
        source_company AS source_company,
        is_bed_and_breakfast AS meal_plan,
        pax AS reservation_guests_count,
        room_tariff AS room_tariff,
        stay_status AS stay_status,
        reservation_status AS reservation_status,
        email AS email,
        hotel_name AS hotel_name
    FROM {{ ref('stg_guests') }}
),





------------------------------------------------------------------
--------------------RESERVATION ID VALIDATION---------------------
-- OBJECTIVE: VALIDATE RESERVATION IDENTIFIERS
-- ENSURE CONSISTENT RESERVATION REFERENCING
------------------------------------------------------------------

reservation_id_normalization AS (
    SELECT 
        
        REGEXP_REPLACE(
            TRIM(reservation_id),
            '\s+',
            '',
            'g'
        ) AS reservation_id,
        REGEXP_REPLACE(
                REGEXP_REPLACE(
                    REGEXP_REPLACE(
                        REGEXP_REPLACE(
                        TRIM(
                            SPLIT_PART(guest_name, ',', 2)
                            || ' ' ||
                            SPLIT_PART(guest_name, ',', 1)
                            ),
                        '(^|\s)(Sr|Sra)\.?(?=\s|$)',
    					' ',
    					'g'
                        ),
                        '\s+',
                        ' ',
                        'g'
                        ),
                        '^\s+|\s+$',
                        '',
                        'g'),
                        '[.]',
                        '',
                        'g')
        AS guest_name,
        birth_date,
        gender,
        country,
        guest_id,
        CASE
            WHEN LOWER(TRIM(guest_type)) = 'grupo'
            THEN 'group'
            WHEN LOWER(TRIM(guest_type)) = 'individuais'
            THEN 'individual'
            WHEN LOWER(TRIM(guest_type)) = 'frequente'
            THEN 'repeat_guest'
            WHEN LOWER(TRIM(guest_type)) = 'vip'
            THEN 'vip'
            ELSE 'unknown'
        END
        AS guest_type,
        check_in_date,
        check_out_date,
        room_id,
        room_category,
        source_company,
        meal_plan,
        reservation_guests_count,
        room_tariff,
        stay_status,
        reservation_status,
        email,
        CASE 
            WHEN LOWER(TRIM(email)) IS NULL
			THEN FALSE
			WHEN LOWER(TRIM(email))LIKE ANY (
				ARRAY  [
                        '%@madridandbeyond.com',
                        '%@pureluxurydreams.com',
                        '%@selectcollection.se',
                        '%@sindipi.com.br',
                        '%@tourdiez.com',
                        '%@travel-tailors.com',
                        '%@travelcounsellors.com',
                        '%@globalia-sistemas.com',
                        '%@globaltravelcollection.com',
                        '%@sunhotels.net',
                        '%@bpaproperty.com',
                        '%@brickelltravel.com',
                        '%@goglobal.travel',
                        '%@hrs.com',
                        '%@bguedes@ouh.pt',
                        '%@sunhotels.com',
                        '%@6tour.com',
                        '%@michaelhatton.com',
                        '%@inter.net.il',
                        '%@planet.nl',
                        '%@viajessingulares.com',
                        '%@1001jouets.fr',
                        '%@127travel.com',
                        '%@BELLSOUTH.NET',
                        '%@viajan.com.br',
                        '%@webbeds.com',
                        '%@widetravel.pt',
                        '%@xtravel.com.br',
                        '%@ADVISOR.BCG.COM',
                        '%@brownshotelgroup.com ',
                        '%@cueproperties.com',
                        '%@dynargie.com',
                        '%@endutex.pt',
                        '%@odisseias.com',
                        '%@olx.com',
                        '%@profinpartners.com ',
                        '%@protravelinc.com',
                        '%@pura-aventura.com',
                        '%@w2m.travel',
                        '%@avoyatravel.com',
                        '%@brownshotelgroup.com',
                        '%@brownshotelgroup.com',
                        '%@hilton.com',
                        '%@exclusive-escapes.com',
                        '%@route-voyages.com',
                        '%@grupomalasa.com',
                        '%@hotelbeds.com',
						'%@guestcentric.com',
						'%@guestcentric.com',
            			'%@guest.booking.com',
                        '%@booking.com',
                        '%@expedia.com',
                        '%@airbnb.com',
                        '%@guest.airbnb.com',
            			'%@m.expediapartnercentral.com',
            			'%@despegar.com',
            			'%@goglobal.travel.com',
            			'%@inter.net.il.com',
            			'%@splendia.com',
						'%@addictionjournal.org',
						'%@interep.com.br',
						'%@veturis.com',
						'%@hrs.de',
                        '%@hrs.com',
                        '%@ouh.pt',
                        '%@sunhotels.com',
                        '%@6tour.com',
                        '%@michaelhatton.com',
                        '%@inter.net.il',
                        '%@planet.nl',
                        '%@split_part',
                        '%@libero.it',
                        '%@telenet.be',
                        '%@6tour.com',
                        '%@abercrombiekent.es',
                        '%@alletravel.co',
                        '%@alletravel.com',
                        '%@amplitudes.com',
                        '%@atlantida.travel',
                        '%@atpi.com',
                        '%@atrapalo.com',
                        '%@aurumtours.de',
                        '%@avoristravel.com',
                        '%@avilareizen.nl',
                        '%@bespoketravelspain.com',
                        '%@bthetravelbrand.com',
                        '%@btwetravelbrand.com',
                        '%@cadencetravel.com',
                        '%@cassistravel.co.uk',
                        '%@competitiontravel.it',
                        '%@connections.be',
                        '%@cxloyalty.com',
                        '%@dclicktourspassion.fr',
                        '%@destinia.com',
                        '%@diariodebordo.tur.br',
                        '%@discovertravel.co.nz',
                        '%@discoverytravel.dk',
                        '%@egencia.eu',
                        '%@embarkbeyond.com',
                        '%@emergingtravel.com',
                        '%@escalabeds.com',
                        '%@esky.com',
                        '%@estravel.ee',
                        '%@expediagroup.com',
                        '%@feriasalacarte.com',
                        '%@flightcentre.co.uk',
                        '%@fora.travel',
                        '%@frosch.com',
                        '%@fvo.travel',
                        '%@gattinoni.it',
                        '%@geostar.pt',
                        '%@globaltravelbooking.es',
                        '%@h-resa.com',
                        '%@happyfewvoyages.com',
                        '%@hooroo.com',
                        '%@hopper.com',
                        '%@hrgworldwide.com',
                        '%@hotel.check24.de',
                        '%@hotelston.com',
                        '%@hoteltravel.com',
                        '%@intriqjourney.com',
                        '%@italcamel.com',
                        '%@jessysreisservice.nl',
                        '%@jettours.com',
                        '%@johnheathtravel.com',
                        '%@kanguroviaggi.com',
                        '%@keytravel.com',
                        '%@kuoni-reisen.ch',
                        '%@largaytravel.com',
                        '%@lesvoyagesmv.com',
                        '%@lets-travel.net',
                        '%@lnltravel.com',
                        '%@lucarviajes.com',
                        '%@marsol.com',
                        '%@matkahaukka.com',
                        '%@metglobal.com',
                        '%@milkandhoneytravels.com',
                        '%@mycwt.com',
                        '%@nmwreiselounge.de',
                        '%@ontheescapetravels.com',
                        '%@operativa.traveltool.es',
                        '%@orinter.com.br',
                        '%@orbit.co.nz',
                        '%@ostrovok.ru',
                        '%@papillon-travel.co.uk',
                        '%@paradisreiser.no',
                        '%@plantelturismo.com.br',
                        '%@portugal-exclusive.com',
                        '%@portugueseways.com',
                        '%@prestigia.com',
                        '%@quintessentiallytravel.com',
                        '%@qunar.com',
                        '%@reiskundig.nl',
                        '%@resia.se',
                        '%@rosemounttravel.co.uk',
                        '%@rumbo.com',
                        '%@sabre.com',
                        '%@saveonresorts.com',
                        '%@selectour.com',
                        '%@smartflyer.com',
                        '%@sportsfanatictravel.com',
                        '%@stubbornmuletravel.com',
                        '%@tboholidays.com',
                        '%@teresaperez.com.br',
                        '%@thetravelclub.nl',
                        '%@titaniumtours.com',
                        '%@travelcounsellors.nl',
                        '%@travelsimplicity.net',
                        '%@traveltino.com',
                        '%@travelxperts.com',
                        '%@triplink.com.br',
                        '%@tripmasters.com',
                        '%@true.travel',
                        '%@tuifrance.com',
                        '%@turitravel.com',
                        '%@vanillatravel.com',
                        '%@vegavigo.com',
                        '%@venturionconcierge.com',
                        '%@verbekereizen.be',
                        '%@viajeseci.es',
                        '%@viajespanorama.com',
                        '%@vivereeviaggiare.it',
                        '%@voyagesmalavoy.com',
                        '%@westexpress.lt',
                        '%@wigwam.travel',
                        '%@w2m.com',
                        '%@yourtravel.nl'
			  	  		])
            THEN FALSE
            ELSE TRUE
        END
        AS email_is_valid,
        hotel_name
    FROM standardized_columns
),


reservation_id_validation AS (
    SELECT
        reservation_id,
        CASE 
            WHEN reservation_id ~ '^[0-9]+/[0-9]+$' 
            THEN TRUE 
            ELSE FALSE
        END
        AS reservation_id_is_valid,
        guest_name,
        birth_date,
        CASE
            WHEN TRIM(
                    LOWER(gender)) = 'masculino'
            THEN 'male'
            ELSE 'female'
        END
        AS gender,
        country,
        guest_id,
        guest_type,
        check_in_date,
        check_out_date,
        room_id,
        room_category,
        source_company,
        meal_plan,
        reservation_guests_count,
        room_tariff,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name
    FROM reservation_id_normalization
),
------------------------------------------------------------------
----------------------DATE NORMALIZATION--------------------------
-- OBJECTIVE: STANDARDIZE TEMPORAL ATTRIBUTES
-- VALIDATE CHECK-IN AND CHECK-OUT CONSISTENCY
------------------------------------------------------------------
date_normalization AS (

    SELECT
        reservation_id,
        reservation_id_is_valid,
        guest_name,
        CASE
    		WHEN birth_date ~ '^\d{2}/\d{2}/\d{4}$'
    		THEN TO_DATE(birth_date, 'DD-MM-YYYY')
    		WHEN birth_date ~ '^\d{2}/\d{2}/\d{2}$'
    		THEN
        		CASE
            		WHEN RIGHT(birth_date, 2)::INT <= EXTRACT(YEAR FROM CURRENT_DATE) % 100
            		THEN TO_DATE(birth_date, 'DD/MM/YY')
            		ELSE TO_DATE(
                		LEFT(birth_date, 6) || '19' || RIGHT(birth_date, 2),
                		'DD/MM/YYYY'
            		)
        		END
		END
        AS birth_date,
        gender,
        country,
        guest_id,
        guest_type,
        TO_DATE(
            TRIM(check_in_date), 'DD/MM/YYYY')
        AS check_in_date,
        TO_DATE(
            TRIM(check_out_date), 'DD/MM/YYYY')
        AS check_out_date,
        CASE
            WHEN reservation_status LIKE ANY (
                    ARRAY [
                        'Anulada',
                        'Reservada',
                        'No-Show'
                    ]
            )
            AND TO_DATE(TRIM(check_out_date), 'DD/MM/YYYY')
                    >=
                 TO_DATE(TRIM(check_in_date), 'DD/MM/YYYY')
            THEN TRUE
            ELSE FALSE
        END
        AS stay_dates_are_valid,
        room_id,
        room_category,
        source_company,
        meal_plan,
        reservation_guests_count,
        room_tariff,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name      
    FROM reservation_id_validation
),

------------------------------------------------------------------
----------------------STATUS NORMALIZATION------------------------
-- OBJECTIVE: STANDARDIZE RESERVATION STATUS VALUES
-- RESERVATION STATUS
-- REDUCE OPERATIONAL STATUS VARIABILITY
------------------------------------------------------------------
status_normalization AS (

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
        meal_plan,
        reservation_guests_count,
        room_tariff,
        CASE 
            WHEN LOWER(
                    TRIM(stay_status)) = 'check-out'
            THEN 'completed'
            ELSE 'booked'
        END
        AS stay_status,
        CASE 
            WHEN LOWER(
                    TRIM(reservation_status)) = 'check-out'
            THEN 'completed'
            WHEN LOWER(
                    TRIM(reservation_status)) = 'no-show'
            THEN 'no-show'
            WHEN LOWER(
                    TRIM(reservation_status)) = 'anulada'
            THEN 'cancelled'
            ELSE 'booked'
        END
        AS reservation_status,
        email,
        email_is_valid,
        hotel_name      
    FROM date_normalization
),
------------------------------------------------------------------
----------------------CHANNEL NORMALIZATION-----------------------
-- OBJECTIVE: STANDARDIZE DISTRIBUTION CHANNEL VALUES
-- IMPROVE COMMERCIAL PERFORMANCE ANALYSIS
------------------------------------------------------------------
channel_normalization AS (

    SELECT
        b.reservation_id,
        b.reservation_id_is_valid,
        b.guest_name,
        b.birth_date,
        b.gender,
        b.country,
        b.guest_id,
        b.guest_type,
        b.check_in_date,
        b.check_out_date,
        b.stay_dates_are_valid,
        b.room_id,
        b.room_category,
        COALESCE(
            sm.standard_source,
            LOWER(TRIM(b.source_company))
        )
        AS source_company,
        CASE
            WHEN LOWER(TRIM(meal_plan)) = 'ro'
            THEN 'room_only'
            WHEN LOWER(TRIM(meal_plan)) = 'bb'
            THEN 'bed_and_breakfast'
            WHEN LOWER(TRIM(meal_plan)) = 'hb'
            THEN 'half_board'
            WHEN LOWER(TRIM(meal_plan)) = 'fb'
            THEN 'full_board'
            ELSE NULL
        END
        AS meal_plan,
        b.reservation_guests_count,
        b.room_tariff,
        b.stay_status,
        b.reservation_status,
        b.email,
        b.email_is_valid,
        b.hotel_name
    FROM status_normalization b

    LEFT JOIN {{ ref('source_mapping') }} sm
        ON LOWER(TRIM(b.source_company))
        =
        LOWER(TRIM(sm.raw_source))

),
------------------------------------------------------------------
----------------------COUNTRY NORMALIZATION-----------------------
-- OBJECTIVE: STANDARDIZE GEOGRAPHIC ATTRIBUTES
-- ENSURE CONSISTENT REPORTING DIMENSIONS
------------------------------------------------------------------
country_normalization AS (
        SELECT
        b.reservation_id,
        b.reservation_id_is_valid,
        b.guest_name,
        b.birth_date,
        b.gender,
        COALESCE(
            cm.standard_country,
            LOWER(TRIM(b.country))
        )
        AS country,
        b.guest_id,
        b.guest_type,
        b.check_in_date,
        b.check_out_date,
        b.stay_dates_are_valid,
        b.room_id,
        b.room_category,
        b.source_company,
        (
        b.source_company IN (
        'booking',
        'expedia',
        'airbnb',
        'unknown_ota'
        )
        ) AS is_ota,
        NOT (
    b.source_company IN (
        'booking',
        'expedia',
        'airbnb',
        'unknown_ota'
        )
        ) AS is_ta,
        b.meal_plan,
        b.reservation_guests_count,
        b.room_tariff,
        b.stay_status,
        b.reservation_status,
        b.email,
        b.email_is_valid,
        b.hotel_name  
    FROM channel_normalization b

    LEFT JOIN {{ ref('country_mapping') }} cm
        ON LOWER(TRIM(b.country))
        =
        LOWER(TRIM(cm.raw_country))
),

------------------------------------------------------------------
-----------------------REVENUE VALIDATION-------------------------
-- OBJECTIVE: VALIDATE FINANCIAL ATTRIBUTES
-- IDENTIFY INVALID OR INCONSISTENT REVENUE VALUES
------------------------------------------------------------------

revenue_normalization_v1 AS (
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
        room_tariff,
        CASE
            WHEN TRIM(room_tariff) LIKE '%EUR'
            THEN TRUE
            ELSE FALSE
        END
        AS room_tariff_is_amount,
        CASE
            WHEN TRIM(room_tariff) NOT LIKE '%EUR'
            THEN LOWER(TRIM(room_tariff))
            ELSE NULL
        END AS room_tariff_rate_plan,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name      
    FROM country_normalization 
),

revenue_normalization_v2 AS (
    SELECT
        b.reservation_id,
        b.reservation_id_is_valid,
        b.guest_name,
        b.birth_date,
        b.gender,
        b.country,
        b.guest_id,
        b.guest_type,
        b.check_in_date,
        b.check_out_date,
        b.stay_dates_are_valid,
        b.room_id,
        b.room_category,
        b.source_company,
        b.is_ota,
        b.is_ta,
        b.meal_plan,
        b.reservation_guests_count,
        CASE 
            WHEN TRIM(b.room_tariff) LIKE '%EUR'
            THEN REPLACE(TRIM(b.room_tariff), 'EUR', '')::NUMERIC
            ELSE NULL
        END
        AS room_tariff,
        b.room_tariff_is_amount,
        COALESCE(
            tm.standard_tariff_plan,
            LOWER(TRIM(b.room_tariff_rate_plan))
        ) AS room_tariff_rate_plan,
        b.stay_status,
        b.reservation_status,
        b.email,
        b.email_is_valid,
        b.hotel_name
    FROM revenue_normalization_v1 b

    LEFT JOIN {{ref('tariff_mapping')}} tm
        ON LOWER(TRIM(b.room_tariff_rate_plan))
        =
        LOWER(TRIM(tm.raw_tariff_plan))

),
------------------------------------------------------------------
----------------------OCCUPANCY VALIDATION------------------------
-- OBJECTIVE: VALIDATE STAY ATTRIBUTES
-- ENSURE CONSISTENCY BETWEEN GUESTS, NIGHTS AND DATES
------------------------------------------------------------------
occupancy_normalization_v1 AS (

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
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 1),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        )
        +
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 2),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        )
        +
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 3),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        ) AS reservation_guests_count,
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 1),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        ) AS adults_count,
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 2),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        ) AS children_count,
        COALESCE(
            NULLIF(
                REGEXP_REPLACE(
                    SPLIT_PART(reservation_guests_count, ' ', 3),
                    '[^0-9]',
                    '',
                    'g'
                ),
                ''
            )::INT,
            0
        ) AS infants_count,
        room_tariff,
        room_tariff_is_amount,
        room_tariff_rate_plan,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name

    FROM revenue_normalization_v2

),

occupancy_normalization_v2 AS (

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
        CASE
            WHEN children_count > 0
                 OR infants_count > 0
            THEN TRUE
            ELSE FALSE
        END AS is_family_trip,

        CASE
            WHEN children_count > 0
            THEN TRUE
            ELSE FALSE
        END AS has_children,

        CASE
            WHEN infants_count > 0
            THEN TRUE
            ELSE FALSE
        END AS has_infants,
        room_tariff,
        room_tariff_is_amount,
        room_tariff_rate_plan,
        stay_status,
        reservation_status,
        email,
        email_is_valid,
        hotel_name

    FROM occupancy_normalization_v1

)

------------------------------------------------------------------
------------------------FINAL PROJECTION--------------------------
-- OBJECTIVE: EXPOSE CLEAN AND STANDARDIZED RESERVATION DATA
-- PROVIDE A REUSABLE SILVER-LEVEL RESERVATION FOUNDATION
------------------------------------------------------------------
    SELECT *    
    FROM occupancy_normalization_v2