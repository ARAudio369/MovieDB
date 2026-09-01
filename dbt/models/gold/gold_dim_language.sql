SELECT DISTINCT
    {{ dbt_utils.generate_surrogate_key(['spoken_language_code']) }} AS language_key,
    spoken_language_english_name,
    spoken_language_code,
    spoken_language_name
FROM {{ ref('stg_movie_spoken_languages') }}