/*
    I want to find out which hours of the day
    are busiest for NYC taxis. This helps identify
    peak demand periods and revenue concentration
    throughout the day.
*/

SELECT
    -- Extract hour from pickup time
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS Hour_Of_Day,

    -- Count total trips per hour
    COUNT(*) AS Total_Trips,

    -- Calculate total revenue per hour
    ROUND(SUM(total_amount), 2) AS Total_Revenue,

    -- Calculate average fare per hour
    ROUND(AVG(fare_amount), 2) AS Avg_Fare,

    -- Calculate average trip distance per hour
    ROUND(AVG(trip_distance), 2) AS Avg_Distance

FROM `nyc-yellow-taxi-record-495915.nyc_dataset.nyc_taxi_clean`

-- Group results by each hour
GROUP BY Hour_Of_Day

-- Show busiest hours first
ORDER BY Total_Trips DESC