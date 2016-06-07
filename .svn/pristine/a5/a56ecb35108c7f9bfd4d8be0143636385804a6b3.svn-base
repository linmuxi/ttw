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
import org.springframework.web.servlet.ModelAndView;

import com.phly.ttw.manage.goods.facade.GoodsAttributeFacade;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;

/***
 * 商品属性控制器类
 * @author Administrator
 *
 */
@Controller
@RemoteProxy
public class GoodsAttributeAction {

	@Resource
	private GoodsAttributeFacade goodsAttributeFacade;
	
	
	@RequestMapping("/page/business/goodsAttribute")
	@ResponseBody
	public ModelMap queryGoodsCategoryList(HttpServletRequest request,GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeFacade.queryGoodsCategoryList(goodsAttributeVO);
	}
	
	/**
	 * 初始化商品属性修改页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/page/business/initGoodsAttribute")
	public ModelAndView initGoodsAttributeCategory(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/page/ttw/manage/goods/goodsAttributeCategoryList.jsp");
		
		String goodsAttributeId = request.getParameter("goodsAttributeId");
		
		String goodsTypeId = request.getParameter("goodsTypeId");
		
		GoodsAttributeVO goodsAttributeVO = new GoodsAttributeVO();
		goodsAttributeVO.setId(goodsAttributeId);
		goodsAttributeVO.setGoodsTypeId(goodsTypeId);
		
		request.setAttribute("modelMap", this.goodsAttributeFacade.initGoodsAttributeCategory(goodsAttributeVO));
		return mv;
	}
	
	
	
	
	
	/**
	 * 保存商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap saveGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeFacade.saveGoodsAttribute(goodsAttributeVO);
	}
	
	
	/**
	 * 删除商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		return this.goodsAttributeFacade.delGoodsAttribute(goodsAttributeVO);
	}
}
