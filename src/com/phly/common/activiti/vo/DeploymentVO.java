/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.vo;

import java.io.InputStream;
import java.util.Date;

import org.activiti.engine.ProcessEngineConfiguration;
import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 流程部署VO对象
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:35:20
 */
@DataTransferObject
public class DeploymentVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	// 部署id
	protected String id;
	// 部署name
	protected String name;
	// 部署类别
	protected String category;
	// 部署人
	protected String tenantId = ProcessEngineConfiguration.NO_TENANT_ID;
	// 部署时间
	protected Date deploymentTime;
	// 流程文件输入流
	private InputStream resource;
	// 流程文件名称
	private String resourceName;

	public String getResourceName() {
		return resourceName;
	}

	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public Date getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(Date deploymentTime) {
		this.deploymentTime = deploymentTime;
	}

	public InputStream getResource() {
		return resource;
	}

	public void setResource(InputStream resource) {
		this.resource = resource;
	}
}
