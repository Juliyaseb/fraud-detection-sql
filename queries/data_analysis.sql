--- analysis part 

select AccountID , date(TransactionDate)
from data_copy
group by AccountID , date(TransactionDate)
having count(*)>8;

--- finding outliers

select count(* )
from data_copy
where TransactionAmount >
(select avg(TransactionAmount) + 3* stddev(TransactionAmount)
from data_copy);

---  multi location transaction

select AccountID, count(distinct Location) as loc_count
from data_copy 
group by AccountID 
having count(distinct Location)>3;

--- checking no.of attempts 

select *
from data_copy
where LoginAttempts>3;

--- Transaction in odd time

select * 
from data_copy
where Hour(TransactionDate) between 0 and 4;

--- Checking transaction if same account from multiple devices

select AccountID,count(distinct DeviceID) as device_count
from data_copy
group by AccountID
having count(distinct DeviceID) > 4;















