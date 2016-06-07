/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysResourceVO;
import com.phly.common.base.service.SysResourceService;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月24日 下午3:06:24
 */

@Component
public class SysResourceFacade {

	@Resource
	private SysResourceService resourceService;
	
	/**
	 * 查询资源列表
	 * @param resourceVO
	 * @return
	 */
	public ModelMap queryResourceList(SysResourceVO resourceVO){
		return this.resourceService.queryResourceList(resourceVO);
	}
	
	/**
	 * 添加资源
	 * @param resourceVO
	 * @return
	 */
	public ModelMap addResource(SysResourceVO resourceVO){
		return this.resourceService.addResource(resourceVO);
	}
	
	
	/**
	 * 根据资源ID查询资源信息
	 * @param resourceVO
	 * @return
	 */
	public ModelMap getResource(SysResourceVO resourceVO){
		return this.resourceService.getResource(resourceVO);
	}
	
	
	/**
	 * 修改资源
	 * @param roleVO
	 * @return
	 */
	public ModelMap updateResource(SysResourceVO resourceVO) {
		return this.resourceService.updateResource(resourceVO);
	}
	
	/**
	 * 删除资源
	 * @param roleVO
	 * @return
	 */
	public ModelMap delResource(SysResourceVO resourceVO) {
		return this.resourceService.delResource(resourceVO);
	}
	
}
