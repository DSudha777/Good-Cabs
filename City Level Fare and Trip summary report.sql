select c.city_name,
count(trip_id) as Total_trips,
round(sum(fare_amount)/sum(distance_travelled_km),2) as avg_fare_per_km,
round(sum(fare_amount)/count(trip_id),2) as avg_fare_per_trip,
round(count(trip_id)/(Select count(trip_id) from fact_trips)*100,2)
 as contribution_to_total_trips
 from fact_trips t
 join dim_city c 
 on t.city_id = c.city_id
 group by t.city_id
 order by city_name 