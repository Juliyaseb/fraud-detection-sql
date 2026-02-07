--- creating a table like the source table

Create table data_copy
like bank_transactions_data_2;

--- insering data to the new table 

select * from data_copy;
insert data_copy 
select * from bank_transactions_data_2;

--- viewing data from new table

select * from data_copy;

 --- checking duplicates

SELECT TransactionID, COUNT(*)
FROM data_copy
GROUP BY TransactionID
HAVING COUNT(*) > 1;    

select count(*)
from data_copy
where  TransactionID is null;

--- checking invalid Transaction amount 

select count(*)
from data_copy
where TransactionAmount=0 OR TransactionAmount is null;

--- converting date data to standard format

update data_copy
set TransactionDate = str_to_date(TransactionDate , "%Y-%m-%d %H:%i:%s"),
	PreviousTransactionDate = str_to_date(PreviousTransactionDate , "%Y-%m-%d %H:%i:%s");
     
--- checking whether there are any transcations with invalid date

SELECT *
FROM data_copy
WHERE TransactionDate > CURRENT_DATE;
















