# Bridge: bridge_movie_country

## Purpose

The `bridge_movie_country` table resolves the many-to-many relationship between movies and production countries.

The grain of this table is:

> One row per movie and production country relationship.

---

## Schema

| Column        | Description                           | Source / Transformation |
|---            |---                                    |---
| `movie_key`   | Foreign key referencing `dim_movie`   | Generated during transformation |
| `country_key` | Foreign key referencing `dim_country` | Generated during transformation |

---

## Design Notes

A movie may have multiple production countries.

The bridge table allows analysis by country without introducing repeated country columns within `dim_movie`.

---

## Relationships

```
dim_movie
     |
bridge_movie_country
     |
dim_country
```