-- Analysis

-- 1. Percentage of Casual Rides vs Annual Member

SELECT member_casual, rideable_type, COUNT(*) AS total_trips
From `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips;


SELECT member_casual, 
Round (AVG(ride_length),2) AS avg_ride_length
From `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
GROUP BY member_casual

