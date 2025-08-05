/* Write your T-SQL query statement below */
-- select product_id,new_price as price
-- from(
-- 	select *, DENSE_RANK() over (partition by product_id order by change_date desc) as rnk
-- 	from Products
-- 	where change_date <= '2019-08-16'
-- 	)a
-- where rnk = 1
-- union all
-- select product_id, case when new_price > 10 then '10' end as new_price
-- from Products
-- where product_id in (
-- 					select product_id
-- 					from Products
-- 					where product_id not in (
-- 												select product_id
-- 												from(
-- 												select *, DENSE_RANK() over (partition by product_id order by change_date desc) as rnk
-- 												from Products
-- 												where change_date <= '2019-08-16'
-- 												)a
-- 												where rnk = 1
-- 											)
-- 					)
-- order by product_id

select product_id,new_price as price
from(
	select *, DENSE_RANK() over (partition by product_id order by change_date desc) as rnk
	from Products
	where change_date <= '2019-08-16'
	)a
where rnk = 1

union
					select product_id,new_price
					from(
						select product_id, case when new_price >= 10 then '10' end as new_price
						from Products
						where product_id not in (
													select product_id
													from(
															select *, DENSE_RANK() over (partition by product_id order by change_date desc) as rnk
															from Products
															where change_date <= '2019-08-16'
														)a
													where rnk = 1
												)
						)t
					group by product_id,new_price
order by product_id