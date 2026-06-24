# Guest Reactivation Engine

## Overview

Guest Reactivation Engine is a hospitality-focused analytics project designed to transform historical guest data into actionable revenue opportunities.

The project consolidates, standardizes, enriches and segments guest information from multiple hotel properties, creating a centralized customer intelligence layer that supports guest reactivation initiatives, retention strategies and future loyalty programs.

The solution demonstrates a complete analytics workflow, from raw data ingestion through dimensional modeling and business-facing reporting.

**Data Coverage:** January 2015 – June 2026

---

## Business Problem

Hotels spend significant resources acquiring guests through channels such as:

* Booking.com
* Expedia
* Travel Agencies
* Direct Reservations

Despite these acquisition costs, many guests are never contacted again after checkout.

This results in:

* Lost direct booking opportunities
* High OTA dependency
* Reduced customer retention
* Underutilized guest databases
* Lower customer lifetime value

The objective of this project is to identify, segment and prioritize historical guests who can be targeted through future reactivation campaigns.

---

## Solution

The Guest Reactivation Engine creates a centralized guest database by integrating historical reservation data from multiple hotel properties.

The platform applies data cleaning, standardization and business logic to generate guest segments and CRM-ready datasets that support revenue-generating initiatives.

Key outputs include:

* Contactable guest populations
* Reactivation candidate lists
* Family traveler segments
* Weekend traveler segments
* Guest demographic analysis
* Contactability reporting

---

## Architecture

```text
Historical Guest Data (CSV)

            ↓

    PostgreSQL Bronze Layer

            ↓

       dbt Silver Layer

            ↓

        dbt Gold Layer

            ↓

      Power BI Reporting

            ↓

   Guest Reactivation Insights
```

---

## Technology Stack

### Data Storage

* PostgreSQL

### Data Transformation

* dbt Core
* SQL

### Analytics & Reporting

* Power BI

### Data Modeling

* Medallion Architecture
* Star Schema Principles
* Hospitality CRM Analytics

### Version Control

* Git
* GitHub

---

## Data Pipeline

### Bronze Layer

Raw historical guest datasets are ingested into PostgreSQL while preserving source-level fidelity.

Responsibilities:

* Data ingestion
* Source consolidation
* Initial profiling
* Raw storage

### Silver Layer

Data is standardized and integrated into a unified guest dataset.

Responsibilities:

* Data cleaning
* Data normalization
* Guest consolidation
* Business rule application

### Gold Layer

Business-ready marts are created to support CRM analytics and guest reactivation initiatives.

Responsibilities:

* Customer segmentation
* Reactivation targeting
* Reporting datasets
* Executive analytics

---

## Gold Layer Models

### CRM

* mart_contactable_guests
* mart_reactivation_candidates

### Segmentation

* mart_family_travel
* mart_guest_age_analysis
* mart_weekend_travelers

### Reporting

* mart_contactable_distribution

---

## Business Use Cases

### Guest Reactivation

Identify former guests who can be targeted through future marketing campaigns.

### Direct Booking Growth

Reduce OTA dependency by increasing direct reservations from returning guests.

### Customer Segmentation

Create targeted guest groups based on travel patterns and demographics.

### Hospitality Analytics

Support commercial and operational decision-making through guest intelligence.

---

## Repository Structure

```text
guest-reactivation-engine/

├── dashboards/
│   └── screenshots/

├── docs/
│   ├── architecture.md
│   ├── business_case.md
│   ├── dashboard_guide.md
│   ├── data_dictionary.md
│   └── reactivation_strategy.md

├── postgres/
│   └── bronze/

├── guests_warehouse/
│   ├── models/
│   │   ├── silver/
│   │   └── gold/
│   ├── seeds/
│   └── macros/

├── README.md
├── dbt_project.yml
└── profiles.yml
```

---

## Future Roadmap

### Phase 1

Guest Reactivation Campaigns

### Phase 2

Email Automation Workflows

### Phase 3

Guest Loyalty Program Analytics

### Phase 4

Integration with Hospitality Data Platform

### Phase 5

Predictive Retention and Churn Modeling

---

## Skills Demonstrated

* Data Engineering
* Analytics Engineering
* SQL Development
* PostgreSQL
* dbt
* Data Modeling
* Customer Analytics
* Hospitality Analytics
* CRM Segmentation
* Power BI
* Git & GitHub
* Business Intelligence
