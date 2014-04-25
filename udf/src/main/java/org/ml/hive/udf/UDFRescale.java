package org.ml.hive.udf;

import org.apache.hadoop.hive.ql.exec.UDF;

/**
 * Min-Max normalization 
 * 
 * @see http://en.wikipedia.org/wiki/Feature_scaling
 */
public class UDFRescale extends UDF {

    /**
     * min-max normalization
     */
    public float evaluate(float value, float min, float max) {
        return min_max_normalization(value, min, max);
    }

    public float evaluate(double value, double min, double max) {
        return min_max_normalization((float)value, (float) min, (float) max);
    }

    public static float min_max_normalization(float value, float min, float max) {
        if (value > max) { 
            value = max;
        }
        return (value - min) / (max - min);
    }

}
