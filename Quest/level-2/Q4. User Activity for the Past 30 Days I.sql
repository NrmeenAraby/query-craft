select  to_char(activity_date,'yyyy-mm-dd') as "day",  count(distinct user_id) as "active_users"
from Activity
where date '2019-07-27' - activity_date between 0 and 29
group by to_char(activity_date,'yyyy-mm-dd')
having count(distinct user_id) > 0
