# Silver Layer

## Overview

The Silver Layer transforms raw guest data into standardized, validated and integrated datasets ready for business consumption.

This layer sits between the PostgreSQL Bronze Layer and the Gold Layer marts.

Its purpose is to improve data quality, apply business rules and create a consistent analytical foundation for downstream reporting and segmentation.

---

## Responsibilities

### Data Standardization

Standardizes:

- Guest names
- Countries
- Source channels
- Tariff information
- Stay information

---

### Data Validation

Validates:

- Email addresses
- Reservation identifiers
- Date consistency
- Revenue values
- Demographic information

---

### Feature Engineering

Creates analytical attributes such as:

- Guest age
- Age segments
- Stay patterns
- Weekend traveler flags
- Family travel flags
- High-value stay flags

---

### Data Integration

Combines all historical hotel guest data into a unified guest model.

---

## Models

### stg_guests

Initial staging model.

Purpose:

- Read Bronze dataset
- Basic standardization
- Initial cleansing

Source:

bronze.guests_dataset

---

### guests_dataset_normalization

Normalization layer.

Purpose:

- Standardize business values
- Apply mappings
- Create derived attributes

Examples:

- Country normalization
- Email domain normalization
- Source normalization
- Tariff normalization

---

### fct_guests_database

Integrated guest fact table.

Purpose:

Create a centralized guest dataset used by all Gold Layer marts.

This model acts as the primary analytical dataset of the project.

---

## Output

Main Table:

silver.fct_guests_database

Used by:

- CRM marts
- Segmentation marts
- Reporting marts