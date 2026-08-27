SELECT
    movie_id,
    spoken_language_english_name,
    spoken_language_country_code,
    spoken_language_name
FROM {{ source('silver', 'silver_movie_spoken_languages') }}