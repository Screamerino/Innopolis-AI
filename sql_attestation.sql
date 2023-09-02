-- 1.

select a.aircraft_code, a.model, a."range" , s.seat_no , s.fare_conditions
from aircrafts a 
join seats s on a.aircraft_code  = s.aircraft_code 

select model as name, 'самолет' as object_type
from aircrafts
union
select airport_name, 'аэропорт'
from airports;

-- 2.

select model, range
from aircrafts a 
where "range" >= 5000
order by "range" desc
limit 3;

-- 3.

select model, fare_conditions, count(*) as count_seats
from aircrafts a 
join seats s on a.aircraft_code = s.aircraft_code 
group by model, fare_conditions
order by model, count_seats;

-- 4.

select passenger_name, t.ticket_no, departure_airport , arrival_airport , status , fare_conditions, actual_departure , actual_arrival , amount, total_amount
from flights f 
join ticket_flights tf on f.flight_id = tf.flight_id 
right join tickets t on tf.ticket_no = t.ticket_no
left join bookings b on t.book_ref = b.book_ref ;

-- 5.

create or replace view top3_aircrafts_model_by_range_v as
	select model, range
	from aircrafts a 
	where "range" >= 5000
	order by "range" desc
	limit 3;

select * from top3_aircrafts_model_by_range_v;

