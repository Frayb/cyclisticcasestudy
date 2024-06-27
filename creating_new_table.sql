CREATE TABLE `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset` AS
SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    FORMAT_TIMESTAMP('%A', ended_at) AS day_of_week,  -- Convert day_of_week to full name (e.g., 'Monday')
    FORMAT_TIMESTAMP('%b', ended_at) AS month,        -- Convert month to abbreviated name (e.g., 'Jan')
    EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
    EXTRACT(MINUTE FROM (ended_at - started_at)) +
    Round (EXTRACT(SECOND FROM (ended_at - started_at)) / 60,2) AS ride_length,  -- Calculate ride_length in minutes and roudn seconds 
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_fullDataset`;

-- Verify the data
SELECT *
FROM `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
LIMIT 10;