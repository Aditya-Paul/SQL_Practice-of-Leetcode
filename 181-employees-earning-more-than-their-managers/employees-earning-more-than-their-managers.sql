/* Write your T-SQL query statement below */
/* Write your T-SQL query statement below */
SELECT b.name as Employee
FROM employee a 
JOIN employee b ON b.managerId = a.id
where b.salary > a.salary