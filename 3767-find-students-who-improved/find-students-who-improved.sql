/* Write your T-SQL query statement below */
select student_id, subject,first_score,latest_score
from(
	select student_id, subject, max(case when rnk = 1 then score end) as first_score,
								max(case when rnk = 2 then score end) as latest_score,
								count(score) as exam_count
	from(
		select a.student_id, a.subject, a.first_exam,a.last_exam,b.score,b.exam_date, rank() over (partition by a.student_id,a.subject order by exam_date) as rnk
		from(
			select student_id, subject, min(exam_date) as first_exam, max(exam_date) as last_exam
			from Scores
			group by student_id, subject
			)  a
		left outer join Scores b
		on a.student_id = b.student_id and a.subject = b.subject
        where a.first_exam = b.exam_date or a.last_exam = b.exam_date
		)t
	group by student_id, subject
	)x
where exam_count > 1 and latest_score - first_score > 0
order by student_id asc , subject asc