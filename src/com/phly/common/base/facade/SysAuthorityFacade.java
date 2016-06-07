/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysAuthorityVO;
import com.phly.common.base.service.SysAuthorityService;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月19日 下午3:06:24
 */

@Component
public class SysAuthorityFacade {


	@Resource
	private SysAuthorityService authorityService;
	
	/**
	 * 查询权限列表
	 * @param authorityVO
	 * @return
	 */
	public ModelMap queryAuthorityList(SysAuthorityVO authorityVO){
		return this.authorityService.queryAuthorityList(authorityVO);
	}
	
	
	/**
	 * 添加权限
	 * @param authorityVO
	 * @return
	 */
	public ModelMap addAuthority(SysAuthorityVO authorityVO){
		return this.authorityService.addAuthority(authorityVO);
	}
	
	
	/**
	 * 修改权限
	 * @param authorityVO
	 * @return
	 */
	public ModelMap updateAuthority(SysAuthorityVO authorityVO) {
		return this.authorityService.updateAuthority(authorityVO);
	}
	
	
	/**
	 * 根据权限ID查询权限信息
	 * @param authorityVO
	 * @return
	 */
	public ModelMap getAuthority(SysAuthorityVO authorityVO){
		return this.authorityService.getAuthority(authorityVO);
	}
	
	/**
	 * 删除权限
	 * @param authorityVO
	 * @return
	 */
	public ModelMap delAuthority(SysAuthorityVO authorityVO) {
		return this.authorityService.delAuthority(authorityVO);
	}

	/**
	 * 查看权限可以访问的资源
	 * @param authorityVO
	 * @return
	 */
	public ModelMap getAuthorityResourceInfo(SysAuthorityVO authorityVO){
		return this.authorityService.getAuthorityResourceInfo(authorityVO);
	}
	

	/**
	 * 添加权限对应的资源信息
	 * @param authorityVO
	 * @return
	 */
	public ModelMap addAuthorityAuth(SysAuthorityVO authorityVO){
		return this.authorityService.addAuthorityAuth(authorityVO);
	}
}
