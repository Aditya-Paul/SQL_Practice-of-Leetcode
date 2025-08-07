/* Write your T-SQL query statement below */
select top 1 person_name
from(
	select turn,person_id,person_name,weight,lead(weight) over (order by turn)as tt,
				 case when SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) <=1000 then SUM(weight) OVER (ORDER BY turn ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
				 else ' '
				 end AS total
	from Queue
	)t
order by total desc