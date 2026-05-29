/*
    I want to see how daily revenue and trip
    volume changed throughout January 2024.
    This helps identify weekly patterns and
    any unusual days in the month.
*/

SELECT
    -- Extract date from pickup timestamp
    DATE(tpep_pickup_datetime) AS Trip_Date,

    -- Count total trips per day
    COUNT(*) AS Total_Trips,

    -- Calculate total revenue per day
    ROUND(SUM(total_amount), 2) AS Daily_Revenue,

    -- Calculate average fare per day
    ROUND(AVG(fare_amount), 2) AS Avg_Fare,

    -- Calculate average distance per day
    ROUND(AVG(trip_distance), 2) AS Avg_Distance,

    -- Calculate total tips per day
    ROUND(SUM(tip_amount), 2) AS Daily_Tips

FROM `nyc-yellow-taxi-record-495915.nyc_dataset.nyc_taxi_clean`

-- Only include January 2024 dates
WHERE DATE(tpep_pickup_datetime) 
    BETWEEN '2024-01-01' AND '2024-01-31'

-- Group by each day
GROUP BY Trip_Date

-- Show chronologically
ORDER BY Trip_Date ASC