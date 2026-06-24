# Guest Reactivation Engine

## Overview

Guest Reactivation Engine is a hospitality-focused customer intelligence project designed to transform historical hotel guest data into actionable business opportunities.

The project consolidates, cleans, enriches and segments guest information from multiple properties, creating a foundation for guest reactivation campaigns, customer retention initiatives and future loyalty programs.

Data coverage spans from January 2015 to June 2026.

Hotels included:

- Alecrim ao Chiado
- Casa Palmela
- Alfama Yellow House

---

## Business Problem

Hotels invest significant resources acquiring guests through:

- Booking.com
- Expedia
- Travel Agencies
- Direct Channels

After checkout, most guests are never contacted again.

This creates missed opportunities:

- Lost direct bookings
- High OTA dependency
- Low guest retention
- Untapped customer lifetime value

This project aims to identify, segment and reactivate historical guests using existing customer data.

---

## Objectives

### Primary

- Build a centralized guest database
- Identify contactable guests
- Create guest segments
- Support reactivation campaigns
- Increase direct bookings

### Secondary

- Reduce OTA dependency
- Improve guest retention
- Enable future loyalty programs
- Support hospitality analytics

---

## Architecture

CSV Historical Data

↓

PostgreSQL Bronze Layer

↓

dbt Silver Layer

↓

dbt Gold Layer

↓

Power BI Dashboards

---

## Technology Stack

- PostgreSQL
- dbt
- SQL
- Power BI

---

## Gold Layer

### CRM

- mart_contactable_guests
- mart_reactivation_candidates

### Segmentation

- mart_guest_age_analysis
- mart_family_travel
- mart_weekend_travelers

### Reporting

- mart_contactable_distribution

---

## Future Roadmap

### Phase 1

Guest Reactivation Campaigns

### Phase 2

Email Automation

### Phase 3

Loyalty Program

### Phase 4

Hospitality Data Platform Integration

---

## Repository Structure

postgres/
    bronze/

guests_warehouse/
    models/
        silver/
        gold/

dashboards/
docs/