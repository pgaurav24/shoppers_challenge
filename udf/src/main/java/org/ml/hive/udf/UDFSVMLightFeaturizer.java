package org.ml.hive.udf;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.exec.Description;
import org.apache.commons.lang.StringUtils;

public final class UDFSVMLightFeaturizer extends UDF {
    public static Double epsilon = new Double(0.00001);

    public String evaluate(Integer featureind) {
        if (featureind == null)
            return "";
        
        String token = new StringBuilder(" ").append(featureind).append(":").append("1.0").toString();
        
        return token;
    }
    
    public String evaluate(String featurevalue) {
        if (featurevalue == null || featurevalue.isEmpty())
            return "";
        
        String token = new StringBuilder(" ").append(featurevalue).toString();
        
        return token;
    }

    public String evaluate(Integer featureind, Integer featurevalue) {
        if (featureind == null)
            return null;
        if (featurevalue == null)
            return "";
        if (featurevalue.intValue() == 0)
            return "";
        
        String token = new StringBuilder(" ").append(featureind).append(":").append(featurevalue.intValue()).toString();
        
        return token;
    }

    public String evaluate(Integer featureind, Double featurevalue) {
        if (featureind == null)
            return null;
        if (featurevalue == null)
            return "";
        if (Math.abs(featurevalue.doubleValue()) <= epsilon.doubleValue())
            return "";
        
        String token = new StringBuilder(" ").append(featureind).append(":").append(featurevalue.doubleValue()).toString();

        return token;
    }
    
    public String evaluate(Integer featureind, Float featurevalue) {
        if (featureind == null)
            return null;
        if (featurevalue == null)
            return "";
        if (Math.abs(featurevalue.floatValue()) <= epsilon.floatValue())
            return "";
        
        String token = new StringBuilder(" ").append(featureind).append(":").append(featurevalue.floatValue()).toString();

        return token;
    }
}

