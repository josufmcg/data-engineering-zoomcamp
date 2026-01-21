```sql
SELECT 
	ytt."index", "VendorID", lpep_pickup_datetime, lpep_dropoff_datetime, store_and_fwd_flag, "RatecodeID", "PULocationID", "DOLocationID", passenger_count, trip_distance, fare_amount,
	extra, mta_tax, tip_amount,	tolls_amount, ehail_fee, improvement_surcharge, total_amount, payment_type, trip_type, congestion_surcharge, cbd_congestion_fee,
	tz."Zone" 
FROM public.yellow_taxi_trips ytt
inner join taxi_zones tz on tz."LocationID" = ytt."PULocationID"
limit 10;


-- Question 3
select count(*) 
from yellow_taxi_trips 
where
	lpep_pickup_datetime >  '2025-11-01' and lpep_pickup_datetime < '2025-12-01'
	and trip_distance <= 1.0;

-- Question 4
select lpep_pickup_datetime, trip_distance
from yellow_taxi_trips 
where trip_distance < 100
order by trip_distance desc;

-- Question 5
SELECT 
	tz."Zone", SUM(ytt.total_amount) as total_amount
FROM public.yellow_taxi_trips ytt
inner join taxi_zones tz on tz."LocationID" = ytt."PULocationID"
where ytt.lpep_pickup_datetime >  '2025-11-18' and lpep_pickup_datetime < '2025-11-19'
group by tz."Zone" order by total_amount desc;

-- Question 6
SELECT 
	tz_pu."Zone" as pickup, tz_do."Zone" as dropdow,  ytt.tip_amount, ytt.lpep_pickup_datetime
FROM public.yellow_taxi_trips ytt
inner join taxi_zones tz_pu on tz_pu."LocationID" = ytt."PULocationID"
inner join taxi_zones tz_do on tz_do."LocationID" = ytt."DOLocationID"
where 
	tz_pu."Zone" = 'East Harlem North'
	and ytt.lpep_pickup_datetime >  '2025-11-01' and lpep_pickup_datetime < '2025-12-01'
order by ytt.tip_amount desc;
```