SELECT
    movie_id,
    production_company_id,
    production_company_logo_path,
    production_company_name,
    production_company_origin_country
FROM {{ source('silver', 'silver_movie_production_companies') }}