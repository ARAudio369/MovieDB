SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['production_company_id']) }} AS company_key,
    production_company_id AS tmdb_company_id,
    production_company_name AS company_name
FROM {{ ref('stg_movie_production_companies') }}
