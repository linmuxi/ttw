/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysSupplierVO;
import com.phly.common.base.service.SysSupplierService;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月9日 下午7:39:49
 */
@Component
public class SysSupplierFacade {

	@Resource
	private SysSupplierService sysSupplierService;

	/**
	 * 查询供应商列表
	 * 
	 * @param supplierVO
	 * @return
	 */
	public ModelMap querySupplieList(SysSupplierVO supplierVO) {
		return this.sysSupplierService.querySupplierList(supplierVO);
	}
	
	/**
	 * 根据供应商ID查询供应商
	 * @param supplierVO
	 * @return
	 */
	public ModelMap getSupplier(SysSupplierVO supplierVO){
		return this.sysSupplierService.getSupplier(supplierVO);
	}

	/**
	 * 添加部门
	 * 
	 * @param supplierVO
	 * @return
	 */
	public ModelMap addSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierService.addSupplier(supplierVO);
	}

	/**
	 * 修改部门
	 * 
	 * @param supplierVO
	 * @return
	 */
	public ModelMap updateSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierService.updateSupplier(supplierVO);
	}

	/**
	 * 删除供应商
	 * 
	 * @param supplierVO
	 * @return
	 */
	public ModelMap delSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierService.delSupplier(supplierVO);
	}

}
