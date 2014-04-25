use shoppers;

create external table if not exists transactions (
id bigint,
chain bigint,
dept bigint,
category bigint,
company bigint,
brand bigint, 
eventdate string,
productsize float,
productmeasure string,
purchasequantity float,
purchaseamount float)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/prashant/shoppers/txns/';

create external table if not exists offers (
offer bigint,
category bigint, 
quantity float,
company bigint,
offervalue float,
brand bigint)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/prashant/shoppers/offers/';

create external table if not exists trainHistory (
id bigint,
chain bigint,
offer bigint,
market bigint,
repeattrips int,
repeater string,
offerdate string)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/prashant/shoppers/train/';

create external table if not exists testHistory (
id bigint,
chain bigint,
offer bigint,
market bigint,
offerdate string)
ROW FORMAT
DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n' 
STORED AS TEXTFILE
LOCATION '/user/prashant/shoppers/test/';

use default;
