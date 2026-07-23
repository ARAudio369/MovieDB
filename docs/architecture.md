# MovieDB Architecture

## Overview

This document describes the architecture and data flow for this project in further depth than the initial README at to-level.

The platform ingests movie metadata from The Movie Database (TMDb) API, stores raw source data in Azure, transforms data using dbt, and provides analytical datasets for reporting.

## High-Level Data Flow

TMDb API
↓
Python Extraction Pipeline
↓
Azure Data Lake Storage Gen2 (Bronze)
↓
Azure SQL Database (Silver) (Or 'TE'/'Trusted Entity' layer)
↓
dbt Transformations
↓
Azure SQL Database (Gold)
↓
Power BI

---

## Bronze Layer

Purpose:
Store raw/unmodified source data from TMDb.

Storage:
Azure Data Lake Storage (Gen2)

Format:
JSON

Characteristics:
- Immutable source data
- Historical snapshots retained
- No business transformations applied

---

## Silver Layer

Purpose:
Create clean, structured datasets suitable for analysis.

Storage:
Azure SQL Database

Transformations:
- Data type standardisation
- Duplicate removal
- Null handling
- Data validation

---

## Gold Layer

Purpose:
Provide reporting-ready analytical models.

Technology:
dbt

Approach:
Kimball dimensional modelling

Expected models to begin with:
- Dimension Movie
- Dimension Genre
- Dimension Studio
- Dimension Country
- Fact Movie Ratings