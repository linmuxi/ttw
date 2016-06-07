package com.phly.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.commons.lang.StringUtils;

public class SerialNumberUtil {
	
	/**
     * 根据中文生成编号
     * @param str
     * @return
     */
    public static String getSerialNumber(String str){
    	//str = str.replaceAll("└", "").replaceAll("—", "").trim();
    	//前缀
    	//Set<String> pinyin = Pinyin4jUtil.str2Pinyin(str, Pinyin4jUtil.RET_PINYIN_TYPE_HEADCHAR);
    	//String prefix = Pinyin4jUtil.makeStringByStringSet(pinyin).toUpperCase();
    	String prefix = str;
    	//时间yyMM
    	Calendar cal = Calendar.getInstance();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyMM");
    	String yymm = sdf.format(cal.getTime());
    	//
    	return prefix + yymm;
    }
    
    /**
     * 数字转换字符串，不满digits前面补零
     * @param number 数字、编号
     * @param digits 位数
     * @return
     */
    public static String numConverStr(int number, int digits){
    	String numStr = number + "";
    	char [] numCharArr = numStr.toCharArray();
    	if(numCharArr.length < digits){
    		String prefix = "";
    		for(int i=0; i<(digits - numCharArr.length); i++){
    			prefix += "0";
    		}
    		return prefix + numStr;
    	}
    	return numStr;
    }
    
    /**
     * 编号加一
     * @param sn
     * @param digits
     * @return
     */
    public static String nextSerialNumber(String sn, String prefix, int digits){
    	String result = "";
    	String suffix = "";
    	String numStr = "";
    	if(StringUtils.isNotEmpty(sn)){
    		suffix = sn.substring(sn.length()-digits);
    		int num = Integer.valueOf(suffix) + 1;
        	numStr = numConverStr(num, digits);
    	}else{
    		numStr = numConverStr(1, digits);
    	}
    	
    	result = prefix + numStr;
    	return result;
    }
}
