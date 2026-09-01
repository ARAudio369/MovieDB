SELECT DISTINCT
    movies.movie_key,
    genre.genre_key

FROM {{ ref('stg_movie_genres') }} AS stg

INNER JOIN {{ ref('gold_dim_movie') }} AS movies
    ON stg.movie_id = movies.tmdb_movie_id

INNER JOIN {{ ref('gold_dim_genre') }} AS genre
    ON stg.genre_id = genre.tmdb_genre_id