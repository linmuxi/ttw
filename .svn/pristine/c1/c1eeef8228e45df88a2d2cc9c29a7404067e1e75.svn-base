/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysSupplierFacade;
import com.phly.common.base.model.SysSupplierVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月9日 下午7:05:02
 */

@Controller
@RemoteProxy
public class SysSupplierAction {

	@Resource
	private SysSupplierFacade sysSupplierFacade;

	@RequestMapping("/page/admin/supplier/index")
	@ResponseBody
	public ModelMap querySupplierList(HttpServletRequest request,SysSupplierVO supplierVO) {
		return this.sysSupplierFacade.querySupplieList(supplierVO);
	}

	/**
	 * 添加供应商
	 * 
	 * @param supplierVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierFacade.addSupplier(supplierVO);
	}
	
	/**
	 * 根据供应商ID查询供应商
	 * @param supplierVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getSupplier(SysSupplierVO supplierVO){
		return this.sysSupplierFacade.getSupplier(supplierVO);
	}

	/**
	 * 修改供应商
	 * 
	 * @param SupplierVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierFacade.updateSupplier(supplierVO);
	}

	/**
	 * 删除供应商
	 * 
	 * @param delSupplier
	 * @return
	 */
	@RemoteMethod
	public ModelMap delSupplier(SysSupplierVO supplierVO) {
		return this.sysSupplierFacade.delSupplier(supplierVO);
	}

}
