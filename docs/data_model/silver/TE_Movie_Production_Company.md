# Trusted Entity: TE_Movie_Company

## Purpose

The `TE_Movie_Company` table stores the relationship between movies and their production companies.

The grain of this table is:

> One row per movie and production company relationship.

---

## Schema

| Column            | Description                                   | Source / Transformation |
|---                |---                                            |---|
| `tmdb_movie_id`   | TMDb movie identifier                         | Source |
| `tmdb_company_id` | TMDb production company identifier            | Source |
| `loaded_datetime` | Timestamp the record entered the Silver layer | Generated during ingestion |

---

## Design Notes

Production companies are supplied as nested arrays within each movie response.

The Silver layer flattens these arrays into a relational structure.

---

## Downstream Usage

```
TE_Movie_Company
        |
        v
Bridge_Movie_Company
```