/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.phly.common.base.dao.SysUserDao;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.model.SysUserVO;

/**
 * 会话请求容器帮助类
 * @Description TODO
 * @author linyong
 * @since 2015年5月24日 下午4:32:07
 */
public class RequestContextUtil {
	
	private RequestContextUtil(){
	}
	
	/**
	 * 获取当前登录用户
	 * @return
	 */
	public static SysUserVO getCurrentUser(){
		return getUser(false);
	}
	
	/**
	 * 获取当前登录用户级联角色
	 * @return
	 */
	public static SysUserVO getCurrentUserRole(){
		return getUser(true);
	}
	
	private static SysUserVO getUser(boolean isQueryRole){
		SecurityContext context = SecurityContextHolder.getContext();
		if(context != null && context.getAuthentication() != null){
			if(context.getAuthentication().getPrincipal() instanceof SysUserVO){
				SysUserVO userVO = (SysUserVO) context.getAuthentication().getPrincipal();
				if(isQueryRole){
					userVO.setRoles(((SysUserDao)ApplicationContextUtil.getBean(SysUserDao.class)).getSelfRole(userVO));
				}
				return userVO;
			}
		}
		return null;
	}
	
	
	/**
	 * 判断当前登陆用户是否包含roleNames角色
	 * @param roleNames
	 * @return
	 */
	public static boolean existsRole(String roleNames){
		boolean flag = false;
		if(StringUtils.isEmpty(roleNames)){
			return false;
		}
		SysUserVO userVO = RequestContextUtil.getCurrentUserRole();
		List<SysRoleVO> voList = userVO.getRoles();
		for(SysRoleVO vo : voList){
			String [] roleNameArr = roleNames.split(","); 
			for(String roleName : roleNameArr){
				if(roleName.equals(vo.getRoleName())){
					flag = true;
				}
			}
		}
		return flag;
	} 
}
