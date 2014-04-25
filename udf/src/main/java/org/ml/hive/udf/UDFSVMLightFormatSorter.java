package org.ml.hive.udf;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.exec.Description;
import org.apache.hadoop.hive.ql.exec.UDFArgumentException;

import org.apache.commons.lang.StringUtils;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.Collections;

public final class UDFSVMLightFormatSorter extends UDF {
     public String evaluate(Map<String,String> featureMap) throws UDFArgumentException {
        if (featureMap == null || featureMap.size() == 0) 
            return "";
        
        String[] result = new String[featureMap.size()];
        
        int i=0;
        Integer[] arrayKeys = new Integer[featureMap.size()];
        
        for (String str : featureMap.keySet()) {
            arrayKeys[i++] = new Integer(Integer.parseInt(str));
        }
        
        List<Integer> sortedKeys = Arrays.asList(arrayKeys);
        Collections.sort(sortedKeys);
        
        i=0;
        for (Integer key : sortedKeys) {
            String value = featureMap.get(key.toString());
            String token = new StringBuilder("").append(key).append(":").append(value).toString();
            
            result[i++]=token;
        }
        return StringUtils.join(result, ' ');
    }
    
    public static void main(String [] args) throws Exception {
        Map<String,String> hm = new HashMap<String,String>();
        // 1306894:1.0 5396561:1.0 5827553:1.0 9881214:1.0 13821669:0.11
        hm.put("1306894", new String("1.0"));
        hm.put("13821669", new String("0.11"));
        hm.put("5827553", new String("1.0"));
        
        UDFSVMLightFormatSorter sorter = new UDFSVMLightFormatSorter();
        System.out.println(sorter.evaluate(hm));
    }
}

