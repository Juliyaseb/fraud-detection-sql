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