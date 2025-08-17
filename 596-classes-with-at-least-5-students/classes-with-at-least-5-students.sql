/* Write your T-SQL query statement below */
select class
from(
		select class, count(student) as cnt
		from Courses
		group by class
	)t
where cnt >= 5
