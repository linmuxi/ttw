package com.phly.common.base.model;

import java.sql.Timestamp;

import org.directwebremoting.annotations.DataTransferObject;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月29日 上午11:40:04
 */
@DataTransferObject
public class SysDepartmentVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String departmentId;

	private String orgName;

	private String orgRemark;
	
	private int isDel;

	private Timestamp createDate;

	private String creator;

	private Timestamp lastUpdateDate;

	private String lastUpdater;
	
	/**
	 * 父部门ID
	 */
	private String parentId;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getOrgRemark() {
		return orgRemark;
	}

	public void setOrgRemark(String orgRemark) {
		this.orgRemark = orgRemark;
	}
	

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Timestamp getLastUpdateDate() {
		return lastUpdateDate;
	}

	public void setLastUpdateDate(Timestamp lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

	public String getLastUpdater() {
		return lastUpdater;
	}

	public void setLastUpdater(String lastUpdater) {
		this.lastUpdater = lastUpdater;
	}
	
	
}
