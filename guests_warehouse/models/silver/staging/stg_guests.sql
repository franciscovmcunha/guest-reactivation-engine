{{ config(
    materialized='view'
) }}

SELECT *
FROM bronze.guests_dataset