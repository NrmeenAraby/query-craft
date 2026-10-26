/* Write your PL/SQL query statement below */
select name as results
from (
    select name 
    from users u join movierating mr on u.user_id = mr.user_id
    group by u.user_id, u.name
    order by count(*) desc , u.name  
)
where rownum=1

union all

select title as results
from(
    select title 
    from movies m join movierating mr on m.movie_id=mr.movie_id
    where to_char(created_at,'yyyy-mm') = '2020-02'
    group by m.movie_id, m.title
    order by avg(rating) desc, title
)
where rownum=1

