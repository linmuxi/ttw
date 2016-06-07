/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.goods.model.BrandVO;

/**
 * 品牌dao类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月13日 下午4:51:46
 */
@Repository
public class BrandDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询品牌信息
	 * @param BrandVO
	 * @return
	 */
	public List<BrandVO> queryBrandList(BrandVO brandVO){
		return this.queryList("brand.queryBrandList", brandVO,brandVO.getPageNo(),brandVO.getPageSize());
	}
	
	/**
	 * 查询品牌信息
	 * @param BrandVO
	 * @return
	 */
	public List<BrandVO> queryBrandListNoPage(BrandVO brandVO){
		return this.queryList("brand.queryBrandList", brandVO);
	}
	
	
	/**
	 * 查询品牌总数
	 * @param brandVO
	 * @return
	 */
	public int getBrandCount (BrandVO brandVO){
		return (Integer) this.getObject("brand.getBrandCount", brandVO);
	}
	
	
	/**
	 * 根据ID或者名称查询品牌信息
	 * @param BrandVO
	 * @return
	 */
	public BrandVO getBrand(BrandVO brandVO){
		return (BrandVO) this.getObject("brand.getBrand", brandVO);
	}
	
	
	/**
	 * 添加品牌信息
	 * @param brandVO
	 * @return
	 */
	public boolean addBrand(BrandVO brandVO){
		boolean flag = false;
		try {
			this.insert("brand.addBrand",brandVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加品牌信息失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改品牌信息
	 * @param brandVO
	 * @return
	 */
	public boolean updateBrand(BrandVO brandVO) {
		boolean flag = false;
		try {
			this.update("brand.updateBrand", brandVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改品牌信息失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除品牌
	 * @param brandVO
	 * @return
	 */
	public boolean delBrand(BrandVO BrandVO) {
		boolean flag = false;
		try {
			this.delete("brand.delBrand",BrandVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除品牌失败,"+e);
		}
		return flag;
	}
}
