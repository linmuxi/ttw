/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;
import com.phly.common.base.model.SysUserVO;

/**
 * 我的任务VO对象
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:35:20
 */
@DataTransferObject
public class TaskVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	private SysUserVO user;

	// 任务id
	private String id;
	// 任务名称
	private String name;
	// 任务优先级
	private int priority;
	// 任务创建时间
	private Date createTime;
	// 任务过期时间
	private Date dueDate;
	// 任务描述
	private String description;
	// 业务key
	private String businessKey;
	//流程实例id
	private String processInstanceId;
	// 流程定义id
	private String processDefinitionId;
	// 流程定义name
	private String processDefinitionName;
	// 业务表单uri
	private String formKey;
	// 业务表单主键
	private String businessId;
	//流程变量
	private Map<String,String> vars;
	private String account;
	private List<String> groups;

	/*
	 * private TaskEntity task;
	 * 
	 * public TaskEntity getTask() { return task; }
	 * 
	 * public void setTask(TaskEntity task) { this.task = task; }
	 */

	public List<String> getGroups() {
		return groups;
	}

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}

	public void setGroups(List<String> groups) {
		this.groups = groups;
	}
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getProcessDefinitionName() {
		return processDefinitionName;
	}

	public Map<String, String> getVars() {
		return vars;
	}

	public void setVars(Map<String, String> vars) {
		this.vars = vars;
	}
	

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

	public String getFormKey() {
		return formKey;
	}

	public void setFormKey(String formKey) {
		this.formKey = formKey;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}

	public void setProcessDefinitionName(String processDefinitionName) {
		this.processDefinitionName = processDefinitionName;
	}

	public SysUserVO getUser() {
		return user;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setUser(SysUserVO user) {
		this.user = user;
	}
}
