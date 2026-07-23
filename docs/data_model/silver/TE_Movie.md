# Silver Entity: TE_movie

## Purpose

The `TE_movie` table stores cleaned and structured movie data extracted from the raw TMDb API responses.

This table represents the trusted movie entity within the Silver layer and acts as the source dataset for downstream Gold layer models.

The grain of this table is:

> One row per movie.

---

## Schema

| Column                | Description                                   | Source / Transformation |
|---                    |---                                            |---|
| `tmdb_movie_id`       | Unique movie identifier from TMDb             | Source |
| `movie_title`         | Movie title                                   | Source |
| `original_title`      | Original movie title                          | Source |
| `release_date`        | Movie release date                            | Source |
| `runtime_minutes`     | Movie runtime in minutes                      | Source |
| `original_language`   | Primary TMDb language code                    | Source |
| `overview`            | Movie description/synopsis                    | Source |
| `budget`              | Movie production budget                       | Source |
| `revenue`             | Movie revenue                                 | Source |
| `vote_average`        | Average user rating                           | Source |
| `vote_count`          | Number of user votes                          | Source |
| `popularity_score`    | TMDb popularity score                         | Source |
| `loaded_datetime`     | Timestamp the record entered the Silver layer | Generated during ingestion |

---

## Design Notes

### Source Alignment

The Silver layer maintains a close relationship with the TMDb source structure while applying cleaning and standardisation.

Examples of Silver transformations:

- Standardising column names
- Removing unnecessary nested structures
- Applying consistent data types
- Handling missing values
- Validating source identifiers

---

### Relationship Handling

Nested arrays from the TMDb API are separated into dedicated Silver relationship tables.

Examples:

Original TMDb structure:

```
movie
 |
 ├── genres[]
 ├── production_companies[]
 ├── production_countries[]
 └── spoken_languages[]
```

Silver structure:

```
TE_movie

TE_movie_genre

TE_movie_company

TE_movie_country

TE_movie_language
```

---

## Downstream Usage

The `TE_movie` table is transformed into the Gold:

```
TE_movie
      
      v
dim_movie

TE_movie
      |
      v
fact_movie
```