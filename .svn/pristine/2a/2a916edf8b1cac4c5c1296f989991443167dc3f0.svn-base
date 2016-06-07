/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysModuleFacade;
import com.phly.common.base.model.SysModuleVO;

/**
 * 系统模块控制类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Controller
@RemoteProxy
public class SysModuleAction {

	@Resource
	private SysModuleFacade moduleFacade;

	/**
	 * 查询模块列表
	 * @param moduleVO
	 * @return 模块集合
	 */
	@RequestMapping("/page/admin/module/index")
	@ResponseBody
	public ModelMap querySysModules(SysModuleVO moduleVO){
		return this.moduleFacade.querySysModules(moduleVO);
	}

	/**
	 * 获取模块树，目前只支持二级菜单
	 * @param moduleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getModuleTree(SysModuleVO moduleVO){
		return this.moduleFacade.getModuleTree(moduleVO);
	}

	/**
	 * 编辑模块
	 * @param moduleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap formModule(SysModuleVO moduleVO) {
		return this.moduleFacade.formModule(moduleVO);
	}
	
	/**
	 * 删除模块
	 * @param moduleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delModule(SysModuleVO moduleVO) {
		return this.moduleFacade.delModule(moduleVO);
	}

	/**
	 * 根据模块ID获取模块
	 * @param moduleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getModule(SysModuleVO moduleVO) {
		return this.moduleFacade.getModule(moduleVO);
	}
}
