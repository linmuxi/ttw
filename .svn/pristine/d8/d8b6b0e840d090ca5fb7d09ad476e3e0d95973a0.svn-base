/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.service.SysRoleService;

/**
 * 系统角色代理类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Component
public class SysRoleFacade {

	@Resource
	private SysRoleService roleService;

	/**
	 * 查询角色列表
	 * 
	 * @param roleVO
	 * @return 角色集合
	 */
	public ModelMap queryRoleList(SysRoleVO roleVO) {
		return this.roleService.queryRoleList(roleVO);
	}

	/**
	 * 添加角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRole(SysRoleVO roleVO) {
		return this.roleService.addRole(roleVO);
	}
	
	/**
	 * 修改角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap updateRole(SysRoleVO roleVO) {
		return this.roleService.updateRole(roleVO);
	}
	
	/**
	 * 删除角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap delRole(SysRoleVO roleVO) {
		return this.roleService.delRole(roleVO);
	}
	
	/**
	 * 查看角色可以访问的模块
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRoleModuleInfo(SysRoleVO roleVO) {
		return this.roleService.getRoleModuleInfo(roleVO);
	}
	
	/**
	 * 查询角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRole(SysRoleVO roleVO){
		return this.roleService.getRole(roleVO);
	}
	
	/**
	 * 添加角色模块关系数据
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRoleModule(SysRoleVO roleVO){
		return this.roleService.addRoleModule(roleVO);
	}

	/**
	 * 查看角色可以访问的权限
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRoleAuthInfo(SysRoleVO roleVO) {
		return this.roleService.getRoleAuthInfo(roleVO);
	}
	
	/**
	 * 添加角色权限关系数据
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRoleAuth(SysRoleVO roleVO){
		return this.roleService.addRoleAuth(roleVO);
	}
}
