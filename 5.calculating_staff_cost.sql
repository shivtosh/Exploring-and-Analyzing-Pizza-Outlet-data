SELECT 

st.staff_id,
-- count(rt.date) as num_of_days
st.first_name,st.last_name,
rt.date, 

((hour(timediff(sh.end_time,sh.start_time))*60)+ minute(timediff(end_time,start_time)))/60 AS number_of_hours,
((hour(timediff(sh.end_time,sh.start_time))*60)+ minute(timediff(end_time,start_time)))/60 * st.hourly_rate AS staff_cost


FROM rota rt

LEFT JOIN shift sh ON rt.shift_id = sh.shift_id
LEFT JOIN staff st ON rt.staff_id = st.staff_id 
	


    
