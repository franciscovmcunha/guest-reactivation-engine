-----------------------------------------------------------------
--------------------HOSPITALITY ANALYTICS------------------------
----------------------BY FRANCISCO CUNHA-------------------------
-----------------------------------------------------------------

-------------------------BRONZE LAYER----------------------------
--OBJECTIVE: INGESTION OF THE RAW DATA, WITHOUT ANY MODIFICATION-
-----------------------------------------------------------------

------------------------TABLE CREATION---------------------------
-- NAME: bronze.raw_guests_2015_2026_casa_palmela
-- Historical guests records for Casa Palmela Hotel
-- covering stays between 2015-01-01 and 2026-06-01.
------------------------------------------------------------------

DROP TABLE IF EXISTS bronze.raw_guest_2015_2026_casa_palmela;
CREATE TABLE bronze.raw_guest_2015_2026_casa_palmela (
reservation_id TEXT,
is_group TEXT,
is_registrated TEXT,
guest_name TEXT,
guest_first_name TEXT,
guest_last_name TEXT,
age TEXT,
birth_date TEXT,
gender TEXT,
country TEXT,
address TEXT,
check_in_date TEXT,
check_out_date TEXT,
room_number TEXT,
room_category TEXT,
is_adult TEXT,
guest_type TEXT,
source_company TEXT,
is_bed_and_breakfast TEXT,
pax TEXT,
room_tariff TEXT,
stay_status TEXT,
reservation_status TEXT,
tax_number TEXT,
email TEXT

);

----------------------------------------------------------------
----------------------SAMPLE BRONZE LAYER-----------------------

SELECT *
FROM bronze.raw_guest_2015_2026_casa_palmela
LIMIT 5;

----------------------------------------------------------------