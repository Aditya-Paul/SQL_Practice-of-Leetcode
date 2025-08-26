/* Write your T-SQL query statement below */
select product_name, year, price 
from Sales as se
join Product as po
on se.product_id = po.product_id