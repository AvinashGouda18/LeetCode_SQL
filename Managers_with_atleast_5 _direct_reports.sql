with cte as(
select managerId
from employee
group by managerId 
having count(*) >= 5
)
select e.name
from cte inner join employee e on cte.managerID=e.Id