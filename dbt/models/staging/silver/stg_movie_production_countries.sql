SELECT
    movie_id,
    production_country_code,
    production_country_name
FROM {{ source('silver', 'silver_movie_production_countries') }}