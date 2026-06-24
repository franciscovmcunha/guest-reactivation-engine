# Guest Warehouse

## Overview

The Guest Warehouse is the analytical core of the Guest Reactivation Engine.

Built with dbt, it transforms raw hospitality data into business-ready datasets.

The warehouse follows a layered architecture:

Bronze

↓

Silver

↓

Gold

---

## Silver Layer

Purpose:

- Cleaning
- Standardization
- Validation
- Integration
- Feature Engineering

Models:

- stg_guests
- guests_dataset_normalization
- fct_guests_database

---

## Gold Layer

Purpose:

- CRM datasets
- Guest segmentation
- Business reporting
- Reactivation analysis

---

## Consumers

- Power BI
- Marketing Teams
- CRM Operations
- Revenue Teams