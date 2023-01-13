# Selecting few coloumns from the tables
SELECT pickup_datetime, fare_amount,tip_amount
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018`  
LIMIT 1000;

# Extracting Hours from dattime_pickup columns and counting the toatal number of trips per hour
SELECT EXTRACT(HOUR FROM DATETIME(pickup_datetime)) AS Hour, COUNT(*) AS number_of_trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY HOUR
ORDER BY number_of_trips DESC;


# Finding the average percantages and trip percentages per hour and ordering it by tip to find best hour for tip
SELECT 
        EXTRACT(HOUR FROM DATETIME(pickup_datetime)) AS Hour, 
        COUNT(*) AS number_of_trips,
        AVG(fare_amount) AS Fare,
        AVG(tip_amount) AS Tip,
        (AVG(tip_amount) / AVG(fare_amount)) * 100 AS Percentage_Tip
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY HOUR
ORDER BY Tip DESC;


# finding total trips on week days
SELECT 
        FORMAT_DATE("%A", pickup_datetime) AS WeekDay,
        COUNT(*) AS number_of_trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY WeekDay
ORDER BY number_of_trips DESC ;

# Calculating tip percantges on weekdays
SELECT 
        FORMAT_DATE("%A", pickup_datetime) AS WeekDay,
        COUNT(*) AS number_of_trips,
        AVG(fare_amount) As Fare,
        AVG(tip_amount) AS Tip,
        (AVG(tip_amount) / AVG(fare_amount)) * 100 As weekday_tip_percantage
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY WeekDay
ORDER BY Tip DESC;



#Toll Amount percantages for each hour
SELECT 
        EXTRACT(HOUR FROM DATETIME(pickup_datetime)) AS Hour, 
        COUNT(*) AS number_of_trips,
        AVG(fare_amount) AS Fare,
        AVG(tolls_amount) AS Tolls,
        (AVG(tolls_amount) / AVG(fare_amount)) * 100 AS Percentage_Toll
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY HOUR
ORDER BY Tolls DESC;

# Toll amount percentages for each day
SELECT 
        FORMAT_DATE("%A", pickup_datetime) AS WeekDay,
        COUNT(*) AS number_of_trips,
        AVG(fare_amount) As Fare,
        AVG(tolls_amount) AS Tolls,
        (AVG(tolls_amount) / AVG(fare_amount)) * 100 As weekday_tolls_percantage
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY WeekDay
ORDER BY Tolls DESC;


# Finding the previous fare with the recent one
SELECT Hour, Fare,
        LAG(Fare) over (order by fare) AS fare_leg
FROM
(SELECT 
        EXTRACT(HOUR FROM pickup_datetime) AS Hour,
        AVG(fare_amount) AS Fare
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY Hour
) ORDER BY Fare DESC;


# CTE- Common Table Expression for trips and time
WITH daily_trips AS (
        SELECT  
        datetime_trunc(pickup_datetime, day) AS time,
        COUNT(*) AS number_of_trips
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
GROUP BY time
)
SELECT * 
FROM daily_trips ;


# Cases on Trips. Aloting Good, Leas, No tip on tip amount.
SELECT
CASE WHEN tip_amount < 0 THEN 'No Tip'
WHEN tip_amount BETWEEN 0 AND 5 THEN 'Less Tip'
WHEN tip_amount BETWEEN 5 AND 10 THEN 'Decent Tip'
WHEN tip_amount > 10 THEN 'Good Tip'
ELSE 'Something different'
END AS TipRange,
FROM `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2018` 
LIMIT 100; 
