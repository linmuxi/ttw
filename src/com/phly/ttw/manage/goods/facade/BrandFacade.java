/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.goods.model.BrandVO;
import com.phly.ttw.manage.goods.service.BrandService;

/**
 * 品牌模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class BrandFacade {

	@Resource
	private BrandService brandService;
	
	/**
	 * 查询品牌列表
	 * @param brandVO
	 * @return
	 */
	public ModelMap queryBrandList(BrandVO brandVO){
		return this.brandService.queryBrandList(brandVO);
	}
	
	/**
	 * 根据id获取品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap getBrand(BrandVO brandVO){
		return this.brandService.getBrand(brandVO);
	}
	
	
	/**
	 * 添加品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap addBrandVO(BrandVO brandVO){
		return this.brandService.addBrand(brandVO);
	}
	
	
	/**
	 * 修改品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap updateBrand(BrandVO brandVO) {
		return this.brandService.updateBrand(brandVO);
	}
	
	/**
	 * 删除品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap delBrand(BrandVO brandVO) {
		return this.brandService.delBrand(brandVO);
	}
}
