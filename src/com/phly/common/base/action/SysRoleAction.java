/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysRoleFacade;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;

/**
 * 系统角色控制类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Controller
@RemoteProxy
public class SysRoleAction {

	@Resource
	private SysRoleFacade roleFacade;
	

	/**
	 * 查询角色列表
	 * 
	 * @param roleVO
	 * @return 角色集合
	 */
	@RequestMapping("/page/admin/role/index")
	@ResponseBody
	@ExceptionMessage("查询角色列表失败，请联系管理员")
	public ModelMap queryRoleList(HttpServletRequest request,SysRoleVO roleVO) {
		return this.roleFacade.queryRoleList(roleVO);
	}
	
	/**
	 * 查询角色
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getRole(SysRoleVO roleVO){
		return this.roleFacade.getRole(roleVO);
	}
	
	/**
	 * 添加角色
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("添加角色失败，请联系管理员")
	public ModelMap addRole(SysRoleVO roleVO) {
		return this.roleFacade.addRole(roleVO);
	}
	
	/**
	 * 修改角色
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("修改角色失败，请联系管理员")
	public ModelMap updateRole(SysRoleVO roleVO) {
		return this.roleFacade.updateRole(roleVO);
	}
	
	/**
	 * 删除角色
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("删除角色失败，请联系管理员")
	public ModelMap delRole(SysRoleVO roleVO) {
		return this.roleFacade.delRole(roleVO);
	}

	/**
	 * 查看角色可以访问的模块
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/admin/role/getRoleModuleInfo")
	public String getRoleModuleInfo(HttpServletRequest request, SysRoleVO roleVO){
		try {
			request.setAttribute("other", new JSONObject().element("type", 3).
					element("objId",roleVO.getRoleId()).
					element("objName",URLDecoder.decode(roleVO.getRoleName(), "UTF-8")));//权限
			request.setAttribute("data", this.roleFacade.getRoleModuleInfo(roleVO));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "/page/platform/authorization.jsp";
	}

	/**
	 * 添加角色模块关系数据
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addRoleModule(SysRoleVO roleVO){
		return this.roleFacade.addRoleModule(roleVO);
	}

	/**
	 * 查看角色可以访问的权限
	 * @param roleVO
	 * @return
	 */
	@RequestMapping("/page/admin/role/getRoleAuthInfo")
	public String getRoleAuthInfo(HttpServletRequest request, SysRoleVO roleVO){
		try {
			request.setAttribute("other", new JSONObject().element("type", 2).
					element("objId",roleVO.getRoleId()).
					element("objName",URLDecoder.decode(roleVO.getRoleName(), "UTF-8")));//权限
			request.setAttribute("data", this.roleFacade.getRoleAuthInfo(roleVO));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "/page/platform/authorization.jsp";
	}

	/**
	 * 添加角色权限关系数据
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addRoleAuth(SysRoleVO roleVO){
		return this.roleFacade.addRoleAuth(roleVO);
	}
}
