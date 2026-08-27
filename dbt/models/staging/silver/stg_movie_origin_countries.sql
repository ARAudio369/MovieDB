SELECT
    movie_id,
    origin_country
FROM {{ source('silver', 'silver_movie_origin_countries') }}