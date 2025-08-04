
-- /* Write your T-SQL query statement below */
-- select (
-- 		select salary
-- 		from(
-- 			select salary, row_number() over (order by Salary ) as SecondHighestSalary 
-- 			from Employee
-- 			)t
-- 		where SecondHighestSalary = 2 
-- 		) as SecondHighestSalary

-- SELECT 
--     (SELECT  salary
--      FROM Employee
-- 	 group by salary
--      ORDER BY salary DESC
--      OFFSET 1 ROW FETCH NEXT 1 ROW ONLY) 
--      AS SecondHighestSalary;

select (
			select salary
			from(
					select salary, row_number() over (order by Salary desc) as SecondHighestSalary 
					from Employee
					group by salary
				)t
			where SecondHighestSalary = 2 
		) as SecondHighestSalary