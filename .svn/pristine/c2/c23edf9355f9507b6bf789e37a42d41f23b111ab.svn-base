/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.facade;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.ActivitiService;
import com.phly.common.activiti.vo.CommentVO;
import com.phly.common.activiti.vo.DeploymentVO;
import com.phly.common.activiti.vo.ProcessDefinitionVO;
import com.phly.common.activiti.vo.TaskVO;

/**
 * 工作流代理类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Component
public class ActivitiFacade {

	@Resource
	private ActivitiService activitiService;

	/**
	 * 部署流程
	 * @param resourceName
	 * @param inputStream
	 * @return
	 */
	public String deploy(DeploymentVO deploymentVO){
		return this.activitiService.deploy(deploymentVO);
	}

	/**
	 * 删除流程部署信息
	 * 
	 * @param deploymentId
	 * @return
	 */
	public boolean deleteDeployment(DeploymentVO deploymentVO){
		return this.activitiService.deleteDeployment(deploymentVO);
	}

	/**
	 * 预览流程
	 * 
	 * @param processDefinitionId
	 * @return
	 */
	public InputStream reviewProcessDefinition(String processDefinitionId) {
		return this.activitiService
				.reviewProcessDefinition(processDefinitionId);
	}

	/**
	 * 预览流程-高亮显示当前节点
	 * @param taskId
	 * @return
	 */
	public InputStream reviewNowProcess(String taskId){
		return this.activitiService.reviewNowProcess(taskId);
	}
	
	/**
	 * 获取所有流程定义
	 */
	public ModelMap getProcessDefinitionList(ProcessDefinitionVO pdVO) {
		return this.activitiService.getProcessDefinitionList(pdVO);
	}

	/**
	 * 启动工作流
	 * 
	 * @param processDefinitionId
	 * @param businessKey
	 * @param variables
	 * @return 流程实例ID
	 */
	public String startWorkflow(String processDefinitionId, String businessKey,Map<String, Object> variables) {
		return this.activitiService.startWorkflow(processDefinitionId,businessKey, variables);
	}

	/**
	 * 获取任务列表
	 * 
	 * @param taskVO
	 * @return
	 */
	@Deprecated
	public ModelMap getTaskList(TaskVO taskVO) {
		return this.activitiService.getTaskList(taskVO);
	}
	
	/**
	 * 获取任务列表
	 * 
	 * @param taskVO
	 * @return
	 */
	public ModelMap getNewTaskList(TaskVO taskVO) {
		return this.activitiService.getNewTaskList(taskVO);
	}
	
	
	/**
	 * 删除流程
	 * 
	 * @param taskVO
	 * @return
	 */
	public ModelMap delTask(TaskVO taskVO) {
		return this.activitiService.delTask(taskVO);
	}
	
	/**
	 * 删除流程定义
	 * 
	 * @param taskVO
	 * @return
	 */
	public ModelMap dropTask(TaskVO taskVO) {
		return this.activitiService.dropTask(taskVO);
	}
	
	
	/**
	 * 根据业务主键获取是否有任务
	 * 
	 * @param taskVO
	 * @return
	 */
	public boolean getTaskByBusinessKey(String businessKey) {
		return this.activitiService.getTaskByBusinessKey(businessKey);
	}

	/**
	 * 完成任务
	 * 
	 * @param taskVO
	 */
	public boolean completeTask(TaskVO taskVO) {
		return this.activitiService.completeTask(taskVO);
	}
	
	/**
	 * 根据业务key查询审核意见
	 * @param commentVO
	 * @return
	 */
	public List<CommentVO> queryCommentByBkey(CommentVO commentVO) {
		return activitiService.queryCommentByBkey(commentVO);
	}
}
