/* Write your PL/SQL query statement below */
select st.student_id as "student_id", st.student_name as "student_name", s. subject_name as"subject_name", (
    select count (*)
    from Examinations e
    where e.student_id=st.student_id and e.subject_name= s.subject_name
) as "attended_exams"
from students st cross join subjects s;
order by "student_id","subject_name"
