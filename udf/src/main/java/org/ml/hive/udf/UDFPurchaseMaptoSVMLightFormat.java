package org.ml.hive.udf;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.exec.UDFArgumentException;
import org.apache.hadoop.hive.ql.exec.Description;
import org.apache.commons.lang.StringUtils;

import java.util.Map;

public final class UDFPurchaseMaptoSVMLightFormat extends UDF {
    private String toPerma(String str) {
        if (str == null )
            return null;
        String delims = "[ .,/?|!:&\\-\\^]+";
        String[] tokens = str.split(delims);
        
        String perma = StringUtils.join(tokens, '-');
        return perma.toLowerCase();
    }
 
    public String evaluate(Map<String,String> strMap, String prefix, double normfactor,  int numFeatures) throws UDFArgumentException {
        if (strMap == null || strMap.size() == 0) 
            return "";
        
        UDFMurmurHash3 mmhash = new UDFMurmurHash3();

        int ind=0;
        String[] result = new String[strMap.size()];

        for (Map.Entry<String,String> entry : strMap.entrySet()) { 
            String key = toPerma(entry.getKey());
            double wt = Double.parseDouble(entry.getValue())/normfactor;
            wt = Math.round(wt*10000.0)/10000.0;
            String value = Double.valueOf(wt).toString();
            
            String  comp_key = new StringBuilder(prefix).append('-').append(key).toString();
            Integer hash_key = mmhash.evaluate(comp_key, numFeatures) ;
            
            String token = new StringBuilder(hash_key.toString()).append(":").append(value).toString();
            
            result[ind++]=token;
        }
        return StringUtils.join(result, ' ');
    }

    
}

