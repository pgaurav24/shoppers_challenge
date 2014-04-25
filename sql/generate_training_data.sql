create table if not exists shoppers.trainingset as
select
t.id,
t.chain,
t.offer,
t.market,
t.offerdate,
t.company,
t.brand,
t.category,
t.quantity,
t.offervalue,
round(coalesce(a.bought_category,0.0),2) bought_category,
round(coalesce(a.bought_category_q,0.0),2) bought_category_q,
round(coalesce(a.bought_category_a,0.0),2) bought_category_a,
round(coalesce(b.bought_brand,0.0),2) bought_brand,
round(coalesce(b.bought_brand_q,0.0),2) bought_brand_q,
round(coalesce(b.bought_brand_a,0.0),2) bought_brand_a,
round(coalesce(c.bought_company,0.0),2) bought_company,
round(coalesce(c.bought_company_q,0.0),2) bought_company_q,
round(coalesce(c.bought_company_a,0.0),2) bought_company_a,
round(coalesce(x.bought_company_brand,0.0),2) bought_company_brand,
round(coalesce(x.bought_company_brand_q,0.0),2) bought_company_brand_q,
round(coalesce(x.bought_company_brand_a,0.0),2) bought_company_brand_a,
round(coalesce(y.bought_brand_category,0.0),2) bought_brand_category,
round(coalesce(y.bought_brand_category_q,0.0),2) bought_brand_category_q,
round(coalesce(y.bought_brand_category_a,0.0),2) bought_brand_category_a,
round(coalesce(z.bought_company_category,0.0),2) bought_company_category,
round(coalesce(z.bought_company_category_q,0.0),2) bought_company_category_q,
round(coalesce(z.bought_company_category_a,0.0),2) bought_company_category_a,
round(coalesce(q.bought_company_brand_category,0.0),2) bought_company_brand_category,
round(coalesce(q.bought_company_brand_category_q,0.0),2) bought_company_brand_category_q,
round(coalesce(q.bought_company_brand_category_a,0.0),2) bought_company_brand_category_a,
t.repeattrips,
t.repeater
from
(
select
h.id,
h.chain,
h.offer,
h.market,
h.repeattrips,
h.repeater,
h.offerdate,
o.company,
o.brand,
o.category,
o.quantity,
o.offervalue
from
shoppers.offers o
join
shoppers.trainhistory h
on (o.offer = h.offer)
) t
left outer join
shoppers.category_feature a
on (t.id=a.id and t.chain=a.chain and t.category=a.category)
left outer join
shoppers.brand_feature b
on (t.id=b.id and t.chain=b.chain and t.brand=b.brand)
left outer join
shoppers.company_feature c
on (t.id=c.id and t.chain=c.chain and t.company=c.company)
left outer join
shoppers.company_brand_feature x
on (t.id=x.id and t.chain=x.chain and 
    t.company=x.company and t.brand=x.brand)
left outer join
shoppers.brand_category_feature y
on (t.id=y.id and t.chain=y.chain and 
    t.category=y.category and t.brand=y.brand)
left outer join
shoppers.company_category_feature z
on (t.id=z.id and t.chain=z.chain and 
    t.category=z.category and t.company=z.company)
left outer join
shoppers.company_brand_category_feature q
on (t.id = q.id and t.chain = q.chain and
    t.company=q.company and t.brand=q.brand and t.category=q.category);
