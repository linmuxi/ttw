/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.utils;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Repository;

import com.phly.common.activiti.facade.ActivitiFacade;
import com.phly.common.activiti.service.FormProcessService;
import com.phly.common.activiti.vo.ApproverVO;
import com.phly.common.activiti.vo.CommentVO;

/**
 * 工作流帮助类
 * 
 * @Description: 提供上下文容器，获取bean对象
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
@Repository
public class ActivitiUtil implements ApplicationContextAware {

	@Resource
	private ActivitiFacade activitiFacade;
	
	@Resource
	private FormProcessService formProcessService;
	
	/**
	 * 根据业务表单名称启动工作流
	 * @param formName 业务表单名称
	 * @param businessKey 业务key
	 * @param variables 流程变量
	 * @return 流程实例ID
	 */
	public String startWorkFlowByFormName(String formName,String businessKey,Map<String, Object> variables){
		return activitiFacade.startWorkflow(this.formProcessService.getProcessDefinitionIdByFormName(formName),businessKey,variables);
	}
	
	/**
	 * 根据流程定义ID启动工作流
	 * @param formName 业务表单名称
	 * @param businessKey 业务key
	 * @param variables 流程变量
	 * @return 流程实例ID
	 */
	public String startWorkFlowByProcessDefinitionId(String processDefinitionId,String businessKey,Map<String, Object> variables){
		return activitiFacade.startWorkflow(processDefinitionId,businessKey,variables);
	}
	
	/**
	 * 根据业务主键获取是否有任务
	 * 
	 * @param taskVO
	 * @return
	 */
	public boolean getTaskByBusinessKey(String businessKey) {
		return activitiFacade.getTaskByBusinessKey(businessKey);
	}
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
	}

	/**
	 * 根据业务表单名称和节点id获取审批人信息
	 * @param formName
	 * @param node
	 * @return
	 */
	public ApproverVO getApprover(String formName,int node){
		return this.formProcessService.getApprover(formName, node);
	}
	
	/**
	 * 根据业务key获取流程任务审批意见信息
	 * @param businessKey
	 */
	public List<CommentVO> queryCommentByBkey(String businessKey){
		CommentVO commentVO = new CommentVO();
		commentVO.setBusinessKey(businessKey);
		return this.activitiFacade.queryCommentByBkey(commentVO);
	}
}
