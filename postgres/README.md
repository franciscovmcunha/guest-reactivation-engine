# Bronze Layer

## Overview

The Bronze Layer represents the raw operational foundation of the Guest Reactivation Engine.

This layer is intentionally developed in PostgreSQL before dbt transformations.

Its purpose is to preserve source-level information while preparing datasets for analytical processing.

---

## Responsibilities

### Ingestion

Raw guest data loading from source files.

Files:

- guests_dataset_ingestion_alecrim_ao_chiado.sql
- guests_dataset_ingestion_alfama_yellow_house.sql
- guests_dataset_ingestion_casa_palmela.sql

---

### Profiling

Data quality assessment and exploratory analysis.

Checks include:

- Null values
- Duplicates
- Data consistency
- Invalid records

File:

- background_analysis.sql

---

### Consolidation

Combines hotel-level datasets into a single guest dataset.

File:

- bronze_guests.sql

---

## Output

Main table:

bronze.guests_dataset

This table acts as the source for all dbt transformations.