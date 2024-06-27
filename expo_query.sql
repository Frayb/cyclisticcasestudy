#checking for if ride_id has any dublicate
SELECT ride_id,
COUNT(*) AS dublicate_count
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
group by ride_id
having dublicate_count > 1;


#check if primary key is 16 character long
SELECT LENGTH(ride_id) AS length_ride_id, 
COUNT(ride_id) AS no_of_rows
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
GROUP BY length_ride_id;

# type of bikes available
SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
Group by rideable_type;


# number of trips causual and members have taken
SELECT distinct member_casual, count(member_casual) as num_of_trips
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
group by member_casual;

-- Check for invalid date ranges
SELECT
  COUNT(*) AS invalid_dates_count
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
WHERE started_at > ended_at; --- invalid invalid_dates_count = 272



-- Count missing values by column
SELECT
  COUNTIF(started_at IS NULL) AS missing_start_time,
  COUNTIF(ended_at IS NULL) AS missing_end_time,
  COUNTIF(start_station_name IS NULL) AS missing_start_station_name,
  COUNTIF(end_station_name IS NULL) AS missing_end_station_name,
  COUNT(*) AS total_count
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`;



-- Top 10 start stations
SELECT 
  start_station_name,
  COUNT(*) AS trip_count
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`
GROUP BY start_station_name
ORDER BY trip_count DESC
LIMIT 10;


-- count null values of each fields
SELECT COUNT(*) - COUNT(ride_id) ride_id,
 COUNT(*) - COUNT(rideable_type) rideable_type,
 COUNT(*) - COUNT(started_at) started_at,
 COUNT(*) - COUNT(ended_at) ended_at,
 COUNT(*) - COUNT(start_station_name) start_station_name,
 COUNT(*) - COUNT(start_station_id) start_station_id,
 COUNT(*) - COUNT(end_station_name) end_station_name,
 COUNT(*) - COUNT(end_station_id) end_station_id,
 COUNT(*) - COUNT(start_lat) start_lat,
 COUNT(*) - COUNT(start_lng) start_lng,
 COUNT(*) - COUNT(end_lat) end_lat,
 COUNT(*) - COUNT(end_lng) end_lng,
 COUNT(*) - COUNT(member_casual) member_casual
From `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`

