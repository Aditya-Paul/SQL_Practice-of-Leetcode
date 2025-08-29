/* Write your T-SQL query statement below */
-- select query_name,
-- ISNULL(convert(decimal(10,2),((sum(1.0 * rating/position))/count(query_name))),0)  as quality,
-- ISNULL(convert(decimal(10,2),(sum(case when rating < 3 then 1 end) *100.0/count(query_name))),0) as poor_query_percentage 
-- from Queries
-- group by query_name


select query_name,
convert(decimal(10,2),((sum(1.0 * rating/position))/count(query_name)))  as quality,
convert(decimal(10,2),(sum(case when rating < 3 then 1 else 0 end) *100.0/count(query_name))) as poor_query_percentage 
from Queries
group by query_name