ff = ['bought_category',\
'bought_brand',\
'bought_company',\
'bought_company_brand',\
'bought_brand_category',\
'bought_company_category',\
'bought_company_brand_category']

for f in ff:
    print '%s,' %(f)
    print '%s_q,' %(f)
    print '%s_a,' %(f)
    print 'bucketize(%s,0,1,2,5,10,20) b%s,' % (f,f)
    print 'bucketize(%s_q,0,1,2,5,10,20) b%s_q,' % (f,f)
    print 'bucketize(%s_a,0,15,30,50,100,200) b%s_a,' % (f,f)
