/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.ehcache.Element;

import org.springframework.stereotype.Service;

import com.phly.common.util.CacheUtil;
import com.phly.ttw.manage.demo.dao.DemoDao;

/**
 * 测试服务层类
 * 
 * @Description: 处理业务数据
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
@Service
public class DemoService {

	@Resource
	private DemoDao demoDao;
	
	public void insert(Map<String,Object> map){
		this.demoDao.insert(map);
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String,Object>> query(Map<String,Object> map){
		//查看缓存中是否存在,PS:根据查询条件来生成key
		if(CacheUtil.isElementInMemory("test")){
			//直接从缓存中获取返回
			return (List<HashMap<String, Object>>) CacheUtil.getValue("test").getObjectValue();
		}else{
			//查询数据库
			List<HashMap<String,Object>> list = this.demoDao.query(map);
			Element element = new Element("test",list);
			CacheUtil.put(element);
			return list;
		}
	}
}
