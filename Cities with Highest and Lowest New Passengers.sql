with cte1 as(select c.city_name, sum(new_passengers) as New_Passengers ,
row_number() over( order by sum(new_passengers) desc) as r_no
from fact_passenger_summary p join dim_city c
on c.city_id = p.city_id
group by p.city_id
order by New_Passengers desc )

select city_name,New_Passengers,
case when r_no<=3 then 'Top 3'
	when r_no>=8 then 'Bottom 3'
    else ''
    end as City_category
    from cte1