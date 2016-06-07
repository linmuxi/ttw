/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.ttw.manage.goods.facade.GoodsCategoryFacade;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;

/***
 * 商品类型控制器类
 * @author Administrator
 *
 */
@Controller
@RemoteProxy
public class GoodsCategoryAction {

	@Resource
	private GoodsCategoryFacade goodsCategoryFacade;
	
	@RequestMapping("/page/business/goodsCategory")
	@ResponseBody
	public ModelMap queryGoodsCategoryList(HttpServletRequest request,GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.queryGoodsCategoryList(goodsCategoryVO);
	}
	
	
	@RequestMapping("/page/business/goodsSortCategory")
	@ResponseBody
	public ModelMap queryGoodsCategorySortList(HttpServletRequest request,GoodsCategoryVO goodsCategoryVO){
		goodsCategoryVO.setSortFieldName(" ID ASC, ");
		goodsCategoryVO.setSortType(" SORT ASC ");
		return this.goodsCategoryFacade.queryGoodsCategoryListByCategorySortPage(goodsCategoryVO);
	}
	
	
	
	/**
	 * 根据id获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.getGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getParentGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.getParentGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 获取商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getChildGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.getChildGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 添加商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap loadGoodsCategoryListByParentId(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.queryGoodsCategoryListByParentId(goodsCategoryVO);
	}
	
	/**
	 * 添加商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		return this.goodsCategoryFacade.addGoodsCategory(goodsCategoryVO);
	}

	
	/**
	 * 修改商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		return this.goodsCategoryFacade.updateGoodsCategory(goodsCategoryVO);
	}
	
	/**
	 * 删除商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		return this.goodsCategoryFacade.delGoodsCategory(goodsCategoryVO);
	}
}
