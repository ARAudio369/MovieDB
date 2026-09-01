SELECT
    {{ dbt_utils.generate_surrogate_key(['movie_id']) }} AS movie_key,
    dates.date_key AS release_date_key,
    stg.movie_id AS tmdb_movie_id,
    stg.title AS movie_title,
    lang.language_key AS language_key,
    stg.original_title,
    stg.release_date,
    EXTRACT(YEAR FROM stg.release_date) AS release_year,
    stg.runtime AS runtime_minutes,
    --stg.original_language,
    stg.overview
FROM {{ ref('stg_movies') }} AS stg
LEFT JOIN {{ ref('gold_dim_date') }} AS dates
    ON CAST(stg.release_date AS DATE) = dates.full_date
LEFT JOIN {{ ref('gold_dim_language') }} AS lang
    ON stg.original_language = lang.spoken_language_code
