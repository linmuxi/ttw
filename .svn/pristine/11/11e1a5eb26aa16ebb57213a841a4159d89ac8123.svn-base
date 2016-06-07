/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysUserFacade;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.GenerationImgUtil;

/**
 * 系统用户控制类
 * 
 * @Description TODO
 * @author orc_lh
 * @since 2015年5月21日 下午11:43:26
 */
@Controller
@RemoteProxy
public class SysUserAction {

	@Resource
	private SysUserFacade userFacade;
	

	/**
	 * 查询用户列表
	 * 
	 * @param userVO
	 * @return 用户集合
	 */
	@RequestMapping("/page/admin/user/index")
	@ResponseBody
	public ModelMap queryUserList(HttpServletRequest request,SysUserVO userVO) {
		return this.userFacade.queryUserList(userVO);
	}
	
	/**
	 * 根据用户名称或id获取用户vo
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/getUser")
	@ResponseBody
	@RemoteMethod
	public ModelMap getUser(SysUserVO userVO) {
		return this.userFacade.getUser(userVO);
	}
	
	/**
	 * 添加用户
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public ModelMap addUser(SysUserVO userVO) {
		return this.userFacade.addUser(userVO);
	}
	/**
	 * 修改用户
	 * @param userVO
	 * @return
	 */
	 
	@RequestMapping("/updateUser")
	@ResponseBody
	public ModelMap updateUser(SysUserVO userVO) {
		return this.userFacade.updateUser(userVO);
	}
	
	/**
	 * 删除用户
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/delUser")
	@ResponseBody
	@RemoteMethod
	public ModelMap delUser(SysUserVO userVO) {
		return this.userFacade.delUser(userVO);
	}
	
	/**
	 * 重置密码
	 * @param userVO
	 * @return
	 */
	@RemoteMethod
	public String resetPwd(String userId) {
		return this.userFacade.resetPwd(new SysUserVO(userId));
	}
	
	/**
	 * 编辑用户
	 * @param userVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap formUser(SysUserVO userVO){
		return this.userFacade.formUser(userVO);
	}

	/**
	 * 查询指定帐号是否存在
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/admin/user/getAccountExists")
	@ResponseBody
	public ModelMap getAccountExists(HttpServletRequest request, SysUserVO userVO){
		return this.userFacade.getAccountExists(userVO);
	}
	
	
	/**
	 * 查看用户拥有的角色
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/admin/user/getUserRoleInfo")
	public String getUserRoleInfo(HttpServletRequest request, SysUserVO userVO){
		request.setAttribute("other", new JSONObject().element("type", 1).element("objId", userVO.getUserId())
				.element("objName", userVO.getAccount()));//角色
		request.setAttribute("data", this.userFacade.getUserRoleInfo(userVO));
		return "/page/platform/authorization.jsp";
	}

	/**
	 * 添加用户角色关系数据
	 * @param userVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addUserRole(SysUserVO userVO){
		return this.userFacade.addUserRole(userVO);
	}
	
	/***
	 * 生成登录验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/loginVerifyCode")
	public void loginVerifyCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		GenerationImgUtil.buildVerifyCodeImg(request, response,"loginCode");
	}
	
	
	/***
	 * 验证码是否正确
	 * @param request
	 * @param code
	 * @return
	 */
	@RequestMapping("/page/admin/user/loginCheckVerifyCode")
	@ResponseBody
	public ModelMap loginCheckVerifyCode(HttpServletRequest request,String code) {
		ModelMap map = new ModelMap();
		String sessionCode = (String) request.getSession().getAttribute("loginCode");
		map.put("flag", sessionCode.equalsIgnoreCase(code));
		return map;
	}
}
