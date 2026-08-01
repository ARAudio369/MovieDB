# Trusted Entity: TE_Production_Company

## Purpose

The `TE_Production_Company` table stores cleaned and standardised production company data extracted from the TMDb API.

This table represents the trusted production company entity within the Silver layer and is used to support downstream analytical modelling.

The grain of this table is:

> One row per unique production company.

---

## Schema

| Column            | Description                                    | Source / Transformation |
|---                |---                                             |---|
| `tmdb_company_id` | Unique production company identifier from TMDb | Source |
| `company_name`    | Production company name                        | Source |
| `logo_path`       | TMDb logo image path                           | Source |
| `origin_country`  | Country where the company originates | Source  |
| `loaded_datetime` | Timestamp the record entered the Silver layer  | Generated during ingestion |

---

## Design Notes

The Silver layer retains TMDb identifiers to maintain lineage back to the source system.

Duplicate company records are removed and column naming is standardised.

---

## Downstream Usage

```
TE_Production_Company
          |
          v
DIM_Production_Company
```