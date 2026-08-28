SELECT
    movie_id,
    spoken_language_english_name,
    spoken_lanuage_country_code AS spoken_language_code,
    spoken_lanuage_name AS spoken_language_name
FROM {{ source('silver', 'silver_movie_spoken_languages') }}