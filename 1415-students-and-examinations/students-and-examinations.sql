/* Write your T-SQL query statement below */
select x.id as student_id ,x.student_name,x.subject_name, sum(mach_cnt) as attended_exams 
from (
		select  t.id,t.student_name,t.subject_name,ex.student_id,
				(case when t.subject_name = ex.subject_name then 1 else 0 end) as mach_cnt
		from(
				select stu.student_id as id,stu.student_name,sub.subject_name
				from Students stu
				cross join Subjects sub
			 )t
		left outer join Examinations ex
		on t.id = ex.student_id AND t.subject_name = ex.subject_name
	  )x
group by x.id,x.student_name,x.subject_name