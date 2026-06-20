SELECT * FROM `sql-project-499706.sql_practice.rides` LIMIT 1000

SELECT * FROM `sql-project-499706.sql_practice.stations` LIMIT 1000

SELECT * FROM `sql-project-499706.sql_practice.users` LIMIT 1000


-- number of rows per table
SELECT
  (SELECT COUNT (*) FROM `sql-project-499706.sql_practice.rides`) AS total_rides,
  (SELECT COUNT (*) FROM `sql-project-499706.sql_practice.stations`) AS total_stations,
  (SELECT COUNT (*) FROM `sql-project-499706.sql_practice.users`) AS total_users


-- for missing values
SELECT

  COUNTIF(ride_id IS NULL) AS null_ride_ids,
  COUNTIF(user_id IS NULL) AS null_user_ids,
  COUNTIF(start_time IS NULL) AS null_start_time,
  COUNTIF(end_time IS NULL) AS null_end_time

  FROM `sql-project-499706.sql_practice.rides` 

-- summary stats for rides table

SELECT

  MIN(distance_km) AS min_dist,
  MAX(distance_km) AS max_dist,
  AVG(distance_km) AS avg_dist,
  MIN(TIMESTAMP_DIFF(end_time, start_time, MINUTE)) AS min_duration_mins,
  MAX(TIMESTAMP_DIFF(end_time, start_time, MINUTE)) AS max_duration_mins,
  AVG(TIMESTAMP_DIFF(end_time, start_time, MINUTE)) AS avg_duration_mins


FROM `sql-project-499706.sql_practice.rides`



-- checking for 0 in minimum 

SELECT

 COUNTIF(TIMESTAMP_DIFF(end_time, start_time, MINUTE)<2) AS short_duration_trips,
 COUNTIF(distance_km = 0) AS zero_distance_trips




FROM `sql-project-499706.sql_practice.rides`




-- different membership
SELECT
  u.membership_level,
  COUNT(r.ride_id) AS total_rides,
  AVG(r.distance_km) AS avg_distance_km,
  AVG(TIMESTAMP_DIFF(r.end_time, r.start_time, MINUTE)) AS avg_duration_mins

FROM `sql-project-499706.sql_practice.rides` AS r
JOIN `sql-project-499706.sql_practice.users` AS u
 ON r.user_id = u.user_id

 GROUP BY u.membership_level
 ORDER BY total_rides DESC


 -- peak hours

 SELECT

  EXTRACT(HOUR FROM start_time) AS hour_of_day,
  COUNT(*) AS ride_count


 FROM `sql-project-499706.sql_practice.rides`

 GROUP BY hour_of_day
 ORDER BY hour_of_day


-- popular stations

SELECT

  s.station_name,
  COUNT(r.ride_id) AS total_starts

FROM `sql-project-499706.sql_practice.rides` AS r
JOIN `sql-project-499706.sql_practice.stations`  AS s
  ON r.start_station_id = s.station_id

GROUP BY s.station_name
ORDER BY total_starts DESC
LIMIT 10
