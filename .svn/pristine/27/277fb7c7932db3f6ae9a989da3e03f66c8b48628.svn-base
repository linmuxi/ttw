/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.service.GoodsAttributeService;

/**
 * 商品属性模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class GoodsAttributeFacade {

	@Resource
	private GoodsAttributeService goodsAttributeService;
	
	/**
	 * 查询商品属性列表
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryList(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.queryGoodsAttributeList(goodsAttributeVO);
	}
	
	/**
	 * 查询商品属性列表
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap initGoodsAttributeCategory(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.initGoodsAttributeCategory(goodsAttributeVO);
	}
	
	/**
	 * 查询商品属性
	 * @param goodsAttributeVO
	 * @return
	 
	public ModelMap getGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.getGoodsAttribute(goodsAttributeVO);
	}
	*/
	
	
	
	/**
	 * 保存商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap saveGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.saveGoodsAttribute(goodsAttributeVO);
	}
	
	/**
	 * 删除商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap delGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeService.delGoodsAttribute(goodsAttributeVO);
	}
	
	
}
