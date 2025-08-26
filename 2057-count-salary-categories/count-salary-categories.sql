select category,count(acoount_type) as accounts_count 
from (
SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary'
) as a
left outer join
(
	select income, case when income < 20000 then 'Low Salary'
				when income > 50000 then 'High Salary'
				when income between 20000 and 50000 then 'Average Salary'
				end as acoount_type
	from Accounts) as b
on a.category = b.acoount_type
group by category
order by count(acoount_type) desc