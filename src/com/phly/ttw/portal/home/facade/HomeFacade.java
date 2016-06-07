/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.home.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.DictVO;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;
import com.phly.ttw.portal.home.service.HomeService;

/**
 * 前台主页
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Component
public class HomeFacade {

	@Resource
	private HomeService homeService;

	/**
	 * 获取首页商品类型模块信息(图片，子商品类型集合)
	 * @param dictVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryInfo(DictVO dictVO){
		return this.homeService.queryGoodsCategoryInfo(dictVO);
	}

	/**
	 * 获取首页指定种类下热门商品列表
	 * @param dictVO
	 * @return
	 */
	public ModelMap queryHotGoodsInfo(DictVO dictVO){
		return this.homeService.queryHotGoodsInfo(dictVO);
	}
	
	/**
	 * 根据产品类型ID获取产品类型信息
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getGoodsCategoryById(GoodsCategoryVO goodsCategoryVO){
		return this.homeService.getGoodsCategoryById(goodsCategoryVO);
	}
}
