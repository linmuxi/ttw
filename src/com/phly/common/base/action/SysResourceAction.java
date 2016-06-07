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

import com.phly.common.base.facade.SysResourceFacade;
import com.phly.common.base.model.SysResourceVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月24日 下午1:05:02
 */

@Controller
@RemoteProxy
public class SysResourceAction {
	
	@Resource
	private SysResourceFacade resourceFacade;
	
	@RequestMapping("/page/admin/resource/index")
	@ResponseBody
	public ModelMap queryResourceList(HttpServletRequest request,SysResourceVO resourceVO){
		return this.resourceFacade.queryResourceList(resourceVO);
	}
	
	
	/**
	 * 添加资源
	 * @param resourceVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addResource(SysResourceVO resourceVO){
		return this.resourceFacade.addResource(resourceVO);
	}

	/**
	 * 根据资源ID查询资源信息
	 * @param resourceVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getResource(SysResourceVO resourceVO){
		return this.resourceFacade.getResource(resourceVO);
	}
	
	/**
	 * 修改资源
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateResource(SysResourceVO resourceVO) {
		return this.resourceFacade.updateResource(resourceVO);
	}
	
	/**
	 * 删除资源
	 * @param roleVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delResource(SysResourceVO resourceVO) {
		return this.resourceFacade.delResource(resourceVO);
	}
}
