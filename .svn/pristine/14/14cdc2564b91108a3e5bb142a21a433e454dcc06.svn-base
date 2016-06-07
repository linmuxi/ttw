/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.demo.facade;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.phly.ttw.manage.demo.service.DemoService;

/**
 * 测试代理类
 * 
 * @Description: 业务方法集成
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
@Component
public class DemoFacade {

	@Resource
	private DemoService demoService;

	public void insert(Map<String,Object> map){
		this.demoService.insert(map);
	}
	
	public List<HashMap<String,Object>> query(Map<String,Object> map){
		return this.demoService.query(map);
	}
}
