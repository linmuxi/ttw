/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysDepartmentFacade;
import com.phly.common.base.model.SysDepartmentVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月29日 下午1:05:02
 */

@Controller
@RemoteProxy
public class SysDepartmentAction {
	
	@Resource
	private SysDepartmentFacade departmentFacade;
	
	@RequestMapping("/page/admin/department/index")
	@ResponseBody
	public ModelMap queryDepartmentList(HttpServletRequest request,SysDepartmentVO departmentVO){
		return this.departmentFacade.queryDepartmentList(departmentVO);
	}
	
	/**
	 * 查询所有部门--下拉框
	 * @param request
	 * @return
	 */
	@RemoteMethod
	public List<SysDepartmentVO> queryAllDepartment(SysDepartmentVO departmentVO){
		return this.departmentFacade.queryAllDepartment(departmentVO);
	}
	
	
	/**
	 * 添加部门
	 * @param departmentVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addDepartment(SysDepartmentVO departmentVO){
		return this.departmentFacade.addDepartment(departmentVO);
	}

	
	/**
	 * 修改部门
	 * @param departmentVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateDepartment(SysDepartmentVO departmentVO) {
		return this.departmentFacade.updateDepartment(departmentVO);
	}
	
	
	/**
	 * 根据部门ID查询部门信息
	 * @param departmentVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getDepartment(SysDepartmentVO departmentVO){
		return this.departmentFacade.getDepartment(departmentVO);
	}
	
	/**
	 * 删除部门
	 * @param delDepartment
	 * @return
	 */
	@RemoteMethod
	public ModelMap delDepartment(SysDepartmentVO departmentVO) {
		return this.departmentFacade.delDepartment(departmentVO);
	}

	/**
	 * 获取指定父部门下的所有子孙部门列表
	 * @param departmentVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getChildDepartMentByParent(SysDepartmentVO departmentVO) {
		return this.departmentFacade.getChildDepartMentByParent(departmentVO);
	}
}
