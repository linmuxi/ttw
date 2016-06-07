/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.home.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.ehcache.Element;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.model.DictVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;
import com.phly.common.util.CacheUtil;
import com.phly.common.util.Constant;
import com.phly.common.util.DictUtil;
import com.phly.ttw.manage.banner.facade.BannerFacade;
import com.phly.ttw.manage.banner.model.BannerVO;
import com.phly.ttw.manage.goods.facade.GoodsCategoryFacade;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;
import com.phly.ttw.portal.home.facade.HomeFacade;
import com.phly.ttw.portal.product.facade.ProductFacade;

/**
 * 前台主页
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Controller
@RemoteProxy
public class HomeAction {

	@Resource
	private GoodsCategoryFacade goodsCategoryFacade;
	@Resource
	private BannerFacade bannerFacade;
	@Resource
	private HomeFacade homeFacade;
	@Resource
	private ProductFacade productFacade;

	//业务菜单key
	private static final String menuTag = "homeMenu";
	//顶部菜单key
	private static final String topMenuList = "topMenuList";
	//底部菜单key
	private static final String footerMenuList = "footerMenuList";
	//首页搜索商品类型下拉数据
	private static final String goodsTypeSelectList = "goodsTypeSelectList";
	// 首页缓存名称
	private static final String homeCache = "homeCache";
	
	@RequestMapping({"/","/ttw","/ttw/","/page/front/home"})
	public ModelAndView queryProductInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		// header区域菜单，从字典中拿,保存到session中
		//session.setAttribute("topMenuList", DictUtil.getValue("topMenuList"));
		
		// header区域，产品类型下拉框值，查询产品一级分类取前8条
		//request.setAttribute("goodsTypeSelectList", getGoodsTypeSelectList(request).get(goodsTypeSelectList));
		
		// header区域，全局搜索关键字,从数据字典拿,保存到session中
		//request.setAttribute("globalSearchKey", DictUtil.getValue("globalSearchKey", "globalSearchKey"));
		
		
		// 主页banner,从db获取，保存到request中
		BannerVO bannerVO = new BannerVO();
		bannerVO.setPage("HOME");
		bannerVO.setPageIdx("BIG_BANNER");
		bannerVO.setSortFieldName("sort");
		bannerVO.setSortType(Constant.SORT_ASC);
		request.setAttribute("homeBannerList", queryBanner(request,bannerVO).get("bannerList"));
		
		
		// 主页商品类别推荐,从字典拿，保存到request中
		request.setAttribute("goodsTypeRecommandList", DictUtil.getValue("home_goodstype_recommand"));
		
		
		// footer区域菜单，从字典拿，保存到session中
		//session.setAttribute("footerMenuList", DictUtil.getValue("footerMenuList"));
		
		
		mv.setViewName("/page/ttw/front/index.jsp");
		return mv;
	}

	/**
	 * 获取全局搜索框默认数据
	 * @param request
	 * @param bannerVO
	 * @return
	 */
	@RequestMapping("/page/front/queryGlobalSearchKey")
	@ResponseBody
	@RemoteMethod
	public ModelMap queryGlobalSearchKey(HttpServletRequest request,BannerVO bannerVO) {
		ModelMap map = new ModelMap();
		// 广告图片,从字典拿,后期考虑做成广告表存储
		map.put("globalSearchKey", DictUtil.getValue("globalSearchKey", "globalSearchKey"));
		return map;
	}

	/**
	 * 获取banner数据
	 * @param request
	 * @param bannerVO
	 * @return
	 */
	@RequestMapping("/page/front/queryBanner")
	@ResponseBody
	@RemoteMethod
	public ModelMap queryBanner(HttpServletRequest request,BannerVO bannerVO) {
		ModelMap map = new ModelMap();
		CacheUtil.setCache(homeCache);
		String banner = "banner_"+bannerVO.getPage()+"_"+bannerVO.getPageIdx();
		if(CacheUtil.isElementInMemory(banner) && null != CacheUtil.getValue(banner)){
			map.put("bannerList", CacheUtil.getValue(banner).getObjectValue());
		}else{
			CacheUtil.put(new Element(banner, bannerFacade.queryBannerList(bannerVO).get(ServiceBase.ROWS)));
			map.put("bannerList", CacheUtil.getValue(banner).getObjectValue());
		}
		return map;
	}

	/**
	 * 获取广告数据
	 * @param request
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/queryAdvertisement")
	@ResponseBody
	@RemoteMethod
	public ModelMap queryAdvertisement(HttpServletRequest request,DictVO dictVO) {
		ModelMap map = new ModelMap();
		// 广告图片,从字典拿,后期考虑做成广告表存储
		map.put("advertisementList", DictUtil.getValue(dictVO.getType()));
		return map;
	}

	/**
	 * 获取首页商品类型模块信息(图片，子商品类型集合)
	 * @param request
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/home/queryGoodsCategoryInfo")
	@ResponseBody
	@RemoteMethod
	public ModelMap queryGoodsCategoryInfo(HttpServletRequest request,DictVO dictVO) {
		return this.homeFacade.queryGoodsCategoryInfo(dictVO);
	}
	
	/**
	 * 获取首页指定类型下热门商品列表
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/home/queryGoodsInfo")
	@ResponseBody
	@RemoteMethod
	public ModelMap queryHotGoodsInfo(DictVO dictVO){
		return this.homeFacade.queryHotGoodsInfo(dictVO);
	}

	/**
	 * 根据产品类型ID获取产品类型信息
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/home/getGoodsCategoryById")
	@ResponseBody
	@RemoteMethod
	public ModelMap getGoodsCategoryById(GoodsCategoryVO goodsCategoryVO){
		return this.homeFacade.getGoodsCategoryById(goodsCategoryVO);
	}

	/**
	 * 查询菜单
	 * 
	 * @return
	 */
	@RequestMapping("/page/portal/menu")
	@ExceptionMessage("查询菜单失败，请联系系统管理员")
	@ResponseBody
	public ModelMap queryMenu(HttpServletRequest request) {
		String parentId = request.getParameter("parentId");
		CacheUtil.setCache(homeCache);
		if(CacheUtil.isElementInMemory(menuTag+"_"+parentId) && null != CacheUtil.getValue(menuTag+"_"+parentId)){
			return (ModelMap) CacheUtil.getValue(menuTag+"_"+parentId).getObjectValue();
		}else{
			ModelMap menuMap = this.productFacade.queryMenu(parentId);
			CacheUtil.put(new Element(menuTag+"_"+parentId, menuMap));
			return menuMap;
		}
	}

	/**
	 * header区域菜单
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/home/getTopMenu")
	@ResponseBody
	@RemoteMethod
	public ModelMap getTopMenu(HttpServletRequest request){
		ModelMap map = new ModelMap();
		CacheUtil.setCache(homeCache);
		if(CacheUtil.isElementInMemory(topMenuList) && null != CacheUtil.getValue(topMenuList)){
			map.put(topMenuList, CacheUtil.getValue(topMenuList).getObjectValue());
		}else{
			CacheUtil.put(new Element(topMenuList, DictUtil.getValue(topMenuList)));
			map.put(topMenuList, CacheUtil.getValue(topMenuList).getObjectValue());
		}
		return map;
	}
	
	/**
	 * footer区域菜单
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/front/home/getFooterMenu")
	@ResponseBody
	@RemoteMethod
	public ModelMap getFooterMenu(HttpServletRequest request){
		ModelMap map = new ModelMap();
		CacheUtil.setCache(homeCache);
		if(CacheUtil.isElementInMemory(footerMenuList) && null != CacheUtil.getValue(footerMenuList)){
			map.put(footerMenuList, CacheUtil.getValue(footerMenuList).getObjectValue());
		}else{
			CacheUtil.put(new Element(footerMenuList, DictUtil.getValue(footerMenuList)));
			map.put(footerMenuList, CacheUtil.getValue(footerMenuList).getObjectValue());
		}
		return map;
	}
	
	/**
	 * 获取首页商品类型搜索下拉框数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/page/front/home/getGoodsTypeSelectList")
	@ResponseBody
	@RemoteMethod
	public ModelMap getGoodsTypeSelectList(HttpServletRequest request){
		ModelMap map = new ModelMap();
		CacheUtil.setCache(homeCache);
		if(CacheUtil.isElementInMemory(goodsTypeSelectList) && null != CacheUtil.getValue(goodsTypeSelectList)){
			map.put(goodsTypeSelectList, CacheUtil.getValue(goodsTypeSelectList).getObjectValue());
		}else{
			GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
			goodsCategoryVO.setPageNo(0);
			goodsCategoryVO.setPageSize(8);
			goodsCategoryVO.setSortFieldName("sort");
			goodsCategoryVO.setSortType(Constant.SORT_ASC);
			CacheUtil.put(new Element(goodsTypeSelectList, goodsCategoryFacade.queryGoodsCategoryList(goodsCategoryVO).get(ServiceBase.ROWS)));
			map.put(goodsTypeSelectList, CacheUtil.getValue(goodsTypeSelectList).getObjectValue());
		}
		return map;
	}
}
