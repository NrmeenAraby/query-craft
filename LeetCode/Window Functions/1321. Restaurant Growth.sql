/* Write your PL/SQL query statement below */
select visited_on, amount, average_amount
from (
    select  to_char(visited_on,'yyyy-mm-dd') as visited_on, 
        sum (amount) over (order by visited_on rows between 6 preceding and current row) as amount, 
        round(avg(amount) over(order by  visited_on rows between 6 preceding and current row) ,2 ) as average_amount,
        rank()over(order by visited_on) as rn
from (
    select visited_on,
    sum(amount) as amount
    from customer
    group by visited_on)
)
where rn>=7
order by visited_on 

