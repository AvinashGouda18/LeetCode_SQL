with cte as(
select player_id, min(event_date) as first_login_id
from Activity
group by player_id
)

select round(count(distinct a.player_id)*1.0/(select count(distinct player_id)
from Activity),2) as fraction 
from Activity a
inner join cte on a.player_id = cte.player_id
and a.event_date = dateadd(day,1,cte.first_login_id)