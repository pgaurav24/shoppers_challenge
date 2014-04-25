drop table if exists shoppers.company_brand_category_feature;
create table if not exists shoppers.company_brand_category_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.company,
o1.brand, 
o1.category, 
count(1) bought_company_brand_category,
sum(t1.purchasequantity) bought_company_brand_category_q,
sum(t1.purchaseamount) bought_company_brand_category_a
from
(
select
h.id,
h.chain,
o.company,
o.brand,
o.category
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.company=t1.company and o1.brand=t1.brand and o1.category=t1.category)
group by o1.id, o1.chain, o1.company, o1.brand, o1.category;

drop table if exists shoppers.category_feature; 
create table if not exists shoppers.category_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.category, 
count(1) bought_category,
sum(t1.purchasequantity) bought_category_q,
sum(t1.purchaseamount) bought_category_a
from
(
select
h.id,
h.chain,
o.category
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.category = t1.category)
group by o1.id, o1.chain, o1.category;

drop table if exists shoppers.brand_feature;
create table if not exists shoppers.brand_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.brand, 
count(1) bought_brand,
sum(t1.purchasequantity) bought_brand_q,
sum(t1.purchaseamount) bought_brand_a
from
(
select
h.id,
h.chain,
o.brand
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.brand=t1.brand)
group by o1.id, o1.chain, o1.brand;

drop table if not exists shoppers.company_feature;
create table if not exists shoppers.company_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.company,
count(1) bought_company,
sum(t1.purchasequantity) bought_company_q,
sum(t1.purchaseamount) bought_company_a
from
(
select
h.id,
h.chain,
o.company
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.company=t1.company)
group by o1.id, o1.chain, o1.company;

drop table if exists shoppers.company_brand_feature;
create table if not exists shoppers.company_brand_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.company,
o1.brand, 
count(1) bought_company_brand,
sum(t1.purchasequantity) bought_company_brand_q,
sum(t1.purchaseamount) bought_company_brand_a
from
(
select
h.id,
h.chain,
o.company,
o.brand
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.company=t1.company and o1.brand=t1.brand)
group by o1.id, o1.chain, o1.company, o1.brand;

drop table if exists shoppers.brand_category_feature; 
create table if not exists shoppers.brand_category_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.brand, 
o1.category,
count(1) bought_brand_category,
sum(t1.purchasequantity) bought_brand_category_q,
sum(t1.purchaseamount) bought_brand_category_a
from
(
select
h.id,
h.chain,
o.brand,
o.category
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
   o1.brand=t1.brand and o1.category=t1.category)
group by o1.id, o1.chain, o1.brand, o1.category;

drop table if exists shoppers.company_category_feature;
create table if not exists shoppers.company_category_feature as
select
/*+ MAPJOIN(o1) */
o1.id,
o1.chain,
o1.company,
o1.category, 
count(1) bought_company_category,
sum(t1.purchasequantity) bought_company_category_q,
sum(t1.purchaseamount) bought_company_category_a
from
(
select
h.id,
h.chain,
o.company,
o.category
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) o1
join
shoppers.transactions t1
on (o1.id = t1.id and o1.chain = t1.chain and
    o1.company = t1.company and o1.category = t1.category)
group by o1.id, o1.chain, o1.company, o1.category;
