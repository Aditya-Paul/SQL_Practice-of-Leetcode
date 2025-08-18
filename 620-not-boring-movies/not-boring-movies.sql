/* Write your T-SQL query statement below */
select *
from cinema
where ID % 2 = 1 and description != 'boring'
order by rating desc