SELECT DISTINCT
    movies.movie_key,
    language.language_key

FROM {{ ref('stg_movie_spoken_languages') }} AS stg

INNER JOIN {{ ref('gold_dim_movie') }} AS movies
    ON stg.movie_id = movies.tmdb_movie_id

INNER JOIN {{ ref('gold_dim_language') }} AS language
    ON stg.spoken_language_code = language.spoken_language_code