# MovieDB - Azure Analytics Engineering Project

## Project Architecture

The platform follows a **Medallion Architecture** pattern, separating data processing into Bronze, Silver, and Gold layers.

## Bronze Layer

Raw TMDb API responses are extracted using Python and stored in **Azure Data Lake Storage Gen2 (ADLS Gen2)** as JSON files.

This layer remains **untransformed** and acts as the raw source of truth, preserving the original API response for reproducibility and potential reprocessing.

## Silver Layer

Data from the Bronze layer is loaded and transformed using **PySpark**.

The data is cleaned, validated, structured, and converted from JSON into **Parquet**, providing a columnar and compressed storage format designed to reduce storage requirements and improve read efficiency for analytical workloads.

The resulting Parquet datasets are stored back in **Azure Data Lake Storage Gen2**, within the Silver layer.

## Gold Layer

The curated Silver data is loaded into **Azure SQL Database**, where **dbt transformations** are used to create analytical models following **Kimball dimensional modelling principles**.

These models are designed around reporting and business intelligence requirements and are ultimately consumed through **Power BI**.

## Summarised Data Flow

```text
TMDb API
   ↓
Python Extraction
   ↓
Azure Data Lake Storage Gen2
   │
   └── Bronze → Raw JSON
          ↓
       PySpark
          ↓
Azure Data Lake Storage Gen2
   │
   └── Silver → Transformed Parquet
          ↓
Azure SQL Database
          ↓
         dbt
          ↓
Kimball Dimensional Models
          ↓
       Power BI
