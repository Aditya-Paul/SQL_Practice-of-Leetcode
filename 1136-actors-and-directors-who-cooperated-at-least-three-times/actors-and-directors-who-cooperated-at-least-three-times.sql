/* Write your T-SQL query statement below */
select actor_id,director_id
from (
		select actor_id,director_id, count(*) as cnt
		from ActorDirector
		group by actor_id,director_id
	 )t
where cnt >= 3