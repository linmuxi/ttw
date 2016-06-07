/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.model.GoodsVO;
import com.phly.ttw.manage.goods.service.GoodsAttributeService;
import com.phly.ttw.manage.goods.service.GoodsService;

/**
 * 商品模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class GoodsFacade {

	@Resource
	private GoodsService goodsService;
	
	//@Resource
	//private GoodsFromShelvesService goodsFromShelvesService;
	
	@Resource
	private GoodsAttributeService goodsAttributeService;
	
	/**
	 * 查询商品列表
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryGoodsList(GoodsVO goodsVO){
		return this.goodsService.queryGoodsList(goodsVO);
	}
	
	/**
	 * 查询商品列表
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryList(){
		return this.goodsService.queryGoodsCategoryList();
	}
	
	
	/**
	 * 根据产品类型查询产品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap queryGoodsAttributeListByGoodsTypeId(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.queryGoodsAttributeListByGoodsTypeId(goodsAttributeVO);
	}
	
	/**
	 * 查询品牌列表
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryBrandList(){
		return this.goodsService.queryBrandList();
	}
	
	/**
	 * 根据id获取商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap getGoods(GoodsVO goodsVO){
		return this.goodsService.getGoods(goodsVO);
	}
	
	
	/**
	 * 添加商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap addGoods(GoodsVO goodsVO){
		return this.goodsService.addGoods(goodsVO);
	}
	
	/**
	 * 上架商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap shelvesGoods(GoodsVO goodsVO) {
		return this.goodsService.shelvesGoods(goodsVO);
	}
	
	/**
	 * 下架商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap fromShelvesGoods(GoodsVO goodsVO) {
		return this.goodsService.fromShelvesGoods(goodsVO);
	}
	
	/**
	 * 发起产品审核流程
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap startGoodsWorkflow(GoodsVO goodsVO){
		return this.goodsService.startGoodsWorkflow(goodsVO);
	}
	
	/**
	 * 修改商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap updateGoods(GoodsVO goodsVO) {
		return this.goodsService.updateGoods(goodsVO);
	}
	
	/**
	 * 修改商品价格
	 * @param goodsVO
	 * @return
	 */
	public ModelMap updateGoodsPrice(GoodsVO goodsVO) {
		return this.goodsService.updateGoodsPrice(goodsVO);
	}
	
	/**
	 * 删除商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap delGoods(GoodsVO goodsVO) {
		return this.goodsService.delGoods(goodsVO);
	}
}
