/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.vo;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 工作流测试-假期申请VO
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:35:20
 */
@DataTransferObject
public class VacationRequestVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String person;
	private String reason;
	private int days;
	private int status;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getDays() {
		return days;
	}

	public void setDays(int days) {
		this.days = days;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
