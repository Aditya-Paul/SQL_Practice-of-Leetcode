/* Write your T-SQL query statement below */
select(
select top 1 name as result
from(
			select us.name, mor.movie_id, mor.user_id, mor.rating, mor.created_at
			from Users us
			join MovieRating mor
			on us.user_id = mor.user_id
	)a
group by name
order by count(movie_id) desc, name asc) as results

union all
select(
select top 1 title as result
from(
			select mo.title, mor.movie_id, mor.user_id, mor.rating, mor.created_at
			from Movies mo
			join MovieRating mor
			on mo.movie_id = mor.movie_id
			where mor.created_at between '2020-02-01' and '2020-02-29'
	)a
group by title
order by avg(rating*1.00) desc, title asc) as results