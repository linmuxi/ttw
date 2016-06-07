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
import com.phly.ttw.manage.goods.model.CategoryRpVO;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;

/**
 * 商品分类模块dao类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午4:51:46
 */
@Repository
public class GoodsCategoryDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public List<GoodsCategoryVO> queryGoodsCategoryList(GoodsCategoryVO goodsCategoryVO){
		return this.queryList("goodsCategory.queryGoodsCategoryList", goodsCategoryVO,goodsCategoryVO.getPageNo(),goodsCategoryVO.getPageSize());
	}
	
	/**
	 * 查询商品分类列表排序
	 * @param goodsCategoryVO
	 * @return
	 */
	public List<GoodsCategoryVO> queryGoodsCategoryListByCategorySort(GoodsCategoryVO goodsCategoryVO){
		return this.queryList("goodsCategory.queryGoodsCategoryListByCategorySort", goodsCategoryVO);
	}
	
	/**
	 * 查询商品分类列表排序、分页
	 * @param goodsCategoryVO
	 * @return
	 */
	public List<GoodsCategoryVO> queryGoodsCategoryListByCategorySortPage(GoodsCategoryVO goodsCategoryVO){
		return this.queryList("goodsCategory.queryGoodsCategoryListByCategorySort", goodsCategoryVO,goodsCategoryVO.getPageNo(),goodsCategoryVO.getPageSize());
	}
	
	/**
	 * 根据分类父ID查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public List<GoodsCategoryVO> queryGoodsCategoryListByParentId(GoodsCategoryVO goodsCategoryVO){
		return this.queryList("goodsCategory.queryGoodsCategoryListByParentId", goodsCategoryVO);
	}
	
	
	/**
	 * 查询商品分类总数
	 * @param goodsCategoryVO
	 * @return
	 */
	public int getGoodsCategoryCount (GoodsCategoryVO goodsCategoryVO){
		return (Integer) this.getObject("goodsCategory.getGoodsCategoryCount", goodsCategoryVO);
	}
	
	
	/**
	 * 根据ID或者名称查询商品分类信息
	 * @param goodsCategoryVO
	 * @return
	 */
	public GoodsCategoryVO getGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return (GoodsCategoryVO) this.getObject("goodsCategory.getGoodsCategory", goodsCategoryVO);
	}
	
	
	/**
	 * 添加商品分类信息
	 * @param goodsCategoryVO
	 * @return
	 */
	public boolean addGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		boolean flag = false;
		try {
			this.insert("goodsCategory.addGoodsCategory",goodsCategoryVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加商品分类失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改商品分类
	 * @param resourceVO
	 * @return
	 */
	public boolean updateGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		boolean flag = false;
		try {
			this.update("goodsCategory.updateGoodsCategory",goodsCategoryVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品分类失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public boolean delGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		boolean flag = false;
		try {
			this.delete("goodsCategory.delGoodsCategory",goodsCategoryVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除商品分类失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 查询热门分类或首页滚动分类
	 * @return
	 */
	public List<GoodsCategoryVO> queryHotGoodsCategoryList(GoodsCategoryVO categoryVO){
		return this.queryList("goodsCategory.queryHotGoodsCategoryList", categoryVO);
	}
	
	
	/**
	 * 添加更多父分类
	 * @param categoryRpVO
	 * @return
	 */
	public boolean addCategoryRp(CategoryRpVO categoryRpVO){
		boolean flag = false;
		try {
			this.insert("goodsCategory.addCategoryRp",categoryRpVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加更多父分类失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除更多父分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public boolean delCategoryRp(CategoryRpVO categoryRpVO) {
		boolean flag = false;
		try {
			this.delete("goodsCategory.delCategoryRp",categoryRpVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除更多父分类,"+e);
		}
		return flag;
	}
	
	/**
	 * 根据分类id查询更多父分类
	 * @param categoryRpVO
	 * @return
	 */
	public List<CategoryRpVO> queryCategoryRpListByCategoryId(CategoryRpVO categoryRpVO){
		return this.queryList("goodsCategory.queryCategoryRp", categoryRpVO);
	}
}
