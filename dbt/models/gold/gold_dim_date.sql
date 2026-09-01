WITH date_range AS (
    SELECT
        EXPLODE(
            SEQUENCE(
                DATE('1900-01-01'),
                DATE('2030-12-31'),
                INTERVAL 1 DAY
            )
        ) AS full_date

)

SELECT
    CAST(DATE_FORMAT(full_date, 'yyyyMMdd') AS INT) AS date_key,
    full_date,
    EXTRACT(YEAR FROM full_date) AS year_number,
    EXTRACT(MONTH FROM full_date) AS month_number,
    EXTRACT(DAY FROM full_date) AS day_number,
    DATE_FORMAT(full_date, 'MMMM') AS month_name,
    DATE_FORMAT(full_date, 'yyyy-MM') AS year_month

FROM date_range
