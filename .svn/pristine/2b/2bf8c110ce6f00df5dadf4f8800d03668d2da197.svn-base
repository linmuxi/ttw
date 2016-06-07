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

import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.facade.GoodsFacade;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.model.GoodsVO;

/**
 * 商品控制器类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Controller
@RemoteProxy
public class GoodsAction {

	@Resource
	private GoodsFacade goodsFacade;
	
	@RequestMapping("/page/business/goods")
	@ResponseBody
	public ModelMap queryGoodsList(HttpServletRequest request,GoodsVO goodsVO){
		//判断当前用户是否“商品部-商管经理,商品部-商品审核经理”角色。是，则查询所有产品
		if(RequestContextUtil.existsRole("商品部-商品经理")){
			goodsVO.setCreator(""); //设置值为空，查询所有的产品
			goodsVO.setApprovalState(1); //查询审核通过的产品
		}else if(RequestContextUtil.existsRole("商品部-商品审核经理")){
			goodsVO.setCreator(""); //设置值为空，查询所有的产品
		}else if(RequestContextUtil.existsRole("招商部-招商总经理,招商部-招商总经理")){
			goodsVO.setCreator(""); //设置值为空，查询所有的产品
		}
		return this.goodsFacade.queryGoodsList(goodsVO);
	}
	
	/**
	 * 查询商品类型
	 * @param request
	 * @return
	 */
	@RemoteMethod
	public ModelMap initGoodsCategory(HttpServletRequest request){
		return this.goodsFacade.queryGoodsCategoryList();
	}
	
	/**
	 * 查询品牌
	 * @param request
	 * @return
	 */
	@RemoteMethod
	public ModelMap initBrand(HttpServletRequest request){
		return this.goodsFacade.queryBrandList();
	}
	
	
	/**
	 * 根据产品类型查询产品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap queryGoodsAttributeListByGoodsTypeId(GoodsAttributeVO goodsAttributeVO){
		return this.goodsFacade.queryGoodsAttributeListByGoodsTypeId(goodsAttributeVO);
	}
	
	
	/**
	 * 根据id获取商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getGoods(GoodsVO goodsVO){
		return this.goodsFacade.getGoods(goodsVO);
	}
	
	
	/**
	 * 添加商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addGoods(GoodsVO goodsVO){
		return this.goodsFacade.addGoods(goodsVO);
	}

	
	/**
	 * 上架商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap shelvesGoods(GoodsVO goodsVO) {
		return this.goodsFacade.shelvesGoods(goodsVO);
	}
	
	/**
	 * 下架商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap fromShelvesGoods(GoodsVO goodsVO) {
		return this.goodsFacade.fromShelvesGoods(goodsVO);
	}
	
	/**
	 * 发起产品审核流程
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap startGoodsWorkflow(GoodsVO goodsVO){
		return this.goodsFacade.startGoodsWorkflow(goodsVO);
	}
	
	/**
	 * 修改商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateGoods(GoodsVO goodsVO) {
		return this.goodsFacade.updateGoods(goodsVO);
	}
	
	/**
	 * 修改商品价格
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateGoodsPrice(GoodsVO goodsVO) {
		return this.goodsFacade.updateGoodsPrice(goodsVO);
	}
	
	/**
	 * 删除商品
	 * @param goodsVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delGoods(GoodsVO goodsVO) {
		return this.goodsFacade.delGoods(goodsVO);
	}
}
