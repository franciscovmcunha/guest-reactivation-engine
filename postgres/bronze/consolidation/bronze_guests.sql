-----------------------------------------------------------------
--------------------HOSPITALITY ANALYTICS------------------------
----------------------BY FRANCISCO CUNHA-------------------------
-----------------------------------------------------------------

-----------------BRONZE RESERVATIONS CONSOLIDATION---------------
-- OBJECTIVE: CONSOLIDATE RESERVATIONS DATA ACROSS HOTELS
-- CREATE A SINGLE BRONZE RESERVATIONS DATASET
-- PRESERVE SOURCE HOTEL IDENTIFICATION
-----------------------------------------------------------------

-----------------------------------------------------------------
------------------------SOURCE DATASETS--------------------------
-- OBJECTIVE: COMBINE RAW GUESTS DATA
-- INTEGRATE MULTIPLE HOTEL SOURCES
-----------------------------------------------------------------

-- Source:
-- raw_guest_2015_2026_alecrim_ao_chiado
-- raw_guest_2015_2026_hotel_casa_palmela
-- raw_guest_2015_2026_alfama_yellow_house

-----------------------------------------------------------------
-----------------------BUSINESS CONTEXT--------------------------
-- OBJECTIVE: SUPPORT CROSS-PROPERTY ANALYTICS
-- PREPARE DATA FOR CUSTOMER INTELLIGENCE
-----------------------------------------------------------------

-- Each source dataset contains guest information extracted
-- from a specific hotel PMS environment.

-- The consolidation process preserves original records and
-- does not perform deduplication or identity resolution.

-- Hotel identification attributes are added to support:
-- Guest 360
-- Cross-property guest analysis
-- Marketing segmentation
-- Customer reactivation campaigns

-----------------------------------------------------------------
----------------------CONSOLIDATION LOGIC------------------------
-- OBJECTIVE: MERGE HOTEL DATASETS
-- PRESERVE RECORD-LEVEL GRANULARITY
-----------------------------------------------------------------

CREATE TABLE bronze.guests_dataset AS (
	 SELECT *,
	 'Alfama Yellow House' AS hotel_name
	 FROM bronze.raw_guest_2015_2026_alfama_yellow_house
	 UNION ALL
	 SELECT *,
	 'Alecrim ao Chiado' AS hotel_name
	 FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
	 UNION ALL
	 SELECT *,
	 'Casa Palmela' AS hotel_name
	 FROM bronze.raw_guest_2015_2026_casa_palmela	 
);

-----------------------------------------------------------------
-------------------SAMPLE CONSOLIDATED DATASET-------------------
SELECT *
FROM bronze.guests_dataset
LIMIT 100
