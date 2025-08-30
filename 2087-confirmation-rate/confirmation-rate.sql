/* Write your T-SQL query statement below */
select user_id, convert(decimal(10,2), case when confirm_count = 0 then 0
					 when confirm_count > 0 then 1.00 * confirm_count/total_count
				end) as confirmation_rate 
from(
	select sig.user_id, count(case when con.action = 'confirmed' then 1 end) as confirm_count, count(con.action) as total_count
	from Signups sig
	left outer join Confirmations con
	on sig.user_id = con.user_id
	group by sig.user_id
	)t