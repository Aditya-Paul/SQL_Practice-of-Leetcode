/* Write your T-SQL query statement below */
select top 1 customer_number
from (
		select customer_number, count(order_number) as sum_order
		from orders
		group by customer_number
	)t
order by sum_order desc