
-- Create a new table to store the summary statistics
-- Create the table if it doesn't already exist
CREATE TABLE IF NOT EXISTS `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (
  member_casual STRING,
  month STRING,
  day_of_week STRING,
  bike_type STRING,
  start_station_name STRING,
  end_station_name STRING,
  avg_ride_length FLOAT64,
  avg_ride_length_by_month FLOAT64,
  total_num_of_rides INT64,
  total_num_of_rides_by_bike_type INT64,
  total_rides_by_day_of_week INT64,
  total_rides_by_month INT64,
  total_trips INT64,
  start_lat FLOAT64,
  start_lng FLOAT64,
  end_lat FLOAT64,
  end_lng FLOAT64,
  top_start_station FLOAT64,
  total_rides_by_station INT64,
  total_rides_by_bike_type INT64,
  avg_ride_length_by_day_of_week FLOAT64
);

----------------------- Insert average ride length by user-------------------
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (member_casual, avg_ride_length)
SELECT member_casual, AVG(ride_length) AS avg_ride_length
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY member_casual;

--------------------------Insert average ride length each month by user-----------------------------
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (month, member_casual, avg_ride_length_by_month)
SELECT month, member_casual, AVG(ride_length) AS avg_ride_length
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY month, member_casual
ORDER BY month;

---------------------------- Insert number of rides by user type-------------------------------------
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (member_casual, total_num_of_rides)
SELECT member_casual, COUNT(ride_id) AS total_num_of_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY member_casual;

--------------------------------- Insert rides by user and bike type----------------------------------
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (member_casual, bike_type, total_num_of_rides_by_bike_type)
SELECT member_casual, rideable_type, COUNT(rideable_type) AS total_number_of_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY member_casual, rideable_type;

-------------------------------- Insert total number of rides by day of week--------------------------------
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (day_of_week, member_casual, total_rides_by_day_of_week)
SELECT day_of_week, member_casual, COUNT(day_of_week) AS total_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY day_of_week, member_casual;

-- Insert total number of rides by month
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (month, member_casual, total_rides_by_month)
SELECT month, member_casual, COUNT(month) AS total_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY month, member_casual;

---------------- Insert total number of rides by start and end station----------------------
            --give the total number of rides starting and ending at each station pair
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (start_station_name, end_station_name, total_rides_by_station)
SELECT start_station_name, end_station_name, COUNT(*) AS total_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY start_station_name, end_station_name;

---------------- Insert total number of rides by bike type (overall)-------------------------
            --total number of rides for each bike type across all users.
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (bike_type, total_rides_by_bike_type)
SELECT rideable_type, COUNT(*) AS total_rides
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY rideable_type;

----------------Insert average ride length by day of week------------------------------------
            --calculates the average ride length for each day of the week.
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (day_of_week, avg_ride_length_by_day_of_week)
SELECT day_of_week, AVG(ride_length) AS avg_ride_length
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY day_of_week;


-- Calculate the total number of rides for each station and select the top 10
INSERT INTO `cyclisticcasestudy-426222.tripdata2023.12_month_statstic_fullDataset` (start_station_name, top_start_station)
SELECT start_station_name, sum(ride_length) AS start_station
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY start_station_name;

