-- Query 1
select
  b.booking_id,
  u.name as "customer_name",
  v.vehicle_name,
  b.start_date,
  b.end_date,
  b.status
from
  booking as b
  inner join users as u on b.user_id = u.user_id
  inner join vehicle as v on b.vehicle_id = v.vehicle_id


-- Query 2
select
  *
from
  vehicle as v
where
  not exists (
    select
      *
    from
      booking as b
    where
      v.vehicle_id = b.vehicle_id
  )

