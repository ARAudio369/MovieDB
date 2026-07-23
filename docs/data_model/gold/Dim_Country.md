# Dimension: dim_country

## Purpose

The `dim_country` table stores production countries associated with movies within the MovieDB platform.

The grain of this table is:

> One row per unique production country.

The table contains source identifiers, descriptive attributes and warehouse metadata.

---

## Schema

| Column | Description | Source / Transformation |
|---                    |---                                                        |---|
| `country_key`         | Surrogate key used internally within the warehouse        | Generated during transformation |
| `tmdb_country_code`   | ISO country code supplied by TMDb                         | Source |
| `country_name`        | Country name                                              | Source |
| `loaded_datetime`     | Timestamp when the record was loaded into the warehouse   | Generated during ingestion |

---

## Design Notes

### Production Country Relationships

A movie may be associated with one or more production countries.

This relationship is modelled using the `bridge_movie_country` table.

---

### Source Mapping

The ISO country code is retained from TMDb to preserve lineage and support validation against external reference data.

The warehouse uses `country_key` for all downstream relationships.

---

## Relationships

```
dim_movie
     |
bridge_movie_country
     |
dim_country
```