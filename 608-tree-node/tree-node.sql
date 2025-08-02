/* Write your T-SQL query statement below */
--18 testcases passed
-- select a_id as id, case when b_id is NULL then 'Leaf' else cnt end as type
-- from(
-- 		select a.id AS a_id,b.id AS b_id,b.p_id AS b_p_id,b.cnt
-- 		from (
-- 				select id,p_id
-- 				from Tree 
-- 			 )a
-- 		left outer join (
-- 								select id, p_id,case when p_id is NULL then 'Root' else 'Inner' end as cnt
-- 								--, case when p_id is NULL then 'root' else 'inner' end as cnt
-- 								from Tree
-- 								where id in (
-- 											 select p_id
-- 											 from tree
-- 											 )
-- 							 )b
-- 		on a.id = b.id
-- 	)t



--20 / 20 testcases passed

select a_id as id, case 
						when (select count(id) from Tree) = 1 then 'Root' 
					    when (select count(id) from Tree) > 1 and max(b_id) is NULL then 'Leaf' 
						else max(cnt)
						end as type
from(

		select a.id AS a_id,b.id AS b_id,b.p_id AS b_p_id,b.cnt
		from (
				select id,p_id
				from Tree
			 )a
		left outer join (
								select id, p_id,case when p_id is NULL then 'Root' else 'Inner' end as cnt
								--, case when p_id is NULL then 'root' else 'inner' end as cnt
								from Tree
								where id in (
											 select p_id
											 from tree
											 )
							 )b
		on a.id = b.id
	)t
group by a_id

-- -- chatgpt query
-- SELECT 
--     t.id,
--     CASE 
--         WHEN t.p_id IS NULL THEN 'Root'
--         WHEN c.id IS NULL THEN 'Leaf'
--         ELSE 'Inner'
--     END AS type
-- FROM Tree t
-- LEFT JOIN Tree c
--     ON t.id = c.p_id;

-- -- my query and took help form chatgpt query
-- SELECT 
--     t.id,
--     CASE 
--         WHEN t.p_id IS NULL THEN 'Root'
--         WHEN c.p_id IS NULL THEN 'Leaf'
--         ELSE 'Inner'
--     END AS type
-- from Tree1 t
-- left join (select p_id
-- 		   from tree1
-- 		   group by p_id)c
-- on t.id = c.p_id