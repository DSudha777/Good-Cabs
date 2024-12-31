with cte1 as(select c.city_name, monthname(date) as month,sum(fare_amount) as Revenue,
row_number() over(partition by city_name order by sum(fare_amount) desc) as r_no
 from fact_trips t join dim_city c on
 t.city_id =c.city_id
 group by t.city_id,monthname(date)),
 cte2 as
 (select c.city_name, sum(fare_amount) as total_revenue_city 
 from fact_trips t join dim_city c on
 t.city_id =c.city_id group by t.city_id)
 
 select a.city_name,a.a.month,Revenue,
 concat(round(a.Revenue/total_revenue_city*100,2),'%') as Percentage_contribution 
 from cte1 a join cte2 b on 
 a.city_name = b.city_name
 where a.r_no=1
 