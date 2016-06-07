/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.vo;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 审批记录VO对象
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:35:20
 */
@DataTransferObject
public class CommentVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String type;
	private String time;
	private String taskId;
	private String procInstId;
	private String message;
	private String action;
	private String businessKey;
	
	public String getBusinessKey() {
		return businessKey;
	}
	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTaskId() {
		return taskId;
	}
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	public String getProcInstId() {
		return procInstId;
	}
	public void setProcInstId(String procInstId) {
		this.procInstId = procInstId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	@Override
	public String toString() {
		return "CommentVO [id=" + id + ", type=" + type + ", time=" + time
				+ ", taskId=" + taskId + ", procInstId=" + procInstId
				+ ", message=" + message + ", action=" + action + "]";
	}
}
