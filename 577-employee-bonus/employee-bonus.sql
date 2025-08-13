/* Write your T-SQL query statement below */
select t.name,t.bonus
from (
		select em.empId,em.name,em.salary,bo.bonus
		from Employee em
		Left outer join Bonus bo
		on em.empId = bo.empId
	)as t
where  t.bonus <1000 OR t.bonus IS NULL