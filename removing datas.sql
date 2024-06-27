-- remove fields with null value

delete From `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
where start_station_name is null
and
 start_station_id is null
and 
 end_station_name is null
and
 end_station_id is null;

-- This statement removed 417,110 rows from 12_month_cleaned_fullDataset.


delete From `cyclisticcasestudy-426222.tripdata2023.12_month_cleaned_fullDataset`
where start_station_name is null
or
 start_station_id is null
or 
 end_station_name is null
or
 end_station_id is null;

 -- This statement removed 970,944 rows from 12_month_cleaned_fullDataset.