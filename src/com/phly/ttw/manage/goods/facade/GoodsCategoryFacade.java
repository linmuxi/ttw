/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.goods.model.GoodsCategoryVO;
import com.phly.ttw.manage.goods.service.GoodsCategoryService;

/**
 * 商品类型模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class GoodsCategoryFacade {

	@Resource
	private GoodsCategoryService goodsCategoryService;
	
	/**
	 * 查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryList(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.queryGoodsCategoryList(goodsCategoryVO);
	}
	
	/**
	 * 查询商品分类列表排序、分页
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryListByCategorySortPage(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.queryGoodsCategoryListByCategorySortPage(goodsCategoryVO);
	}
	
	/**
	 * 根据id获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.getGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getParentGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.getParentGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getChildGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.getChildGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 根据分类父ID查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryListByParentId(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.queryGoodsCategoryListByParentId(goodsCategoryVO);
	}
	
	/**
	 * 添加商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap addGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryService.addGoodsCategory(goodsCategoryVO);
	}
	
	
	/**
	 * 修改商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap updateGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		return this.goodsCategoryService.updateGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 删除商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap delGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		return this.goodsCategoryService.delGoodsCategory(goodsCategoryVO);
	}
}
