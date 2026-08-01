# Trusted Entity: TE_Movie_Country

## Purpose

The `TE_Movie_Country` table stores the relationship between movies and their production countries.

The grain of this table is:

> One row per movie and production country relationship.

---

## Schema

| Column            | Description                                   | Source / Transformation |
|---                |---                                            |---|
| `tmdb_movie_id`   | TMDb movie identifier                         | Source |
| `country_code`    | ISO production country code                   | Source |
| `loaded_datetime` | Timestamp the record entered the Silver layer | Generated during ingestion |

---

## Design Notes

Movies may have multiple production countries.

The nested TMDb array is flattened into one row per movie/country combination.

---

## Downstream Usage

```
TE_Movie_Country
         |
         v
Bridge_Movie_Country
```