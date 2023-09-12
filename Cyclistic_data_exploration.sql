-- Data exploration

--checking data types of all coloumns
SELECT column_name, data_type
FROM `2021`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '2021_combined';

--checking for NULL values - 690809 found start_station_name and start_station_id, 739170 found end_station_name, end_station_id, 4771 end_lat end_lng

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
FROM `2021.2021_combined`;

--checking for duplicates - no dupliate rows

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `2021.2021_combined`;

--checking ride_id length - all ride_id length = 16

SELECT LENGTH(ride_id) AS length_ride_id, COUNT(ride_id) AS number_of_rows
FROM `2021.2021_combined`
GROUP BY length_ride_id;

--checking number of ride types - 3 found

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS number_of_trips
FROM `2021.2021_combined`
GROUP BY rideable_type;

--checking if all rides start on the same day - 4016 trips longer than a day

SELECT COUNT(*) AS longer_than_a_day
FROM `2021.2021_combined`
WHERE(
  EXTRACT (HOUR FROM(ended_at - started_at)) * 60 +
  EXTRACT (MINUTE FROM(ended_at - started_at)) +
  EXTRACT (SECOND FROM(ended_at - started_at)) / 60 >=1440
);

--chekcing id any rides are less than a minute - 86111 trips less than a minute
SELECT COUNT(*) AS less_than_a_minute
FROM `2021.2021_combined`
WHERE(
  EXTRACT (HOUR FROM(ended_at - started_at)) * 60 +
  EXTRACT (MINUTE FROM(ended_at - started_at)) +
  EXTRACT (SECOND FROM(ended_at - started_at)) / 60 <=1
);

--start_station_name and start_station_id both missing - 690806 missing

SELECT DISTINCT start_station_name
FROM `2021.2021_combined`
order by start_station_name;

SELECT COUNT(ride_id) AS row_with_null_start_station
FROM `2021.2021_combined`
WHERE start_station_name IS NULL AND start_station_id IS NULL;

--end_station_name and end_station_id both missing -  739170 missing
SELECT DISTINCT end_station_name
FROM `2021.2021_combined`
order by end_station_name;

SELECT COUNT(ride_id) AS row_with_null_end_station
FROM `2021.2021_combined`
WHERE end_station_name IS NULL AND end_station_id IS NULL;

--start_lat, start_lng - 4771 missing

SELECT COUNT(ride_id) AS rows_with_null_start_location
FROM `2021.2021_combined`
WHERE start_lat IS NULL OR start_lng IS NULL;

--end_lat, end_lng - 4771 missing

SELECT COUNT(ride_id) AS rows_with_null_end_location
FROM `2021.2021_combined`
WHERE end_lat IS NULL OR end_lng IS NULL;

--member_casual - 2 unique values
SELECT DISTINCT member_casual, COUNT(member_casual) AS number_of_trips
FROM `2021.2021_combined`
GROUP BY member_casual;







