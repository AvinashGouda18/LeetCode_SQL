select max(case when rn=2 then salary else null end) as SecondHighestSalary
from(
select salary,
dense_rank() over(order by salary desc) as rn
from employee) a