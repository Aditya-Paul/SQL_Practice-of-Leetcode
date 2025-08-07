/* Write your T-SQL query statement below */
delete from Person
where id in (	
			  select id
			  from 
				(
					select id, Email, ROW_NUMBER() over ( partition by email order by id) as srl
					from Person
				) as srl_table
			  where srl >1
			)
select * from Person
order by id 