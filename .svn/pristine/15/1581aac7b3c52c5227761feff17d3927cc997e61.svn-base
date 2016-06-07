/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysModuleVO;
import com.phly.common.base.service.SysModuleService;

/**
 * 系统模块代理类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Component
public class SysModuleFacade {

	@Resource
	private SysModuleService moduleService;
	

	/**
	 * 获取指定用户下的模块信息
	 * 
	 * @param moduleVO
	 * @return 模块集合
	 */
	public List<SysModuleVO> getSysModuleByAccount() {
		return this.moduleService.getSysModuleByAccount();
	}
	
	/**
	 * 获取模块树，目前只支持二级菜单
	 * @param moduleVO
	 * @return
	 */
	public ModelMap getModuleTree(SysModuleVO moduleVO){
		return this.moduleService.getModuleTree(moduleVO);
	}

	/**
	 * 查询模块列表
	 * @param moduleVO
	 * @return 模块集合
	 */
	public ModelMap querySysModules(SysModuleVO moduleVO){
		return this.moduleService.querySysModules(moduleVO);
	}

	/**
	 * 编辑模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap formModule(SysModuleVO moduleVO) {
		return this.moduleService.formModule(moduleVO);
	}

	/**
	 * 删除模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap delModule(SysModuleVO moduleVO) {
		return this.moduleService.delModule(moduleVO);
	}

	/**
	 * 根据模块ID获取模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap getModule(SysModuleVO moduleVO) {
		return this.moduleService.getModule(moduleVO);
	}
}
