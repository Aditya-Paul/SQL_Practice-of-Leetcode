/* Write your T-SQL query statement below */
-- select pr.product_id, isnull(convert(decimal(10,2),sum(1.0 * pr.price * un.units) / sum(un.units)),0) as average_price 
-- from Prices pr
-- left outer join UnitsSold un
-- on pr.product_id = un.product_id
-- where  un.purchase_date between pr.start_date and pr.end_date
-- group by pr.product_id


select pr.product_id,
convert(decimal(10,2),ISNULL(sum(1.0 * pr.price * un.units) / sum(un.units),0)) as average_price 
		from Prices pr
		left outer join UnitsSold un
		on pr.product_id = un.product_id
		and  un.purchase_date between pr.start_date and pr.end_date
		group by pr.product_id