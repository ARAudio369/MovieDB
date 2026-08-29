SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['production_country_code']) }} AS country_key,
    production_country_code AS tmdb_country_code,
    production_country_name AS country_name
FROM {{ ref('stg_movie_production_countries') }}
