





SELECT DISTINCT unique_key key,taxi_id driver,trip_start_timestamp as trip_start,trip_end_timestamp   trip_end,trip_seconds duration ,trip_miles distance,fare money
            FROM `bigquery-public-data.chicago_taxi_trips.taxi_trips` 
            WHERE (trip_start_timestamp between '2018-01-01' and '2018-07-01') and ( NOT (trip_start_timestamp=trip_end_timestamp)) and (trip_seconds>30) and (trip_miles>0) and (fare>1)



--Calculate recency frequency money distance time and lifetyme

SELECT driver,count(*) as frequency,AVG(money) as avg_money,SUM(money) as total_money,AVG(distance) as avg_dist,MIN(trip_start) as first_trip,MAX(trip_start) as last_trip,DATE_DIFF(cast(max(trip_start) as date),cast(min(trip_start) as date),day)+1 as lifetyme,AVG(duration) as avg_time,DATE_DIFF(CAST('2018-07-01' AS DATE),CAST(max(trip_start) AS DATE),DAY) as recency
from taxi.taxi
GROUP BY driver