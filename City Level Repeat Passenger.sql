with cte1 as(Select city_id,
sum(case when trip_count ='2-Trips' then repeat_passenger_count else 0 end) as twotrips,
sum(case when trip_count ='3-Trips' then repeat_passenger_count else 0 end) as Threetrips,
sum(case when trip_count ='4-Trips' then repeat_passenger_count else 0 end) as fourtrips,
sum(case when trip_count ='5-Trips' then repeat_passenger_count else 0 end) as fivetrips,
sum(case when trip_count ='6-Trips' then repeat_passenger_count else 0 end) as sixtrips,
sum(case when trip_count ='7-Trips' then repeat_passenger_count else 0 end) as seventrips,
sum(case when trip_count ='8-Trips' then repeat_passenger_count else 0 end) as eighttrips,
sum(case when trip_count ='9-Trips' then repeat_passenger_count else 0 end) as ninetrips,
sum(case when trip_count ='10-Trips' then repeat_passenger_count else 0 end) as tentrips,
sum(repeat_passenger_count) as total_repeat_passengers
 from dim_repeat_trip_distribution
 group by city_id)
 
 select city_id,
 round((twotrips/total_repeat_passengers)*100,2)  as '2-Trips' ,
 round((Threetrips/total_repeat_passengers)*100,2) as '3-Trips',
 round((fourtrips/total_repeat_passengers)*100,2) as '4-Trips',
 round((fivetrips/total_repeat_passengers)*100,2) as '5-Trips',
 round((sixtrips/total_repeat_passengers)*100,2) as '6-Trips',
 round((seventrips/total_repeat_passengers)*100,2) as '7-Trips',
 round((eighttrips/total_repeat_passengers)*100,2) as '8-Trips',
 round((ninetrips/total_repeat_passengers)*100,2) as '9-Trips',
 round((tentrips/total_repeat_passengers)*100,2) as '10-Trips'
 
  from cte1
