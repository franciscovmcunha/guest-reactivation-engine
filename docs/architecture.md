# Architecture

## Data Flow

CSV Files

↓

PostgreSQL Bronze Layer

↓

dbt Silver Layer

↓

dbt Gold Layer

↓

Power BI Dashboards

---

## Bronze Layer

Purpose:

- Data ingestion
- Profiling
- Consolidation

Output:

bronze.guests_dataset

---

## Silver Layer

Purpose:

- Cleaning
- Standardization
- Integration

Output:

silver.fct_guests_database

---

## Gold Layer

Purpose:

- CRM
- Segmentation
- Reporting

Output:

Business-ready marts for dashboarding and campaign execution.