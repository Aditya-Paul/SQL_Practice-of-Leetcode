/* Write your T-SQL query statement below */
select user_id, convert(decimal(10,2), avg(case when activity_type = 'free_trial' then 1.00*activity_duration end )) as trial_avg_duration ,
				   convert(decimal(10,2), avg(case when activity_type = 'paid' then 1.00*activity_duration end )) as paid_avg_duration 
from UserActivity
group by user_id 
having convert(decimal(10,2), avg(case when activity_type = 'free_trial' then 1.00*activity_duration end )) is not null and
				   convert(decimal(10,2), avg(case when activity_type = 'paid' then 1.00*activity_duration end )) is not null