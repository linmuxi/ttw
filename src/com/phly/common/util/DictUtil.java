/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import com.phly.common.base.facade.DictFacade;

/**
 *数据字典帮助类
 * @Description: TODO
 * @author Administrator
 * @since 2015年10月19日 下午11:44:55
 */
public class DictUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(DictUtil.class);
	private static Cache cache;
	static{
		cache = (Cache) ApplicationContextUtil.getBean("dictCache");		
	}
	
	private DictUtil(){}
	
	private static DictFacade dictFacade;
	
	public static DictFacade getDictFacade() {
		return dictFacade;
	}


	public static void setDictFacade(DictFacade dictFacade) {
		DictUtil.dictFacade = dictFacade;
	}
	
	
	public static boolean isElementInMemory(Object key) {
		if (cache != null) {
			return cache.isElementInMemory(key);
		} else {
			logger.error(DictUtil.class +  "   isElementInMemory  缓存对象为null ");
			return false;
		}
	}
	
	public static void remove(Object key) {
		if (cache != null) {
			cache.remove(key);
		} else {
			logger.error(DictUtil.class +  "   remove  缓存对象为null ");
		}
	}

	public static void removeAll() {
		if (cache != null) {
			cache.removeAll();
		} else {
			logger.error(DictUtil.class +  "   removeAll  缓存对象为null ");
		}
	}
	
	
	public static Element getValue(Object obj) {
		if (cache != null) {
			return cache.get(obj);
		} else {
			logger.error(DictUtil.class +  "   getValue  缓存对象为null ");
			return null;
		}
	}
	

	public static void put(Element element) {
		if (cache != null) {
			cache.put(element);
		} else {
			logger.error(DictUtil.class +  "   put  缓存对象为null ");
		}
	}

	public static void put(Collection<Element> elements) {
		if (cache != null) {
			cache.putAll(elements);
		} else {
			logger.error(DictUtil.class +  "   put  缓存对象为null ");
		}
	}

	public static int getSize() {
		if (cache != null) {
			return cache.getSize();
		} else {
			logger.error(DictUtil.class +  "   getSize  缓存对象为null ");
			return -1;
		}
	}


	/**
	 * 字典类型名称 eg:GONGYINGSHANG
	 * @param defaultType
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String,Object>> getValue(String defaultType){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		if(isElementInMemory(AppKeys.TTW_CACHEKEY)){
			 List<Map<String, Object>> dictLst = (List<Map<String, Object>>) cache.get(AppKeys.TTW_CACHEKEY).getObjectValue();
			 int count = null != dictLst && dictLst.size() > 0 ? dictLst.size() : 0;
			 for (int i = 0; i < count; i++) {
				 Map<String,Object> dictMap = dictLst.get(i);
				 if(defaultType.equals(dictMap.get("type"))){
					 result.add(dictMap);
				 }
			}
		}
		return result;
	}
	
	
	/**
	 * 
	 * @param defaultType  字典类型名称
	 * @param defaultKey   默认key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Object getValue(String defaultType,String defaultKey){
		Object result = null;
		if(isElementInMemory(AppKeys.TTW_CACHEKEY)){
			Element acheElement = cache.get(AppKeys.TTW_CACHEKEY);
			if(null != acheElement){
				List<Map<String,Object>> defaultCacheLst = (List<Map<String, Object>>) acheElement.getObjectValue();
				int count = null != defaultCacheLst && defaultCacheLst.size() > 0 ? defaultCacheLst.size() : 0;
				if(count > 0){
					for(int i = 0; i < count; i++){
						Map<String,Object> dictMap = defaultCacheLst.get(i);
						 if(defaultType.equals(dictMap.get("type"))){
							if(defaultKey.equals(dictMap.get("defaultKey"))){
								result = dictMap.get("defaultValue");
							}
						 }
					}
				}
			}
			
			
		}	
		return result;
	}	
	
	
	/**
	 * 所有数据字典缓存
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static List<Map<String, Object>> getAllDictCache(){
		List<Map<String, Object>> result = null;
		if(isElementInMemory(AppKeys.TTW_CACHEKEY)){
			Element acheElement = cache.get(AppKeys.TTW_CACHEKEY);
			if(null != acheElement){
				result = (List<Map<String, Object>>) acheElement.getObjectValue();
				
			}
		}	
		return result;
	
	}
	
	
	
	/**
	 * 更新数据字典值
	 * @param newDefaultType
	 * @param newDefaultKey
	 * @param newDefaultValue
	 */
	public static void updateDictCache(String operateType,String newDefaultType,String newDefaultKey,String newDefaultValue){
		List<Map<String, Object>> allDict = getAllDictCache();
		int count = null != allDict && allDict.size() > 0 ? allDict.size() : 0;
		if(count > 0){
			if(Constant.OPERATE_ADD.equals(operateType)){//添加
				Map<String, Object> addMap = new HashMap<String, Object>();
				addMap.put("type", newDefaultType);
				addMap.put("defaultKey", newDefaultKey);
				addMap.put("defaultValue", newDefaultValue);
				allDict.add(addMap);
			}else{//修改或者删除
				for(int i = 0; i < count; i++){
					Map<String,Object> dictMap = allDict.get(i);
					 if(newDefaultType.equals(dictMap.get("type"))){
						if(newDefaultKey.equals(dictMap.get("defaultKey"))){
							allDict.remove(dictMap);
							if(Constant.OPERATE_UPDATE.equals(operateType)){
								dictMap.put("defaultValue", newDefaultValue);
								allDict.add(dictMap);
							}
						}
					 }
				}
			}
			
		}
	}
}
