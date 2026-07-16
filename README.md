# MovieDB - Azure Analytics Engineering Project

## Overview

MovieDB is an end-to-end analytics engineering project that ingests movie metadata from The Movie Database (TMDb) API, stores raw source data within Azure, transforms data using dbt, and produces an analytical dimensional model for reporting and insights.

## Objectives

The goal of this project is to design and implement an alaytics dataset based of a tmdb database that makes use of newer cloud technologies as a self-development project.

Key objectives:

- Build an automated ingestion pipeline from the TMDb API
- Store raw source data using Azure cloud services
- Implement a Medallion Architecture approach
- Apply Kimball dimensional modelling principles
- Use dbt to manage SQL transformations, testing, and documentation
- Create a reporting-ready data model for analytical insights
- Demonstrate version control and software engineering practices using GitHub





## Architecture

The platform follows a Medallion Architecture pattern, separating data processing into Bronze, Silver, and Gold layers.

### Bronze Layer

Raw TMDb API responses are stored in Azure Data Lake Storage Gen2 as JSON files. This layer is left un-transformed as a source of truth.

### Silver Layer

Raw data from tge Bronze Layer is loaded into Azure SQL Database where it is cleaned, validated, and built into structured datasets.

### Gold Layer

Here, dbt transformations are used to create analytical models following Kimball dimensional modelling principles. These models are designed with reporting and business intelligence in mind and would then be consumed via Power BI.

### Summaried Data Flow

TMDb API → Python Extraction → Azure Data Lake Storage → Azure SQL Database → dbt → Power BI