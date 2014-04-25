add jar /var/groupon/data/prashant/shoppers_challenge/udf/target/hive-udf-1.0.jar;

create temporary function bucketize as 'org.ml.hive.udf.UDFBucket';

create table if not exists shoppers.trainingset_b as
select
id,
chain,
offer,
market,
offerdate,
company,
brand,
category,
quantity,
offervalue,
bought_category
bought_category_q,
bought_category_a,
bucketize(bought_category,0,1,2,5,10,20) bbought_category,
bucketize(bought_category_q,0,1,2,5,10,20) bbought_category_q,
bucketize(bought_category_a,0,15,30,50,100,200) bbought_category_a,
bought_brand
bought_brand_q,
bought_brand_a,
bucketize(bought_brand,0,1,2,5,10,20) bbought_brand,
bucketize(bought_brand_q,0,1,2,5,10,20) bbought_brand_q,
bucketize(bought_brand_a,0,15,30,50,100,200) bbought_brand_a,
bought_company
bought_company_q,
bought_company_a,
bucketize(bought_company,0,1,2,5,10,20) bbought_company,
bucketize(bought_company_q,0,1,2,5,10,20) bbought_company_q,
bucketize(bought_company_a,0,15,30,50,100,200) bbought_company_a,
bought_company_brand
bought_company_brand_q,
bought_company_brand_a,
bucketize(bought_company_brand,0,1,2,5,10,20) bbought_company_brand,
bucketize(bought_company_brand_q,0,1,2,5,10,20) bbought_company_brand_q,
bucketize(bought_company_brand_a,0,15,30,50,100,200) bbought_company_brand_a,
bought_brand_category
bought_brand_category_q,
bought_brand_category_a,
bucketize(bought_brand_category,0,1,2,5,10,20) bbought_brand_category,
bucketize(bought_brand_category_q,0,1,2,5,10,20) bbought_brand_category_q,
bucketize(bought_brand_category_a,0,15,30,50,100,200) bbought_brand_category_a,
bought_company_category
bought_company_category_q,
bought_company_category_a,
bucketize(bought_company_category,0,1,2,5,10,20) bbought_company_category,
bucketize(bought_company_category_q,0,1,2,5,10,20) bbought_company_category_q,
bucketize(bought_company_category_a,0,15,30,50,100,200) bbought_company_category_a,
bought_company_brand_category
bought_company_brand_category_q,
bought_company_brand_category_a,
bucketize(bought_company_brand_category,0,1,2,5,10,20) bbought_company_brand_category,
bucketize(bought_company_brand_category_q,0,1,2,5,10,20) bbought_company_brand_category_q,
bucketize(bought_company_brand_category_a,0,15,30,50,100,200) bbought_company_brand_category_a,
repeattrips,
repeater
from
shoppers.trainingset;
