# Bridge: bridge_movie_production_company

## Purpose

The `bridge_movie_production_company` table resolves the many-to-many relationship between movies and production companies.

The grain of this table is:

> One row per movie and production company relationship.

---

## Schema

| Column        | Description                                      | Source / Transformation |
|---            |---|---|
| `movie_key`   | Foreign key referencing `dim_movie`              | Generated during transformation |
| `company_key` | Foreign key referencing `dim_production_company` | Generated during transformation |

---

## Design Notes

A movie may have multiple production companies involved in its creation.

Production companies are therefore modelled separately and linked through this bridge table.

---

## Relationships

```
dim_movie
     |
bridge_movie_company
     |
dim_production_company
```