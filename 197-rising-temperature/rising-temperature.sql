/* Write your T-SQL query statement below */
select t2.id 
from weather t1
cross join Weather t2
where DATEDIFF(day,t1.recordDate,t2.recordDate) = 1
	  and
	  t2.temperature > t1.temperature