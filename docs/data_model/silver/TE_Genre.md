# Silver Entity: TE_genre

## Purpose

The `TE_genre` table stores cleaned and standardised genre reference data extracted from the TMDb API.

This table represents the trusted genre entity within the Silver layer and is used to support downstream analytical modelling.

The grain of this table is:

> One row per unique movie genre.

---

## Schema

| Column            | Description                                   | Source / Transformation |
|---                |---                                            |---|
| `tmdb_genre_id`   | Unique genre identifier from TMDb             | Source |
| `genre_name`      | Genre description/name                        | Source |
| `loaded_datetime` | Timestamp the record entered the Silver layer | Generated during ingestion |

---

## Design Notes

### Source Alignment

The Silver layer retains TMDb's natural identifiers to maintain lineage back to the source system.

The `tmdb_genre_id` is used to match genre relationships from movie records.

---

### Transformation

The TMDb API provides genre information as a reference dataset.

Silver transformations include:

- Standardising column naming conventions
- Ensuring consistent data types
- Removing duplicate genre records
- Validating source identifiers

---

## Relationship Handling

Movies and genres have a many-to-many relationship.

A movie may contain multiple genres, and a genre will apply to many movies.

The relationship is stored separately:

```
TE_movie
      |
      |
TE_movie_genre
      |
      |
TE_genre
```

---

## Downstream Usage

The `TE_genre` table is transformed into the Gold:

```
TE_genre
      |
      v
dim_genre
```

The Gold layer introduces warehouse-specific elements such as:

- Surrogate keys
- Warehouse metadata
- Dimensional modelling conventions
```