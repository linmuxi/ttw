/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysDepartmentDao;
import com.phly.common.base.model.SysDepartmentVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.RequestContextUtil;

/**
*
* @Description: TODO
* @author wanglong
* @since 2015年5月29日 下午2:58:04
*/

@Service
public class SysDepartmentService extends ServiceBase{

	@Resource
	private SysDepartmentDao departmentDao;
	
	public ModelMap queryDepartmentList(SysDepartmentVO departmentVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.departmentDao.getDepartmentCount(departmentVO);
		if(count > 0){
			model.put(ROWS, this.departmentDao.queryDepartmentList(departmentVO));
			model.put(TOTAL, count);
			model.put(CURRENT, departmentVO.getPageNo());
			model.put(ROWCOUNT, departmentVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 查询所有部门--下拉框
	 * @return
	 */
	public List<SysDepartmentVO> queryAllDepartment(SysDepartmentVO departmentVO){
		departmentVO.setPageSize(Integer.MAX_VALUE);
		List<SysDepartmentVO> childDepartments = this.departmentDao.queryDepartmentList(departmentVO);
		return childDepartments;
	}
	
	
	/**
	 * 添加部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap addDepartment(SysDepartmentVO departmentVO){
		ModelMap model= new ModelMap();
		if(this.departmentDao.getDepartment(departmentVO) == null){
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			departmentVO.setIsDel(0);
			departmentVO.setCreator(userVO.getAccount());
			departmentVO.setCreateDate(new Timestamp(new Date().getTime()));
			departmentVO.setLastUpdater(userVO.getAccount());
			departmentVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
			model.put("result", this.departmentDao.addDepartment(departmentVO));
		}else{
			model.put("result", false);
			model.put("remark", "该部门已经存在。");
		}
		return model;
	}
	
	
	/**
	 * 修改部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap updateDepartment(SysDepartmentVO departmentVO) {
		ModelMap model = new ModelMap();
		SysDepartmentVO paramVO = new SysDepartmentVO();
		paramVO.setOrgName(departmentVO.getOrgName());
		SysDepartmentVO vo = this.departmentDao.getDepartment(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getDepartmentId(), departmentVO.getDepartmentId())){
			model.put("result", false);
			model.put("remark", "该部门已经存在");
		}else{
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			departmentVO.setCreator(userVO.getAccount());
			departmentVO.setCreateDate(new Timestamp(new Date().getTime()));
			departmentVO.setLastUpdater(userVO.getAccount());
			departmentVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
			model.put("result", this.departmentDao.updateDepartment(departmentVO));
		}
		return model;
	}
	
	
	
	/**
	 * 根据部门ID查询部门信息
	 * @param departmentVO
	 * @return
	 */
	public ModelMap getDepartment(SysDepartmentVO departmentVO){
		ModelMap map = new ModelMap();
		SysDepartmentVO vo = this.departmentDao.getDepartment(departmentVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	
	}
	
	/**
	 * 删除部门
	 * @param departmentVO
	 * @return
	 */
	public ModelMap delDepartment(SysDepartmentVO departmentVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = departmentVO.getDepartmentId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					departmentVO = new SysDepartmentVO();
					departmentVO.setDepartmentId(id);
					flag = this.departmentDao.delDepartment(departmentVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
	
	/**
	 * 获取指定父部门下的所有子孙部门列表
	 * @param departmentVO
	 * @return
	 */
	public ModelMap getChildDepartMentByParent(SysDepartmentVO departmentVO) {
		ModelMap model = new ModelMap();
		LinkedList<ModelMap> departTree = new LinkedList<ModelMap>();
		departTree.addAll(getChildDepartMent(departmentVO,true));
		model.put("result", departTree);
		return model;
	}
	
	private LinkedList<ModelMap> getChildDepartMent(SysDepartmentVO departmentVO,boolean isOpen) {
		LinkedList<ModelMap> departTree = new LinkedList<ModelMap>();
		departmentVO.setPageSize(Integer.MAX_VALUE);
		List<SysDepartmentVO> childDepartments = this.departmentDao.getDepartmentList(departmentVO);
		if(null != childDepartments && childDepartments.size() > 0){
			for (SysDepartmentVO sysDepartmentVO : childDepartments) {
				ModelMap map = new ModelMap();
				map.put("id", sysDepartmentVO.getDepartmentId());
				map.put("parent_org", sysDepartmentVO.getParentId());
				map.put("name", sysDepartmentVO.getOrgName());
				map.put("open", isOpen);
				departTree.add(map);
				departmentVO.setParentId(sysDepartmentVO.getDepartmentId());
				departTree.addAll(getChildDepartMent(departmentVO,false));
			}
		}
		return departTree;
	}
}
