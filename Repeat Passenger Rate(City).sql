select c.city_name,sum(total_passengers) as total_passengers,sum(repeat_passengers) as repeat_paasengers,
concat(round(sum(repeat_passengers)/sum(total_passengers)*100,2),'%') as repeat_passenger_percentage
 from fact_passenger_summary t
join dim_city c on t.city_id=c.city_id
group by city_name
order by repeat_passenger_percentage desc