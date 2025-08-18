/* Write your T-SQL query statement below */
select max(num) as num
from(
	select *, count(num) as counts
	from MyNumbers
	group by num
	having count(num) = 1
	
	)T