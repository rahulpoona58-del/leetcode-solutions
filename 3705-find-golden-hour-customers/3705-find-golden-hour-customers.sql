select customer_id, count(*) as total_orders,
round(
    sum(
        (time(order_timestamp) between '11:00:00' and '14:00:00')
        or
        (time(order_timestamp) between '18:00:00'  and '21:00:00')
    ) * 100 / count(*)
)as peak_hour_percentage, round(avg(order_rating), 2) as average_rating
from restaurant_orders
group by customer_id
having count(*) >= 3 and sum(
    (time(order_timestamp) between '11:00:00' and '14:00:00')
    or
    (time(order_timestamp) between '18:00:00' and '21:00:00')
) >= 0.6 * count(*)
and count(order_rating) >= 0.5 * count(*)
and avg(order_rating) >= 4.0
order by average_rating desc, customer_id desc;