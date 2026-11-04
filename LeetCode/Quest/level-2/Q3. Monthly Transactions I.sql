/* Write your PL/SQL query statement below */
select to_char(trans_date , 'yyyy-mm') as "month", country,count(id) as "trans_count", sum(
    case state
      when 'approved' then 1
      else 0
    end
)  as "approved_count", sum(amount) as "trans_total_amount",
sum(
    case state 
        when 'approved' then amount
        else 0
    end
)as "approved_total_amount"
from Transactions 
group by  to_char(trans_date , 'yyyy-mm'), country
