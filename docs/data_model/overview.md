# MovieDB Data Model

## Purpose

This document defines the analytical data model used within the MovieDB platform.

The model follows Kimball dimensional modelling principles and is designed to answer questions around movie performance, genres, studios, countries, and release trends. Will be updated as the project develops, as I cannot see the future too brightly.

---

# Gold Layer Model

## Dimension: dim_movie

Purpose:
Stores descriptive information about each movie.

Columns:

- movie_key
- tmdb_movie_id
- movie_title
- release_date
- release_year
- runtime_minutes
- original_language

---

## Dimension: dim_genre

Purpose:
Stores movie genres.
Note: Multi-genres

Examples:

- Action
- Comedy
- Drama
- Science Fiction

---

## Dimension: dim_production_company

Purpose:
Stores production companies.
Notes: Multiple studios/production houses (Late Night With The Devil)

---

## Dimension: dim_country

Purpose:
Stores production countries.
Note: Multiple production countries 

---

## Dimension: dim_language

Purpose:
Stores production language.
Note: Multiple languages spoken (Return to Soeul)

---

## Fact: fact_movie

Purpose:
Stores aggregated movie metrics.

Measures:

- vote_count
- average_rating
- popularity_score

---

# Bridge Tables

## bridge_movie_genre

Purpose:
Resolves the many-to-many relationship between movies and genres.

---

## bridge_movie_company

Purpose:
Resolves the many-to-many relationship between movies and production companies.

---

## bridge_movie_country

Purpose:
Resolves the many-to-many relationship between movies and production countries.

---

## bridge_movie_language

Purpose:
Resolves the many-to-many relationship between movies and spoken languages.

## Relationships

                         dim_genre
                             |
                             |
                    bridge_movie_genre
                             |
                             |
dim_country ---- bridge_movie_country ---- dim_movie ---- fact_movie
                             |
                             |
                    bridge_movie_language
                             |
                             |
                       dim_language

                             |
                             |
                 bridge_movie_company
                             |
                             |
              dim_production_company