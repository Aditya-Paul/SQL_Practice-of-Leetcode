/* Write your T-SQL query statement below */
--7 testcases passed
-- select a_id as id, case 
-- 		  when a_id = (select count(id) from Seat) then t.a_student 
-- 		  when a_id % 2 !=0 then (select student from Seat where id = a_id + 1)
-- 		  when a_id % 2 =0 then (select student from Seat where id = a_id - 1)
-- 		  end as student
-- from(
-- select a.id as a_id, a.student as a_student,b.id as b_id, b.student as b_student
-- from Seat a
-- cross join Seat b
-- where a.id + 1 = b.id + 1)t

--7 testcases passed
select a_id as id, case 
		  when a_id = (select count(id) from Seat) and  a_id % 2 !=0 then t.a_student 
		  when a_id % 2 !=0 then (select student from Seat where id = a_id + 1)
		  when a_id % 2 =0 then (select student from Seat where id = a_id - 1)
		  end as student
from(
select a.id as a_id, a.student as a_student,b.id as b_id, b.student as b_student
from Seat a
cross join Seat b
where a.id + 1 = b.id + 1)t