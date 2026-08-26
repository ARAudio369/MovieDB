SELECT
    movie_id,
    genre_id,
    genre_name
FROM {{ source('silver', 'silver_movie_genres') }}