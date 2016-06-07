/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.dao.FormProcessDao;
import com.phly.common.activiti.vo.ApproverVO;
import com.phly.common.activiti.vo.FormProcessVO;
import com.phly.common.base.service.ServiceBase;

/**
 * 业务表单与流程配置管理
 * @Description 配置业务表单使用哪个流程定义
 * @author linyong
 * @since 2015年6月20日 上午12:40:09
 */
@Service
public class FormProcessService extends ServiceBase{

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	private FormProcessDao formProcessDao;
	
	/**
	 * 查询表单流程列表
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap queryFormProcessList(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = this.formProcessDao.getFormProcessCount(formProcessVO);
		if (count > 0) {
			map.put(ROWS, this.formProcessDao.queryFormProcessList(formProcessVO));
			map.put(TOTAL, count);
			map.put(CURRENT, formProcessVO.getPageNo());
			map.put(ROWCOUNT, formProcessVO.getPageSize());
		}
		return map;
	}
	
	/**
	 * 配置表单流程信息
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap addFormProcess(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		if(this.formProcessDao.getFormProcess(formProcessVO) == null){
			map.put("result", this.formProcessDao.addFormProcess(formProcessVO));
		}else{
			map.put("result", false);
			map.put("remark", "该表单流程信息已经存在。");
		}
		return map;
	}
	
	/**
	 * 修改表单流程信息
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap updateFormProcess(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		map.put("result", this.formProcessDao.updateFormProcess(formProcessVO));
		return map;
	}
	
	/**
	 * 删除表单流程信息
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap deleteFormProcess(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		map.put("result", this.formProcessDao.deleteFormProcess(formProcessVO));
		return map;
	}
	
	/**
	 * 获取表单流程信息
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap getFormProcess(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		FormProcessVO vo = this.formProcessDao.getFormProcess(formProcessVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}
	
	/**
	 * 根据表单名称查看表单流程信息是否已经存在
	 * @param formProcessVO
	 * @return
	 */
	public ModelMap getFormNameExists(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		map.put("valid", true);
		FormProcessVO pvo = new FormProcessVO();
		pvo.setFormName(formProcessVO.getFormName());
		FormProcessVO vo = this.formProcessDao.getFormProcess(pvo);
		if(null != vo && !StringUtils.equalsIgnoreCase(vo.getId(), formProcessVO.getId())){
			map.put("valid", false);
		}
		return map;
	}

	/**
	 * 编辑表单流程
	 * @param userVO
	 * @return
	 */
	public ModelMap formProcess(FormProcessVO formProcessVO) {
		ModelMap map = new ModelMap();
		if(null == formProcessVO){
			map.put("result", false);
			map.put("remark", "对象为null");
			return map;
		}
		if(StringUtils.isNotEmpty(formProcessVO.getId())){
			//修改
			return this.updateFormProcess(formProcessVO);
		}else{
			//新增
			return this.addFormProcess(formProcessVO);
		}
	}
	
	/**
	 * 根据业务表单名称获取流程定义ID
	 * @param formName
	 * @return
	 */
	public String getProcessDefinitionIdByFormName(String formName){
		FormProcessVO vo = new FormProcessVO();
		vo.setFormName(formName);
		ModelMap map = this.getFormProcess(vo);
		if(null != map && (Boolean)map.get("sucflag")){
			return ((FormProcessVO)map.get("bean")).getProdefId();
		}else{
			logger.error("根据业务表单名称没有获取到流程定义ID，业务表单名称："+formName);
			return null;
		}
	}
	
	/**
	 * 根据业务表单名称和节点id获取审批人信息
	 * @param param
	 * @return
	 */
	public ApproverVO getApprover(String formName,int node) {
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("formName", formName);
		param.put("node", node);
		ApproverVO approverVO = this.formProcessDao.getApprover(param);
		if(approverVO == null){
			logger.error("根据业务表单名称和节点id获取审批人信息为空");
		}
		return approverVO;
	}
}
