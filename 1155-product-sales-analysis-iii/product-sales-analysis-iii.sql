/* Write your T-SQL query statement below */
select product_id, year as first_year, quantity, price
from(
		select *, DENSE_RANK() over (partition by product_id order by year) as rnk
		from Sales
	)t
where rnk = 1