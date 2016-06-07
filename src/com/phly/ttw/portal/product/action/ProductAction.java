/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.product.action;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.exceptionhandler.annotation.ExceptionMessage;
import com.phly.ttw.manage.goods.model.GoodsVO;
import com.phly.ttw.portal.product.facade.ProductFacade;

/**
 * 商品控制器类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Controller
@RemoteProxy
public class ProductAction {

	@Resource
	private ProductFacade productFacade;

	/*
	 * @RequestMapping("/page/portal/product")
	 * 
	 * @ResponseBody
	 * public ModelMap queryProductInfo(HttpServletRequest request){
	 * String productId = request.getParameter("productId");
	 * return this.productFacade.queryProductInfo(productId);
	 * }
	 */

	@RequestMapping("/page/portal/product")
	public ModelAndView queryProductInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String productId = request.getParameter("productId");

		String menuId = request.getParameter("goodsCategoryId");

		request.setAttribute("modelMap", this.productFacade.queryProductInfo(productId, menuId));
		mv.setViewName("/page/ttw/front/goods_detail.jsp");
		return mv;
	}

	@RequestMapping("/page/portal/productData")
	@ResponseBody
	public ModelMap queryProductData(HttpServletRequest request) {
		String goodsCategoryId = request.getParameter("goodsCategoryId");
		//
		String pageNumberVal = request.getParameter("pageNumber");
		int pageNumber = 1;
		if (StringUtils.isNotEmpty(pageNumberVal)) {
			pageNumber = Integer.valueOf(pageNumberVal);
		}
		//
		String pageSizeVal = request.getParameter("pageSize");
		int pageSize = 12;
		if (StringUtils.isNotEmpty(pageSizeVal)) {
			pageSize = Integer.valueOf(pageSizeVal);
		}
		//
		String search = request.getParameter("search");

		//
		String sortField = request.getParameter("sortField");
		String sortType = request.getParameter("sortType");
		//
		String attrNames = request.getParameter("attrNames");

		GoodsVO goodsVO = new GoodsVO();
		// 搜索关键字
		if (StringUtils.isNotEmpty(search)) {
			try {
				// 需要两次解码
				search = URLDecoder.decode(search, "UTF-8");
				search = URLDecoder.decode(search, "UTF-8");
				goodsVO.setGoodsName(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 属性搜索
		String[] attrArr = null;
		if (StringUtils.isNotEmpty(attrNames)) {
			try {
				attrNames = URLDecoder.decode(attrNames, "UTF-8");
				attrArr = attrNames.split(",");
				List<String[]> categoryAttrList = new ArrayList<String[]>();
				for (String attr : attrArr) {
					if (StringUtils.isNotEmpty(attr)) {
						String[] attrs = attr.split("#");
						categoryAttrList.add(attrs);
					}
				}
				goodsVO.setCategoryAttrList(categoryAttrList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsVO.setGoodsCategoryId(goodsCategoryId);
		goodsVO.setPageNo(pageNumber);
		goodsVO.setPageSize(pageSize);
		goodsVO.setSortFieldName(sortField);
		goodsVO.setSortType(sortType);
		goodsVO.setIsSpecificationsOpen("1");// 查询已经上架的产品
		return this.productFacade.queryProductData(goodsVO);
	}

	@RequestMapping("/page/portal/queryProductDataCount")
	@ResponseBody
	public ModelMap queryProductDataCount(HttpServletRequest request) {
		String goodsCategoryId = request.getParameter("goodsCategoryId");
		//
		String search = request.getParameter("search");
		//
		String sortField = request.getParameter("sortField");
		String sortType = request.getParameter("sortType");
		//
		String attrNames = request.getParameter("attrNames");

		GoodsVO goodsVO = new GoodsVO();
		// 搜索关键字
		if (StringUtils.isNotEmpty(search)) {
			try {
				// 需要两次解码
				search = URLDecoder.decode(search, "UTF-8");
				search = URLDecoder.decode(search, "UTF-8");
				goodsVO.setGoodsName(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 属性搜索
		String[] attrArr = null;
		if (StringUtils.isNotEmpty(attrNames)) {
			try {
				attrNames = URLDecoder.decode(attrNames, "UTF-8");
				attrArr = attrNames.split(",");
				List<String[]> categoryAttrList = new ArrayList<String[]>();
				for (String attr : attrArr) {
					if (StringUtils.isNotEmpty(attr)) {
						String[] attrs = attr.split("#");
						categoryAttrList.add(attrs);
					}
				}
				goodsVO.setCategoryAttrList(categoryAttrList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsVO.setGoodsCategoryId(goodsCategoryId);
		goodsVO.setSortFieldName(sortField);
		goodsVO.setSortType(sortType);
		goodsVO.setIsSpecificationsOpen("1");// 查询已经上架的产品
		return this.productFacade.queryProductDataCount(goodsVO);
	}

	@RequestMapping("/page/portal/productDataSearch")
	@ResponseBody
	public ModelMap queryProductDataBySearchKey(HttpServletRequest request) {
		String goodsCategoryId = request.getParameter("goodsCategoryId");
		//
		String pageNumberVal = request.getParameter("pageNumber");
		int pageNumber = 1;
		if (StringUtils.isNotEmpty(pageNumberVal)) {
			pageNumber = Integer.valueOf(pageNumberVal);
		}
		//
		String pageSizeVal = request.getParameter("pageSize");
		int pageSize = 12;
		if (StringUtils.isNotEmpty(pageSizeVal)) {
			pageSize = Integer.valueOf(pageSizeVal);
		}
		//
		String search = request.getParameter("search");

		//
		String sortField = request.getParameter("sortField");
		String sortType = request.getParameter("sortType");
		//
		String attrNames = request.getParameter("attrNames");

		GoodsVO goodsVO = new GoodsVO();
		// 搜索关键字
		if (StringUtils.isNotEmpty(search)) {
			try {
				// 需要两次解码
				search = URLDecoder.decode(search, "UTF-8");
				search = URLDecoder.decode(search, "UTF-8");
				goodsVO.setSearchPhrase(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 属性搜索
		String[] attrArr = null;
		if (StringUtils.isNotEmpty(attrNames)) {
			try {
				attrNames = URLDecoder.decode(attrNames, "UTF-8");
				attrArr = attrNames.split(",");
				List<String[]> categoryAttrList = new ArrayList<String[]>();
				for (String attr : attrArr) {
					if (StringUtils.isNotEmpty(attr)) {
						String[] attrs = attr.split("#");
						categoryAttrList.add(attrs);
					}
				}
				goodsVO.setCategoryAttrList(categoryAttrList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsVO.setGoodsCategoryId(goodsCategoryId);
		goodsVO.setPageNo(pageNumber);
		goodsVO.setPageSize(pageSize);
		goodsVO.setSortFieldName(sortField);
		goodsVO.setSortType(sortType);
		goodsVO.setIsSpecificationsOpen("1");// 查询已经上架的产品
		return this.productFacade.queryProductDataBySearchKey(goodsVO);
	}

	@RequestMapping("/page/portal/productSearch")
	public ModelAndView queryProductBySearch(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String goodsCategoryId = request.getParameter("goodsCategoryId");
		String search = request.getParameter("search");

		GoodsVO goodsVO = new GoodsVO();
		if (StringUtils.isNotEmpty(goodsCategoryId)) {
			goodsVO.setGoodsCategoryId(goodsCategoryId);
		}
		if (StringUtils.isNotEmpty(search)) {
			try {
				search = URLDecoder.decode(search, "UTF-8");
				goodsVO.setSearchPhrase(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsVO.setIsSpecificationsOpen("1");// 查询已经上架的产品
		goodsVO.setCreator("");
		request.setAttribute("modelMap", this.productFacade.queryProductByKey(goodsVO));
		mv.setViewName("/page/ttw/front/goods_search_index.jsp");
		return mv;
	}

	@RequestMapping("/page/portal/productCategory")
	public ModelAndView queryProductByCategoryId(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String goodsCategoryId = request.getParameter("goodsCategoryId");
		String search = request.getParameter("search");

		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setGoodsCategoryId(goodsCategoryId);
		if (StringUtils.isNotEmpty(search)) {
			try {
				search = URLDecoder.decode(search, "UTF-8");
				goodsVO.setGoodsName(search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsVO.setIsSpecificationsOpen("1");// 查询已经上架的产品
		request.setAttribute("modelMap", this.productFacade.queryProductByCategoryId(goodsVO));
		mv.setViewName("/page/ttw/front/goods_category_index.jsp");
		return mv;
	}

	/**
	 * 查询首页产品信息
	 * 
	 * @return
	 */
	@RequestMapping("/page/portal/queryIndexProduceInfo")
	@ExceptionMessage("查询首页产品信息失败，请联系管理员")
	@ResponseBody
	public ModelMap queryIndexProduceInfo() {
		return this.productFacade.queryIndexProduceInfo();
	}

	/**
	 * 查询推荐商品
	 * 
	 * @return
	 */
	@RequestMapping("/page/portal/recommended")
	@ExceptionMessage("查询推荐商品失败，请联系系统管理员")
	@ResponseBody
	public ModelMap queryRecommended(HttpServletRequest request) {
		String goodsCategoryId = request.getParameter("goodsCategoryId");
		return this.productFacade.queryRecommended(goodsCategoryId);
	}

	/**
	 * 根据产品分类id查询热门产品
	 * 
	 * @param vo
	 * @return
	 */
	@RequestMapping("/page/portal/index/queryHotGoodsByCategoryId")
	@ExceptionMessage("根据产品分类id查询热门产品失败，请联系管理员")
	@ResponseBody
	public List<GoodsVO> queryHotGoodsByCategoryId(GoodsVO vo) {
		vo.setIsSpecificationsOpen("1");// 查询已经上架的产品
		return this.productFacade.queryHotGoodsByCategoryId(vo);
	}

}
