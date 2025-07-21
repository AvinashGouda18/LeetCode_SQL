CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT max(case when rn=@N then salary else null end) as SecondHighestSalary
        from (
            select salary,
            dense_rank() over(order by salary desc) as rn
            from employee
            ) a
    );
END