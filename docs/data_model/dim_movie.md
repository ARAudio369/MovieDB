# Dimension: dim_movie

## Purpose

The `dim_movie` table stores descriptive information relating to each movie within the MovieDB platform.

The grain of this table is:

> One row per movie.

The table contains source identifiers, descriptive attributes, derived attributes, and warehouse metadata.

---

## Schema

| Column                      | Description                                                  | Source / Transformation |
|---|                         |---|                                                          |---|
| `movie_key`                 | Surrogate key used internally within the warehouse           | Generated during transformation |
| `tmdb_movie_id`             | Unique identifier from The Movie Database (TMDb)             | Source |
| `movie_title`               | Movie title                                                  | Source |
| `original_title`            | Original movie title before localisation/translation         | Source |
| `release_date`              | Movie release date                                           | Source |
| `release_year`              | Year extracted from release date                             | Derived |
| `runtime_minutes`           | Total runtime in minutes                                     | Source |
| `runtime_hours`             | Runtime converted into hours component                       | Derived |
| `runtime_remaining_minutes` | Remaining minutes after extracting full hours                | Derived |
| `runtime_seconds`           | Runtime seconds component                                    | Derived |
| `original_language`         | Primary language associated with the movie according to TMDb | Source |
| `overview`                  | Movie description/synopsis                                   | Source |
| `loaded_datetime`           | Timestamp when record was loaded into the warehouse          | Generated during ingestion |

---

## Design Notes

### Language Handling

`original_language` is set to a single language to meet the modelling requirements.

Additional spoken languages are modelled separately through:

- `dim_language`
- `bridge_movie_language`

This supports movies containing multiple spoken languages without introducing repeated columns or denormalised data.

---

### Runtime Handling

TMDb provides runtime as a value in minutes.

Additional runtime fields are derived to support flexible reporting:

Example:
Runtime = 103 minutes

runtime_hours = 1
runtime_remaining_minutes = 43
runtime_seconds = 0

This allows presentation formats such as:

'1h 43m 0s' while retaining the original source value.

---

## Relationships

`dim_movie` acts as the central dimension for movie-related analysis.

Expected relationships:
dim_movie
|
├── bridge_movie_genre
│ |
│ └── dim_genre
│
├── bridge_movie_language
│ |
│ └── dim_language
│
├── bridge_movie_company
│ |
│ └── dim_production_company
│
└── bridge_movie_country
|
└── dim_country