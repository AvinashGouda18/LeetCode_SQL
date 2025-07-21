with u_location as(
    select lon,lat 
    from Insurance
    group by lon,lat
    having count(*)=1
),
dup_2015 as(
    select tiv_2015 
    from Insurance 
    group by tiv_2015
    having count(*)>1
)
select round(sum(tiv_2016),2) as tiv_2016 
from Insurance i
inner join u_location ul on ul.lon = i.lon and ul.lat = i.lat
inner join dup_2015 d15 on d15.tiv_2015 = i.tiv_2015 