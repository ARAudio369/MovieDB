# Dimension: dim_production_company

## Purpose

The `dim_production_company` table stores production companies associated with movies within the MovieDB platform.

The grain of this table is:

> One row per unique production company.

The table contains source identifiers, descriptive attributes and warehouse metadata.

---

## Schema

| Column | Description | Source / Transformation |
|---                |---                                                        |---|
| `company_key`     |    Surrogate key used internally within the warehouse     | Generated during transformation |
| `tmdb_company_id` | Unique production company identifier from TMDb | Source   |
| `company_name`    | Production company name                                   | Source |
| `loaded_datetime` | Timestamp when the record was loaded into the warehouse   | Generated during ingestion |

---

## Design Notes

### Production Company Relationships

A movie may be associated with one or more production companies.

This relationship is modelled using the `bridge_movie_company` table.

---

### Source Mapping

The `tmdb_company_id` column is retained to preserve lineage back to the source system.

The warehouse uses `company_key` for all downstream relationships.

---

## Relationships

```
dim_movie
     |
bridge_movie_company
     |
dim_production_company
```