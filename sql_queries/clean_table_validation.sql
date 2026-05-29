/*
    Checking how many valid rows remain
    after cleaning the Jan-Jun 2024 dataset.
*/

SELECT
    -- Count rows in clean table
    COUNT(*) AS Clean_Rows

FROM `nyc-yellow-taxi-record-495915.nyc_dataset.nyc_taxi_clean`