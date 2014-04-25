add jar /var/groupon/data/prashant/shoppers_challenge/udf/target/hive-udf-1.0.jar;

create temporary function bucketize as 'org.ml.hive.udf.UDFBucket';
create temporary function mm3hash as 'org.ml.hive.udf.UDFMurmurHash3';
create temporary function svmfeatz as 'org.ml.hive.udf.UDFSVMLightFeaturizer';
create temporary function maptosvmstr as 'org.ml.hive.udf.UDFPurchaseMaptoSVMLightFormat';
create temporary function svmsort as 'org.ml.hive.udf.UDFSVMLightFormatSorter';
create temporary function rescale  as 'org.ml.hive.udf.UDFRescale';

drop table if exists shoppers.trainingset_svmfmt;
create table if not exists shoppers.trainingset_svmfmt as
select
id,
offerdate,
repeattrips,
repeater,
svmfeatz(mm3hash(concat('chain^', offer),262144)) chain,
svmfeatz(mm3hash(concat('offer^', offer),262144)) offer,
svmfeatz(mm3hash(concat('market^', market),262144)) market,
svmfeatz(mm3hash(concat('company^', company),262144)) company,
svmfeatz(mm3hash(concat('brand^', brand),262144)) brand,
svmfeatz(mm3hash(concat('category^', category),262144)) category,
svmfeatz(mm3hash('quantity',262144), round(rescale(quantity,0.0,200.0),4)) quantity,
svmfeatz(mm3hash('offervalue',262144), round(rescale(offervalue,0.0,200.0),4)) offervalue,
svmfeatz(mm3hash(concat('bought_category^',bbought_category),262144)) bought_category,
svmfeatz(mm3hash(concat('bought_category_q^', bbought_category_q),262144)) bought_category_q,
svmfeatz(mm3hash(concat('bought_category_a^',bought_category_a),262144)) bought_category_a,
svmfeatz(mm3hash(concat('bought_brand^',bbought_brand)262144)) bought_brand,
svmfeatz(mm3hash(concat('bought_brand_q^',bbought_brand_q),262144) bought_brand_q,
svmfeatz(mm3hash(concat('bought_brand_a^',bbought_brand_a),262144)) bought_brand_a,
svmfeatz(mm3hash(concat('bought_company^',bbought_company)262144))  bought_company,
svmfeatz(mm3hash(concat('bought_company_q^',bbought_company_q),262144)) bought_company_q, 
svmfeatz(mm3hash(concat('bought_company_a^',bbought_company_a),262144)) bought_company_a,
svmfeatz(mm3hash(concat('bought_company_brand^',bbought_company_brand),262144)) bought_company_brand,
svmfeatz(mm3hash(concat('bought_company_brand_q^',bbought_company_brand_q),262144)) bought_company_brand_q,
svmfeatz(mm3hash(concat('bought_company_brand_a^',bbought_company_brand_a),262144)) bought_company_brand_a,
svmfeatz(mm3hash(concat('bought_brand_category^',bbought_brand_category),262144)) bought_brand_category,
svmfeatz(mm3hash(concat('bought_brand_category_q^',bbought_brand_category_q),262144)) bought_brand_category_q,
svmfeatz(mm3hash(concat('bought_brand_category_a^',bbought_brand_category_a),262144)) bought_brand_category_a,
svmfeatz(mm3hash(concat('bought_company_category^',bbought_company_category),262144)) bought_company_category,
svmfeatz(mm3hash(concat('bought_company_category_q^',bbought_company_category_q),262144)) bought_company_category_q,
svmfeatz(mm3hash(concat('bought_company_category_a^',bbought_company_category_a),262144)) bought_company_category_a,
svmfeatz(mm3hash(concat('bought_company_brand_category^',bbought_company_brand_category),262144)) bought_company_brand_category,
svmfeatz(mm3hash(concat('bought_company_brand_category_q^',bbought_company_brand_category_q),262144)) bought_company_brand_category_q,
svmfeatz(mm3hash(concat('bought_company_brand_category_a^',bbought_company_brand_category_a),262144)) bought_company_brand_category_a
from
shoppers.trainingset_b;
