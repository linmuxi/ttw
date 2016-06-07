/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;

/***
 * 对象和Map互转工具类
 * @author th
 *
 */
public class ObjectConvertToMap {
	
	/**
	 * 将javaBean转换成Map
	 * 
	 * @param javaBean
	 *            javaBean
	 * @return Map对象
	 */
	public static HashMap<String, Object> toMap(Object javaBean) {
		if(null == javaBean){
			return null;
		}
		HashMap<String, Object> result = new HashMap<String, Object>();
		Method[] methods = javaBean.getClass().getDeclaredMethods();

		for (Method method : methods) {
			try {
				if (method.getName().startsWith("get")) {
					String field = method.getName();
					field = field.substring(field.indexOf("get") + 3);
					field = field.toLowerCase().charAt(0) + field.substring(1);

					Object value = method.invoke(javaBean, (Object[]) null);
					result.put(field, null == value ? "" : value);
				}
			} catch (Exception e) {
				System.out.println(method.getName());
				System.out.println(e.toString());
			}
		}
		return result;
	}

	/**
	 * 将map转换成  javabean
	 * @param javabean
	 * @param data map数据
	 * @return Object
	 */
	public static Object toJavaBean(Object javabean, HashMap<String, Object> data) {
		if(null == data || data.isEmpty()){
			return null;
		}
		Method[] methods = javabean.getClass().getDeclaredMethods();
		for (Method method : methods) {
			try {
				if (method.getName().startsWith("set")) {
					String field = method.getName();
					field = field.substring(field.indexOf("set") + 3);
					field = field.toLowerCase().charAt(0) + field.substring(1);
					method.invoke(javabean, new Object[] { data.get(field) });
				}
			} catch (Exception e) {
			}
		}
		return javabean;
	}
	
	public static void main(String[] args) {
		UserTT tt =new UserTT();
		tt.setId(11);
		tt.setName("张三");
		tt.setBir(new Date());
		System.out.println(toMap(tt));
		
	}
}

class UserTT {
	private Integer id;
	private String name;
	private Date bir;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBir() {
		return bir;
	}
	public void setBir(Date bir) {
		this.bir = bir;
	}
}
