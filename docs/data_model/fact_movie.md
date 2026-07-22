# Fact: fact_movie

## Purpose

The `fact_movie` table stores quantitative metrics relating to each movie.

The table contains measurable attributes sourced from The Movie Database (TMDb), allowing analytical reporting across movie dimensions such as genre, production company, country and language.

The grain of this table is:

> One row per movie.

The table represents the latest known state of each movie rather than historical snapshots.

---

## Schema

| Column                | Description                                               | Source / Transformation |
|---|                   |---|                                                       |---|
| `movie_key`           | Foreign key to `dim_movie`                                | Generated during transformation |
| `vote_average`        | Average user rating                                       | Source |
| `vote_count`          | Number of user votes                                      | Source |
| `popularity_score`    | TMDb popularity score                                     | Source |
| `budget`              | Movie production budget                                   | Source |
| `revenue`             | Movie box office revenue                                  | Source |
| `loaded_datetime`     | Timestamp when the record was loaded into the warehouse   | Generated during ingestion |

---

## Design Notes

### Fact Grain

The fact table stores a single record for each movie.

Movie descriptive attributes are intentionally excluded from this table and instead stored within their respective dimensions.

---

### Historical Tracking

This project stores the current state of each movie only.

Each pipeline execution refreshes the latest values supplied by TMDb rather than creating historical snapshots.

Future enhancements may introduce a snapshot fact table to support trend analysis over time.

---

### Analytical Purpose

The measures contained within this table support analysis such as:

- Average rating by genre
- Total revenue by production company
- Average popularity by production country
- Budget versus revenue comparisons
- Rating distributions by language

---

## Relationships

The fact table joins directly to `dim_movie`.

Additional movie attributes are accessed through the dimensional model.

```
fact_movie
     |
     |
dim_movie
     |
     ├── bridge_movie_genre
     │        |
     │        └── dim_genre
     │
     ├── bridge_movie_language
     │        |
     │        └── dim_language
     │
     ├── bridge_movie_company
     │        |
     │        └── dim_production_company
     │
     └── bridge_movie_country
              |
              └── dim_country
```