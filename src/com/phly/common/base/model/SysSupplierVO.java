/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.model;

import java.sql.Timestamp;

import org.directwebremoting.annotations.DataTransferObject;

/**
 *
 * @Description: TODO
 * @author Administrator
 * @since 2015年6月9日 下午7:03:08
 */
@DataTransferObject
public class SysSupplierVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	
	private String supplierId;
	private String supNo;
	private String contractCode;
	private String cmbPeopleName;
	private String supName;
	private String supEmail;
	private String supPhone;
	private String supFaxes;
	private String supAddress;
	private String busLicense;
	private String bankAccountName;
	private String bankAccountNo;
	private String bankAddress;
	private String linkPeopleName;
	private String linkPeoplePhone;
	private String linkPeopleQQ;
	private String linkPeopleEmail;
	private String linkPeopleAddress;
	private String headPeopleCardNo;
	private String headPeopleName;
	private String headPeoplePhone;
	private String headPeopleQQ;
	private String headPeopleEmail;
	private int supType;
	private String creator;
	private Timestamp createDate;
	private String lastUpdater;
	private Timestamp lastUpdateDate;
	private int isDel;
	private int isLocked;
	private int supState;
	private String remark;
	public String getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupNo() {
		return supNo;
	}
	public void setSupNo(String supNo) {
		this.supNo = supNo;
	}
	public String getContractCode() {
		return contractCode;
	}
	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	public String getCmbPeopleName() {
		return cmbPeopleName;
	}
	public void setCmbPeopleName(String cmbPeopleName) {
		this.cmbPeopleName = cmbPeopleName;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupEmail() {
		return supEmail;
	}
	public void setSupEmail(String supEmail) {
		this.supEmail = supEmail;
	}
	public String getSupPhone() {
		return supPhone;
	}
	public void setSupPhone(String supPhone) {
		this.supPhone = supPhone;
	}
	public String getSupFaxes() {
		return supFaxes;
	}
	public void setSupFaxes(String supFaxes) {
		this.supFaxes = supFaxes;
	}
	public String getSupAddress() {
		return supAddress;
	}
	public void setSupAddress(String supAddress) {
		this.supAddress = supAddress;
	}
	public String getBusLicense() {
		return busLicense;
	}
	public void setBusLicense(String busLicense) {
		this.busLicense = busLicense;
	}
	public String getBankAccountName() {
		return bankAccountName;
	}
	public void setBankAccountName(String bankAccountName) {
		this.bankAccountName = bankAccountName;
	}
	public String getBankAccountNo() {
		return bankAccountNo;
	}
	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}
	public String getBankAddress() {
		return bankAddress;
	}
	public void setBankAddress(String bankAddress) {
		this.bankAddress = bankAddress;
	}
	public String getLinkPeopleName() {
		return linkPeopleName;
	}
	public void setLinkPeopleName(String linkPeopleName) {
		this.linkPeopleName = linkPeopleName;
	}
	public String getLinkPeoplePhone() {
		return linkPeoplePhone;
	}
	public void setLinkPeoplePhone(String linkPeoplePhone) {
		this.linkPeoplePhone = linkPeoplePhone;
	}
	public String getLinkPeopleQQ() {
		return linkPeopleQQ;
	}
	public void setLinkPeopleQQ(String linkPeopleQQ) {
		this.linkPeopleQQ = linkPeopleQQ;
	}
	public String getLinkPeopleEmail() {
		return linkPeopleEmail;
	}
	public void setLinkPeopleEmail(String linkPeopleEmail) {
		this.linkPeopleEmail = linkPeopleEmail;
	}
	public String getLinkPeopleAddress() {
		return linkPeopleAddress;
	}
	public void setLinkPeopleAddress(String linkPeopleAddress) {
		this.linkPeopleAddress = linkPeopleAddress;
	}
	public String getHeadPeopleCardNo() {
		return headPeopleCardNo;
	}
	public void setHeadPeopleCardNo(String headPeopleCardNo) {
		this.headPeopleCardNo = headPeopleCardNo;
	}
	public String getHeadPeopleName() {
		return headPeopleName;
	}
	public void setHeadPeopleName(String headPeopleName) {
		this.headPeopleName = headPeopleName;
	}
	public String getHeadPeoplePhone() {
		return headPeoplePhone;
	}
	public void setHeadPeoplePhone(String headPeoplePhone) {
		this.headPeoplePhone = headPeoplePhone;
	}
	public String getHeadPeopleQQ() {
		return headPeopleQQ;
	}
	public void setHeadPeopleQQ(String headPeopleQQ) {
		this.headPeopleQQ = headPeopleQQ;
	}
	public String getHeadPeopleEmail() {
		return headPeopleEmail;
	}
	public void setHeadPeopleEmail(String headPeopleEmail) {
		this.headPeopleEmail = headPeopleEmail;
	}
	public int getSupType() {
		return supType;
	}
	public void setSupType(int supType) {
		this.supType = supType;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getLastUpdater() {
		return lastUpdater;
	}
	public void setLastUpdater(String lastUpdater) {
		this.lastUpdater = lastUpdater;
	}
	public Timestamp getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Timestamp lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	
	public int getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}
	public int getSupState() {
		return supState;
	}
	public void setSupState(int supState) {
		this.supState = supState;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}
