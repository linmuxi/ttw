/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysDepartmentVO;
import com.phly.common.base.service.SysDepartmentService;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月29日 下午3:06:24
 */

@Component
public class SysDepartmentFacade {


	@Resource
	private SysDepartmentService departmentService;
	
	/**
	 * 查询部门列表
	 * @param departmentVO
	 * @return
	 */
	public ModelMap queryDepartmentList(SysDepartmentVO departmentVO){
		return this.departmentService.queryDepartmentList(departmentVO);
	}
	
	/**
	 * 查询所有部门--下拉框
	 * @return
	 */
	public List<SysDepartmentVO> queryAllDepartment(SysDepartmentVO departmentVO){
		return this.departmentService.queryAllDepartment(departmentVO);
	}
	
	/**
	 * 添加部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap addDepartment(SysDepartmentVO departmentVO){
		return this.departmentService.addDepartment(departmentVO);
	}
	
	
	/**
	 * 修改部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap updateDepartment(SysDepartmentVO departmentVO) {
		return this.departmentService.updateDepartment(departmentVO);
	}
	
	
	/**
	 * 根据部门ID查询部门信息
	 * @param departmentVO
	 * @return
	 */
	public ModelMap getDepartment(SysDepartmentVO departmentVO){
		return this.departmentService.getDepartment(departmentVO);
	}
	
	/**
	 * 删除部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap delDepartment(SysDepartmentVO departmentVO) {
		return this.departmentService.delDepartment(departmentVO);
	}
	
	/**
	 * 获取指定父部门下的所有子孙部门列表
	 * @param departmentVO
	 * @return
	 */
	public ModelMap getChildDepartMentByParent(SysDepartmentVO departmentVO) {
		return this.departmentService.getChildDepartMentByParent(departmentVO);
	}
}
