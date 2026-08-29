SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['genre_id']) }} AS genre_key,
    genre_id AS tmdb_genre_id,
    genre_name
FROM {{ ref('stg_movie_genres') }}
