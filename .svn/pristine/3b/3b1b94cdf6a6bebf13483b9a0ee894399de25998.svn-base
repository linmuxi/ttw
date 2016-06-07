/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.DictVO;

/**
 *
 * @Description: TODO
 * @author Administrator
 * @since 2015年10月18日 下午8:39:39
 */
@Repository
public class DictDao  extends MyBatisDao{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	

	public List<Map<String,Object>> queryAllDictList(DictVO dictVO){
		return this.queryListMap("dict.queryAllDictList", dictVO);
	}
	
	public List<DictVO> queryDictList(DictVO dictVO){
		return this.queryList("dict.queryDictList", dictVO,dictVO.getPageNo(),dictVO.getPageSize());
	}
	
	public int getDictCount(DictVO dictVO){
		return (Integer) this.getObject("dict.getDictCount", dictVO);
	}
	
	
	public boolean updateDict(DictVO dictVO){
		boolean flag = false;
		try {
			this.update("dict.updateDict",dictVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "updateDict  修改数据字典失败,"+e);
		}
		return flag;
	
	}
	   
	
	public boolean addDict(DictVO dictVO){
		boolean flag = false;
		try {
			this.insert("dict.addDict",dictVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "addDict  添加数据字典失败,"+e);
		}
		return flag;
	}
	
	
	public boolean delDict(DictVO dictVO){
		boolean flag = false;
		try {
			this.delete("dict.delDict",dictVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "delDict  删除数据字典失败,"+e);
		}
		return flag;
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> getOneDict(String id){
		return  (Map<String, Object>) this.getObject("dict.getOneDict", id);
	}
}
