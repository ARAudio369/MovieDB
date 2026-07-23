# Dimension: dim_genre

## Purpose

The `dim_genre` table stores the genres associated with movies within the MovieDB platform.

The grain of this table is:

> One row per unique movie genre.

The table contains source identifiers, descriptive attributes and warehouse metadata.

---

## Schema

| Column            | Description                                             | Source / Transformation |
|---                |---                                                      |---|
| `genre_key`       | Surrogate key used internally within the warehouse      | Generated during transformation |
| `tmdb_genre_id`   | Unique genre identifier from The Movie Database (TMDb)  | Source |
| `genre_name`      | Genre name                                              | Source |
| `loaded_datetime` | Timestamp when the record was loaded into the warehouse | Generated during ingestion |

---

## Design Notes

### Genre Relationships

A movie may belong to one or more genres.

To support this many-to-many relationship, genres are linked to movies through the `bridge_movie_genre` table rather than being stored directly within `dim_movie`.

This approach maintains a normalised dimensional model and avoids repeating genre columns within the movie dimension.

---

### Source Mapping

The `tmdb_genre_id` column is retained to preserve lineage back to the source system.

The warehouse uses the generated `genre_key` as the primary key for all downstream relationships.

---

## Relationships

`dim_genre` is linked to movies through the `bridge_movie_genre` table.

```
dim_movie
     |
bridge_movie_genre
     |
dim_genre
```