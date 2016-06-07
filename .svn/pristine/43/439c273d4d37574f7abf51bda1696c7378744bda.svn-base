/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.util.Collection;

import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 提供缓存对象操作
 * 
 * @Description: 默认加载objectCache缓存对象，可以通过调用setCache指定缓存对象
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
public class CacheUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(CacheUtil.class);
	private static Cache cache;
	static{
		cache = (Cache) ApplicationContextUtil.getBean("objectCache");		
	}
	private CacheUtil(){}
	
	public static void setCache(String cacheName){
		cache = (Cache) ApplicationContextUtil.getBean(cacheName);	
	}

	public static Element getValue(Object obj) {
		if (cache != null) {
			return cache.get(obj);
		} else {
			LOGGER.error("缓存对象为null");
			return null;
		}
	}
	
	
	

	public static void put(Element element) {
		if (cache != null) {
			cache.put(element);
		} else {
			LOGGER.error("缓存对象为null");
		}
	}

	public static void put(Collection<Element> elements) {
		if (cache != null) {
			cache.putAll(elements);
		} else {
			LOGGER.error("缓存对象为null");
		}
	}

	public static int getSize() {
		if (cache != null) {
			return cache.getSize();
		} else {
			LOGGER.error("缓存对象为null");
			return -1;
		}
	}

	public static void remove(Object key) {
		if (cache != null) {
			cache.remove(key);
		} else {
			LOGGER.error("缓存对象为null");
		}
	}

	public static void removeAll() {
		if (cache != null) {
			cache.removeAll();
		} else {
			LOGGER.error("缓存对象为null");
		}
	}

	public static boolean isElementInMemory(Object key) {
		if (cache != null) {
			return cache.isElementInMemory(key);
		} else {
			LOGGER.error("缓存对象为null");
			return false;
		}
	}

	public boolean isElementOnDisk(Object key) {
		if (cache != null) {
			return cache.isElementOnDisk(key);
		} else {
			LOGGER.error("缓存对象为null");
			return false;
		}
	}
}