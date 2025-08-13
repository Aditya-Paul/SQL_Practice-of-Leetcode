
/* Write your T-SQL query statement below */
select player_id, event_date as first_login
from (
select *,
DENSE_RANK() over (partition by player_id order by event_date) as rnk
from Activity ) t
where rnk <2