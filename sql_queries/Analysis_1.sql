/*
    Understand how passengers prefer
    to pay for their taxi rides. This helps
    identify revenue patterns by payment method.
    Payment types: 1=Credit Card, 2=Cash,
    3=No Charge, 4=Dispute
*/

SELECT
    -- Payment type code
    CASE payment_type
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Cash'
        WHEN 3 THEN 'No Charge'
        WHEN 4 THEN 'Dispute'
        ELSE 'Unknown'
    END AS Payment_Method,

    -- Count total trips per payment type
    COUNT(*) AS Total_Trips,

    -- Calculate total revenue per payment type
    ROUND(SUM(total_amount), 2) AS Total_Revenue,

    -- Calculate average fare per payment type
    ROUND(AVG(fare_amount), 2) AS Avg_Fare,

    -- Calculate average tip per payment type
    ROUND(AVG(tip_amount), 2) AS Avg_Tip

FROM `nyc-yellow-taxi-record-495915.nyc_dataset.nyc_taxi_clean`

GROUP BY payment_type
ORDER BY Total_Revenue DESC