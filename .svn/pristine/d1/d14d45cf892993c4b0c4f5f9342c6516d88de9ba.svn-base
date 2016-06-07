/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.SysUserService;
import com.phly.common.util.DigestUtil;

/**
 * 系统用户代理类
 * 
 * @Description TODO
 * @author orc_lh
 * @since 2015年5月21日 下午11:43:26
 */
@Component
public class SysUserFacade {

	@Resource
	private SysUserService userService;

	/**
	 * 查询用户列表
	 * 
	 * @param userVO
	 * @return 用户集合
	 */
	public ModelMap queryUserList(SysUserVO userVO) {
		return this.userService.queryUserList(userVO);
	}
	
	/**
	 * 根据用户名称或id获取用户vo
	 * @param userVO
	 * @return
	 */
	public ModelMap getUser(SysUserVO userVO) {
		return this.userService.getUser(userVO);
	}

	/**
	 * 添加用户
	 * @param userVO
	 * @return
	 */
	public ModelMap addUser(SysUserVO userVO) {
		return this.userService.addUser(userVO);
	}
	
	/**
	 * 修改用户
	 * @param userVO
	 * @return
	 */
	public ModelMap updateUser(SysUserVO userVO) {
		return this.userService.updateUser(userVO);
	}
	/**
	 * 删除用户
	 * @param userVO
	 * @return
	 */
	public ModelMap delUser(SysUserVO userVO) {
		return this.userService.delUser(userVO);
	}

	/**
	 * 编辑用户
	 * @param userVO
	 * @return
	 */
	public ModelMap formUser(SysUserVO userVO){
		return this.userService.formUser(userVO);
	}

	/**
	 * 查询指定帐号是否存在
	 * @param userVO
	 * @return
	 */
	public ModelMap getAccountExists(SysUserVO userVO){
		return this.userService.getAccountExists(userVO);
	}
	
	/**
	 * 查看用户拥有的角色
	 * @param userVO
	 * @return
	 */
	public ModelMap getUserRoleInfo(SysUserVO userVO){
		return this.userService.getUserRoleInfo(userVO);
	}

	/**
	 * 添加用户角色关系数据
	 * @param userVO
	 * @return
	 */
	public ModelMap addUserRole(SysUserVO userVO){
		return this.userService.addUserRole(userVO);
	}

	/***
	 * 修改密码时使用
	 * @param userVO
	 * @return
	 */
	public boolean getUserPwdByPwdAndAccount(SysUserVO userVO) {
		SysUserVO vo = (SysUserVO) this.userService.findSysUserVOByAccount(userVO);
		return vo.getPassword().equals(DigestUtil.encodePasswordByMD5(userVO.getPassword(), userVO.getAccount()));
	}

	public String resetPwd(SysUserVO userVO) {
		return this.userService.resetPwd(userVO);
	}
}
