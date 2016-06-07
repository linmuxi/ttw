/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.DictDao;
import com.phly.common.base.model.DictVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.Constant;
import com.phly.common.util.DictUtil;
import com.phly.common.util.RequestContextUtil;

/**
 *
 * @Description: TODO
 * @author Administrator
 * @since 2015年10月18日 下午8:39:03
 */
@Service
public class DictService extends ServiceBase{

	@Resource
	private DictDao dictDao;
	
	public ModelMap queryAllDictList(DictVO dictVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.dictDao.getDictCount(dictVO);
		if(count > 0){
			model.put(ROWS, this.dictDao.queryDictList(dictVO));
			model.put(TOTAL, count);
			model.put(CURRENT, dictVO.getPageNo());
			model.put(ROWCOUNT, dictVO.getPageSize());
		}
		return model;
	}
	
	public List<Map<String,Object>> queryDictList(){
		return this.dictDao.queryAllDictList(null);
	}
	
	
	public ModelMap saveDict(DictVO dictVO){
		ModelMap map = new ModelMap();
		if (null == dictVO) {
			map.put("result", false);
			map.put("remark", "对象为null");
			return map;
		}

		if (StringUtils.isNotEmpty(dictVO.getId())) {
			// 修改
			return this.updateDict(dictVO);
		} else {
			return this.addDict(dictVO);
		}
	}
	
	public ModelMap updateDict(DictVO dictVO){
		ModelMap model = new ModelMap();
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		DictUtil.updateDictCache(Constant.OPERATE_UPDATE,dictVO.getType(),dictVO.getDefaultKey(),dictVO.getDefaultValue());
		model.put("result", this.dictDao.updateDict(dictVO));
		return model;
	}
	
	
	public ModelMap addDict(DictVO dictVO){
		ModelMap model = new ModelMap();
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		dictVO.setCreateDate(new Timestamp(new Date().getTime()));
		dictVO.setCreator(userVO.getUsername());
		model.put("result", this.dictDao.addDict(dictVO));
		DictUtil.updateDictCache(Constant.OPERATE_ADD,dictVO.getType(),dictVO.getDefaultKey(),dictVO.getDefaultValue());
		return model;
	}
	
	
	public ModelMap delDict(DictVO dictVO){
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = dictVO.getId();
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					dictVO = new DictVO();
					dictVO.setId(id);
					flag = this.dictDao.delDict(dictVO);
					
					Map<String,Object> oneDict = this.dictDao.getOneDict(id);
					DictUtil.updateDictCache(Constant.OPERATE_DEL,String.valueOf(oneDict.get("type")),String.valueOf(oneDict.get("defaultKey")),String.valueOf(oneDict.get("defaultValue")));
				}
			}
		}
		model.put("result", flag);
		return model;
	}
	
	
	public ModelMap getOneDict(String id){
		ModelMap model = new ModelMap();
		model.put("result", this.dictDao.getOneDict(id));
		return model;
	}
	

	
}
