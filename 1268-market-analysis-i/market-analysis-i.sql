/* Write your T-SQL query statement below */
select user_id as buyer_id,join_date, count(buyer_id) as orders_in_2019
from(
	select *
	from Users us
	left outer join (
	select *
	from Orders
	where order_date >= '2019-01-01' ) odr
	on odr.buyer_id = us.user_id
	)t
group by user_id,join_date
order by user_id