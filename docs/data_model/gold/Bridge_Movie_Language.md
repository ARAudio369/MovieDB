# Bridge: bridge_movie_language

## Purpose

The `bridge_movie_language` table resolves the many-to-many relationship between movies and spoken languages.

The grain of this table is:

> One row per movie and spoken language relationship.

---

## Schema

| Column         | Description                            | Source / Transformation |
|---             |---                                     |---|
| `movie_key`    | Foreign key referencing `dim_movie`    | Generated during transformation |
| `language_key` | Foreign key referencing `dim_language` | Generated during transformation |

---

## Design Notes

A movie may contain multiple spoken languages.

The primary TMDb original language is stored separately in `dim_movie`, while additional spoken languages are represented through this bridge relationship.

---

## Relationships

```
dim_movie
     |
bridge_movie_language
     |
dim_language
```