/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.banner.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.banner.model.BannerVO;
import com.phly.ttw.manage.banner.service.BannerService;

/**
 * banner代理层
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Component
public class BannerFacade{

	@Resource
	private BannerService bannerService;
	
	/**
	 * 查询banner列表
	 * @param bannerVO
	 * @return
	 */
	public ModelMap queryBannerList(BannerVO bannerVO) {
		return this.bannerService.queryBannerList(bannerVO);
	}

	/**
	 * 获取banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap getBanner(BannerVO bannerVO) {
		return this.bannerService.getBanner(bannerVO);
	}
	
	/**
	 * 添加banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap addBanner(BannerVO bannerVO) {
		return this.bannerService.addBanner(bannerVO);
	}

	/**
	 * 修改banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap updateBanner(BannerVO bannerVO) {
		return this.bannerService.updateBanner(bannerVO);
	}
	
	/**
	 * 删除banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap deleteBanner(BannerVO bannerVO) {
		return this.bannerService.deleteBanner(bannerVO);
	}
}
