with cte1 as (select monthname(date) as Month_name,c.city_name,count(trip_id) as Actual_trips
from fact_trips t join dim_city c
on t.city_id= c.city_id
group by monthname(date),t.city_id),cte2 as
(select c.city_name,monthname(t.month) as Month_name ,total_target_trips 
from  targets_db.monthly_target_trips t 
join trips_db.dim_city c on
t.city_id =c.city_id)
select a.Month_name,a.city_name,a.Actual_trips,b.total_target_trips,
Case when a.Actual_trips > b.total_target_trips then 'Above_Target'
	when a.Actual_trips < b.total_target_trips then 'Below_Target'
    End as PerFormance_Status,
round(((a.Actual_trips/ b.total_target_trips)-1)*100,2) as difference_Percentage
 from cte1 a join cte2 b
on a.city_name = b.city_name and a.Month_name = b.Month_name