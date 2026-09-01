SELECT
    movie.movie_key AS movie_key,
    dates.date_key AS date_key,
    budget,
    runtime,
    revenue,
    popularity,
    vote_average,
    vote_count

FROM {{ ref('stg_movies') }} AS stg
LEFT JOIN {{ ref('gold_dim_date') }} AS dates
    ON CAST(stg.release_date AS DATE) = dates.full_date
LEFT JOIN {{ ref('gold_dim_movie') }} AS movie
    ON stg.movie_id = movie.tmdb_movie_id
