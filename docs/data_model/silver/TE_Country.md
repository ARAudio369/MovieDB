# Trusted Entity: TE_Country

## Purpose

The `TE_Country` table stores production country reference data extracted from the TMDb API.

The grain of this table is:

> One row per unique production country.

---

## Schema

| Column            | Description                                   | Source / Transformation |
|---                |---                                            |---|
| `country_code`    | ISO country code                              | Source |
| `country_name`    | Country name                                  | Source |
| `loaded_datetime` | Timestamp the record entered the Silver layer | Generated during ingestion |

---

## Design Notes

Country reference data is standardised to support consistent reporting and downstream dimensional modelling.

---

## Downstream Usage

```
TE_Country
      |
      v
DIM_Country
```