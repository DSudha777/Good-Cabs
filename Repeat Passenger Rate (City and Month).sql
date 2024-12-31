select monthname(month),c.city_name,total_passengers,repeat_passengers,
concat(round(repeat_passengers/total_passengers*100,2),'%') as repeat_passenger_percentage
 from fact_passenger_summary t
join dim_city c on t.city_id=c.city_id