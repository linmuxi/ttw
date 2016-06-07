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

import com.phly.ttw.manage.goods.facade.BrandFacade;
import com.phly.ttw.manage.goods.model.BrandVO;

/**
 * 品牌控制器类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Controller
@RemoteProxy
public class BrandAction {

	@Resource
	private BrandFacade brandFacade;
	
	@RequestMapping("/page/business/brand")
	@ResponseBody
	public ModelMap queryBrandList(HttpServletRequest request,BrandVO brandVO){
		return this.brandFacade.queryBrandList(brandVO);
	}
	
	
	/**
	 * 根据id获取品牌
	 * @param brandVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getBrand(BrandVO brandVO){
		return this.brandFacade.getBrand(brandVO);
	}
	
	
	/**
	 * 添加品牌
	 * @param brandVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addBrand(BrandVO brandVO){
		return this.brandFacade.addBrandVO(brandVO);
	}

	
	/**
	 * 修改品牌
	 * @param brandVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateBrand(BrandVO brandVO) {
		return this.brandFacade.updateBrand(brandVO);
	}
	
	/**
	 * 删除品牌
	 * @param brandVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delBrand(BrandVO brandVO) {
		return this.brandFacade.delBrand(brandVO);
	}
}
