/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.banner.action;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.ttw.manage.banner.facade.BannerFacade;
import com.phly.ttw.manage.banner.model.BannerVO;

/**
 * banner控制层
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Controller
@RemoteProxy
public class BannerAction{

	@Resource
	private BannerFacade bannerFacade;

	/**
	 * 查询banner列表
	 * @param bannerVO
	 * @return
	 */
	@RequestMapping("/page/business/banner/queryBannerList")
	@ResponseBody
	public ModelMap queryBannerList(BannerVO bannerVO) {
		return this.bannerFacade.queryBannerList(bannerVO);
	}
	
	/**
	 * 添加banner
	 * @param bannerVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addBanner(BannerVO bannerVO) {
		return this.bannerFacade.addBanner(bannerVO);
	}
	
	/**
	 * 删除banner
	 * @param bannerVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap deleteBanner(BannerVO bannerVO) {
		return this.bannerFacade.deleteBanner(bannerVO);
	}


	/**
	 * 修改banner
	 * @param bannerVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateBanner(BannerVO bannerVO) {
		return this.bannerFacade.updateBanner(bannerVO);
	}
	
	
	/**
	 * 获取banner
	 * @param bannerVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getBanner(BannerVO bannerVO) {
		return this.bannerFacade.getBanner(bannerVO);
	}
}
