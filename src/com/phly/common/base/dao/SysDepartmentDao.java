/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.SysDepartmentVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月29日 上午 11:51:09
 */

@Repository
public class SysDepartmentDao extends MyBatisDao{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询部门列表
	 * @param departmentVO
	 * @return
	 */
	public List<SysDepartmentVO> queryDepartmentList(SysDepartmentVO departmentVO){
		return this.queryList("sysDepartment.queryDepartmentList", departmentVO,departmentVO.getPageNo(),departmentVO.getPageSize());
	}
	
	
	/**
	 * 查询所有部门--下拉框
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public HashMap<String,Object> queryAllDepartment(){
		return (HashMap<String,Object>) this.queryList("sysDepartment.queryAllDepartment", null);
	}
	
	
	/**
	 * 查询部门总数
	 * @param departmentVO
	 * @return
	 */
	public int getDepartmentCount (SysDepartmentVO departmentVO){
		return (Integer) this.getObject("sysDepartment.getDepartmentCount", departmentVO);
	}
	
	
	/**
	 * 根据部门ID或者部门名称查询部门信息
	 * @param departmentVO
	 * @return
	 */
	public SysDepartmentVO getDepartment(SysDepartmentVO departmentVO){
		return (SysDepartmentVO) this.getObject("sysDepartment.getDepartment", departmentVO);
	}
	
	
	/**
	 * 添加部门信息
	 * @param departmentVO
	 * @return
	 */
	public boolean addDepartment(SysDepartmentVO departmentVO){
		boolean flag = false;
		try {
			this.insert("sysDepartment.addDepartment",departmentVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "addDepartment  添加部门失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改部门信息
	 * @param departmentVO
	 * @return
	 */
	public boolean updateDepartment(SysDepartmentVO departmentVO) {
		boolean flag = false;
		try {
			this.update("sysDepartment.updateDepartment",departmentVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "updateDepartment  修改部门失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除部门
	 * @param departmentVO
	 * @return
	 */
	public boolean delDepartment(SysDepartmentVO departmentVO) {
		boolean flag = false;
		try {
			this.delete("sysDepartment.delDepartment",departmentVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "delDepartment  删除部门失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 查询部门树列表
	 * @param departmentVO
	 * @return
	 */
	public List<SysDepartmentVO> getDepartmentList(SysDepartmentVO departmentVO){
		return this.queryList("sysDepartment.getDepartmentList", departmentVO,departmentVO.getPageNo(),departmentVO.getPageSize());
	}
}
