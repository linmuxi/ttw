/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期帮助类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月13日 下午2:11:24
 */
public class DateUtil {

	private static final String DEFAULT_PATTERN = "yyyy-MM-dd";

	/**
	 * 格式化日期
	 * 
	 * @param pattern 格式化
	 * @param date 日期
	 * @return
	 */
	public static String pattern(String pattern, Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	/**
	 * 获取给定时间的前一天
	 * 
	 * @param date
	 * @return
	 */
	public static String getDayBefore(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_MONTH, cal.get(Calendar.DAY_OF_MONTH) - 1);
		return pattern(DEFAULT_PATTERN, cal.getTime());
	}

	public static Date getDateByStr(String strBirth) {
		SimpleDateFormat df = new SimpleDateFormat(DEFAULT_PATTERN);
		try {
			return df.parse(strBirth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        smdate=sdf.parse(sdf.format(smdate));  
        bdate=sdf.parse(sdf.format(bdate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    } 
    
//    
//    public static void main(String[] args) throws ParseException {
//    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
//        Date d1=sdf.parse("2012-09-08 10:10:10");  
//        Date d2=sdf.parse("2012-10-15 23:15:10");  
//        System.out.println(daysBetween(d1,d2)); 
//	}

}
