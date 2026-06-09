SELECT 
period, 
platform,
COUNT(*) AS total_trips,
ROUND(AVG(driver_take_rate), 3) AS avg_take_rate,
ROUND(AVG(base_passenger_fare), 2) as avg_fare,
ROUND(AVG(driver_pay), 2) as avg_driver_pay
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips`
GROUP BY period, platform
ORDER BY period, platform;

-- Q1. Before vs After congestion pricing -  overall impact -- 
SELECT
period, 
COUNT(*) AS total_trips,
ROUND(AVG(base_passenger_fare), 2) AS avg_passenger_fare,
ROUND(AVG(driver_pay), 2) AS avg_driver_pay,
ROUND(AVG(driver_take_rate), 2) AS avg_take_rate,
ROUND(AVG(cbd_congestion_fee), 2) AS avg_congestion_fee
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips`
GROUP BY period;

-- Q2. Before vs After comparison of avg trip miles and trip time -- 
SELECT 
period,
ROUND(AVG(trip_miles), 2) AS avg_trip_miles,
ROUND(AVG(trip_time), 2) AS avg_trip_time
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips`
GROUP BY period
ORDER BY period DESC;

-- Q3 -- 
SELECT 
T1.period,
T2.Borough,
COUNT(*) AS total_trips,
ROUND(AVG(base_passenger_fare), 3) AS avg_passenger_fare,
ROUND(AVG(driver_pay), 3) AS avg_driver_pay,
ROUND(AVG(driver_take_rate), 3) AS avg_take_rate
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips` T1
JOIN `uber-lyft-earnings-analysis.tlc_trips.taxi_zones` T2 
ON T1.PULocationID = T2.LocationID
GROUP BY T1.period, T2.Borough
ORDER BY T1.period DESC, total_trips DESC; 

-- Q4 Congestion fee impact on driver take rate in Manhattan specifically -- 
SELECT
T1.period,
T2.Borough,
ROUND(AVG(cbd_congestion_fee), 3) AS avg_congestion_fee,
ROUND(AVG(base_passenger_fare), 3) AS avg_passenger_fare,
ROUND(AVG(driver_pay), 3) AS avg_driver_pay,
ROUND(AVG(driver_take_rate), 3) AS avg_driver_take_rate,
ROUND(AVG(total_fees), 3) AS avg_total_fees
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips` T1
JOIN `uber-lyft-earnings-analysis.tlc_trips.taxi_zones` T2 
ON T1.PULocationID = T2.LocationID
WHERE T2.Borough = 'Manhattan'
GROUP BY T1.period, T2.Borough
ORDER BY T1.period DESC;

-- Q5 Uber vs Lyft driver economies comparison before and after congestion pricing
SELECT 
period, 
platform,
COUNT(*) AS total_trips,
ROUND(AVG(base_passenger_fare), 3) AS avg_passenger_fare,
ROUND(AVG(driver_pay), 3) AS avg_driver_pay,
ROUND(AVG(driver_take_rate), 3) AS avg_driver_take_rate,
ROUND(AVG(cbd_congestion_fee), 3) AS avg_congestion_fee,
ROUND(AVG(trip_miles), 3) AS avg_trip_miles,
ROUND(AVG(trip_time_mins), 3) AS avg_trip_time_mins
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips`
GROUP BY period, platform
ORDER BY platform DESC, period DESC;

-- Q6. Earnings per mile by borough and by period -- 
SELECT 
T1.period,
T2.Borough,
ROUND(AVG(earnings_per_mile), 3) AS avg_earnings_per_mile,
ROUND(AVG(trip_miles), 3) AS avg_trip_miles,
ROUND(AVG(driver_pay), 3) AS avg_driver_pay,
COUNT(*) AS number_of_trips
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips` T1
JOIN `uber-lyft-earnings-analysis.tlc_trips.taxi_zones` T2 
ON T1.PULocationID = T2.LocationID
WHERE T2.Borough != 'N/A' AND T2.Borough != 'EWR'
GROUP BY T1.period, T2.Borough
ORDER BY T2.Borough, T1.period DESC, avg_earnings_per_mile DESC;

-- Creating view of Dashboard -- 
-- CREATE VIEW `uber-lyft-earnings-analysis.tlc_trips.trips_with_borough` AS
SELECT 
  T1.*,
  T2.Borough,
  T2.Zone
FROM `uber-lyft-earnings-analysis.tlc_trips.Trips` T1
LEFT JOIN `uber-lyft-earnings-analysis.tlc_trips.taxi_zones` T2
ON T1.PULocationID = T2.LocationID; --