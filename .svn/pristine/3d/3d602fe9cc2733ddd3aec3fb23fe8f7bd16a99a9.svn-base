/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.DictVO;
import com.phly.common.base.service.DictService;

/**
 *
 *数据字典代理类
 * @Description: TODO
 * @author wanglong
 * @since 2015年10月18日 下午8:38:21
 */

@Component
public class DictFacade {

	@Resource
	private DictService dictService;
	
	public List<Map<String,Object>> queryDictList(){
		return this.dictService.queryDictList();
	}
	
	public ModelMap queryAllDictList(DictVO dictVO){
		return this.dictService.queryAllDictList(dictVO);
	}
	
	public ModelMap saveDict(DictVO dictVO){
		return this.dictService.saveDict(dictVO);
	}
	
	
	public ModelMap delDict(DictVO dictVO){
		return this.dictService.delDict(dictVO);
	}
	
	public ModelMap getOneDict(String id){
		return this.dictService.getOneDict(id);
	}
}
