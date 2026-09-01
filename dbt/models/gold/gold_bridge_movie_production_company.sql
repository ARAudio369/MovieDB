SELECT DISTINCT
    movies.movie_key,
    company.company_key 
FROM {{ ref('stg_movie_production_companies') }} as stg
INNER JOIN {{ ref('gold_dim_movie') }} AS movies
    ON stg.movie_id = movies.tmdb_movie_id
INNER JOIN {{ ref('gold_dim_production_company') }} AS company
    ON stg.production_company_id = company.tmdb_company_id
