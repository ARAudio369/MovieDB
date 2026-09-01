SELECT DISTINCT
  movies.movie_key,
  country.country_key
FROM {{ ref('stg_movie_production_countries') }} AS stg
INNER JOIN {{ ref('gold_dim_movie') }} AS movies
    ON stg.movie_id = movies.tmdb_movie_id
INNER JOIN {{ ref('gold_dim_country') }} AS country
ON stg.production_country_code = country.tmdb_country_code

