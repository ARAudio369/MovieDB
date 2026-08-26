SELECT
    movie_id,
    genre_id,
    COUNT(*) AS duplicate_count
FROM {{ ref('stg_movie_genres') }}
GROUP BY
    movie_id,
    genre_id
HAVING COUNT(*) > 1