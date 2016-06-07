/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.product.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.goods.model.GoodsVO;
import com.phly.ttw.portal.product.service.ProductService;

/**
 * 产品模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class ProductFacade {

	@Resource
	private ProductService productService;
	
	/**
	 * 查询产品信息
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductInfo(String productId, String menuId){
		return this.productService.queryProductInfo(productId, menuId);
	}
	
	/**
	 * 首页根据关键字查找
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryProductByKey(GoodsVO goodsVO){
		return this.productService.queryProductByKey(goodsVO);
	}
	
	/**
	 * 查询产品信息根据分类id
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductByCategoryId(GoodsVO goodsVO){
		return this.productService.queryProductByCategoryId(goodsVO);
	}
	
	/**
	 * 查询产品信息根据分类id
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductDataBySearchKey(GoodsVO goodsVO){
		return this.productService.queryProductDataBySearchKey(goodsVO);
	}
	
	/**
	 * 查询产品信息根据分类id
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductData(GoodsVO goodsVO){
		return this.productService.queryProductData(goodsVO);
	}

	
	/**
	 * 查询商品列表商品数量根据分类id
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductDataCount(GoodsVO goodsVO){
		return this.productService.queryProductDataCount(goodsVO);
	}
	
	
	/**
	 * 查询首页产品信息
	 * @return
	 */
	public ModelMap queryIndexProduceInfo(){
		return this.productService.queryIndexProduceInfo();
	}
	
	
	/**
	 * 查询菜单
	 * @return
	 */
	public ModelMap queryMenu(String parentId){
		return this.productService.queryMenu(parentId);
	}
	
	/**
	 * 查询推荐商品
	 * @return
	 */
	public ModelMap queryRecommended(String goodsCategoryId){
		return this.productService.queryRecommended(goodsCategoryId);
	}
	
	/**
	 * 根据产品分类id查询热门产品
	 * @param vo
	 * @return
	 */
	public List<GoodsVO> queryHotGoodsByCategoryId(GoodsVO vo){
		return this.productService.queryHotGoodsByCategoryId(vo);
	}
}
