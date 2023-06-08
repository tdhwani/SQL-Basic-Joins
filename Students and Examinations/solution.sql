select 
  q1.student_id, 
  q1.student_name, 
  q1.subject_name, 
  CASE WHEN attended_exams IS NULL THEN 0 ELSE attended_exams END as attended_exams 
from 
  (
    select 
      student_id, 
      student_name, 
      subject_name 
    from 
      Students, 
      Subjects
  ) as q1 
  left join (
    select 
      student_id, 
      subject_name, 
      count(subject_name) as attended_exams 
    from 
      Examinations 
    group by 
      subject_name, 
      student_id
  ) as q2 on q1.student_id = q2.student_id 
  and q1.subject_name = q2.subject_name 
order by 
  q1.student_id, 
  q1.subject_name;
