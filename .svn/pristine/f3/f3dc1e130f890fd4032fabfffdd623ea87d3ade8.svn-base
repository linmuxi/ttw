/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.phly.common.activiti.vo.ApproverVO;
import com.phly.common.activiti.vo.FormProcessVO;
import com.phly.common.base.dao.MyBatisDao;

/**
 * 业务表单与流程配置
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Repository
public class FormProcessDao extends MyBatisDao {

	/**
	 * 查询列表
	 * @param formProcessVO
	 * @return
	 */
	public List<FormProcessVO> queryFormProcessList(FormProcessVO formProcessVO) {
		return this.queryList("formProcess.queryFormProcessList",
				formProcessVO, formProcessVO.getPageNo(),formProcessVO.getPageSize());
	}

	/**
	 * 获取总条数
	 * @param formProcessVO
	 * @return
	 */
	public int getFormProcessCount(FormProcessVO formProcessVO) {
		return (Integer) this.getObject("formProcess.getFormProcessCount", formProcessVO);
	}

	/**
	 * 新增
	 * @param formProcessVO
	 * @return
	 */
	public boolean addFormProcess(FormProcessVO formProcessVO) {
		boolean flag = false;
		try {
			this.insert("formProcess.addFormProcess", formProcessVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 修改
	 * @param formProcessVO
	 * @return
	 */
	public boolean updateFormProcess(FormProcessVO formProcessVO) {
		boolean flag = false;
		try {
			this.update("formProcess.updateFormProcess", formProcessVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 删除
	 * @param formProcessVO
	 * @return
	 */
	public boolean deleteFormProcess(FormProcessVO formProcessVO) {
		boolean flag = false;
		try {
			this.delete("formProcess.deleteFormProcess", formProcessVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 获取表单流程信息
	 * @param formProcessVO
	 * @return
	 */
	public FormProcessVO getFormProcess(FormProcessVO formProcessVO) {
		return (FormProcessVO) this.getObject("formProcess.getFormProcess", formProcessVO);
	}
	
	/**
	 * 根据业务表单名称和节点id获取审批人信息
	 * @param param
	 * @return
	 */
	public ApproverVO getApprover(Map<String,Object> param) {
		return (ApproverVO) this.getObject("formProcess.getApprover", param);
	}
}
