/* Write your T-SQL query statement below */
select name
from SalesPerson
where sales_id not in (
							SELECT t.sales_id
							FROM 
									(
									select coor2_table.name,coor2_table.sales_id
									from (
											select co.com_id, co.name,co.city, or2.order_id,or2.order_date, or2.sales_id
											from Company co
											join Orders or2
											on co.com_id = or2.com_id
										) as coor2_table
									join SalesPerson se
									on coor2_table.sales_id = se.sales_id
									) t
							GROUP BY t.sales_id,t.name
							HAVING SUM(CASE WHEN name = 'RED' THEN 1 ELSE 0 END) = 1
							)/* Write your T-SQL query statement below */
