select
A.num_txns,
count(1) num_users
from
(
select
id,count(1) as num_txns
from
shoppers.transactions 
group by id
) A
group by A.num_txns;
