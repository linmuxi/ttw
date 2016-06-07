/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.demo.vo.DemoVO;

/**
 * 测试数据访问层类
 * 
 * @Description
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
@Repository
public class DemoDao extends MyBatisDao {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DemoDao.class);

	/**
	 * 新增
	 * @param map
	 */
	public void insert(Map<String,Object> map){
		try {
			this.insert("demo.insertDemo", map);
		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("xx新增失败,"+e);
		}
	}
	
	/**
	 * 查询
	 * @param map
	 * @return
	 */
	public List<HashMap<String,Object>> query(Map<String,Object> map){
		return this.queryList("demo.selectDemo", map);
	}
	
	/**
	 * 分页查询
	 * @param pDemoVO
	 * @return
	 */
	public List<DemoVO> queryList(DemoVO pDemoVO){
		return this.queryList("demo.queryList", pDemoVO,pDemoVO.getPageNo(),pDemoVO.getPageSize());
	}
}
