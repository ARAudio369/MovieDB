# Dimension: dim_language

## Purpose

The `dim_language` table stores spoken languages associated with movies within the MovieDB platform.

The grain of this table is:

> One row per unique spoken language.

The table contains source identifiers, descriptive attributes and warehouse metadata.

---

## Schema

| Column                | Description                                               | Source / Transformation |
|---                    |---                                                        |---|
| `language_key`        | Surrogate key used internally within the warehouse        | Generated during transformation |
| `tmdb_language_code`  | ISO language code supplied by TMDb                        | Source |
| `language_name`       | Language name                                             | Source |
| `loaded_datetime`     | Timestamp when the record was loaded into the warehouse   | Generated during ingestion |

---

## Design Notes

### Spoken Language Relationships

A movie may contain dialogue in multiple languages.

This relationship is modelled using the `bridge_movie_language` table.

The movie's primary language is stored separately in `dim_movie` as `original_language`.

---

### Source Mapping

The ISO language code is retained from TMDb to preserve lineage and support validation against external reference data.

The warehouse uses `language_key` for all downstream relationships.

---

## Relationships

```
dim_movie
     |
bridge_movie_language
     |
dim_language
```