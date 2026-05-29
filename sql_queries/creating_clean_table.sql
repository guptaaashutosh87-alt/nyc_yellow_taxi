/*
    Creating a clean table by removing invalid and incomplete records.
*/

CREATE OR REPLACE TABLE 
`nyc-yellow-taxi-record-495915.nyc_dataset.nyc_taxi_clean`
AS
SELECT DISTINCT *
FROM `nyc-yellow-taxi-record-495915.nyc_dataset.native_table`
WHERE
    -- Only keep valid 2024 data
    EXTRACT(YEAR FROM tpep_pickup_datetime) = 2024

    -- Only keep January to June
    AND EXTRACT(MONTH FROM tpep_pickup_datetime) BETWEEN 1 AND 6

    -- Remove rows where passenger count is missing
    AND passenger_count IS NOT NULL

    -- Remove trips with no actual distance
    AND trip_distance > 0

    -- Remove trips with invalid fare charges
    AND fare_amount > 0

    -- Remove trips with invalid total amount
    AND total_amount > 0