with cte as(
select id,num,
lag(num,1) over(order by id) as prev_value
,lead(num,1) over(order by id) as next_value
from Logs 
)
select distinct num as ConsecutiveNums 
from cte where num = prev_value and num = next_value