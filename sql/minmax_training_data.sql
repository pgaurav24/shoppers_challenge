select
max(quantity), 
max(offervalue), 
max(bought_category),
max(bought_category_q),
max(bought_category_a),
max(bought_brand),
max(bought_brand_q),
max(bought_brand_a),
max(bought_company),
max(bought_company_q),
max(bought_company_a),
max(bought_company_brand),
max(bought_company_brand_q),
max(bought_company_brand_a),
max(bought_brand_category),
max(bought_brand_category_q),
max(bought_brand_category_a),
max(bought_company_category),
max(bought_company_category_q),
max(bought_company_category_a),
max(bought_company_brand_category),
max(bought_company_brand_category_q),
max(bought_company_brand_category_a)
from
shoppers.trainingset ;