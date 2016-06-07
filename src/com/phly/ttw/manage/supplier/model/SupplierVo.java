package com.phly.ttw.manage.supplier.model;



import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/***
 * 供应商
 * @author TH
 */
@DataTransferObject
public class SupplierVo extends BaseVO {

	/**
	 * 
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
	private String userId;//登陆用户ID
	private int supType = 1;//'供应商类型（0：个人 1：公司）'
	private int isDel = 1;//'是否删除（0：已删除 1：未删除）'
	private int isLocked = 1;//'是否锁定（0：已锁定 1：未锁定）'
	private int supState = 0;//'状态（0：合作，1：中止）'
	//审批状态
	private int approvalState;
	private String remark;
	
	
	public int getApprovalState() {
		return approvalState;
	}

	public void setApprovalState(int approvalState) {
		this.approvalState = approvalState;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public SupplierVo(String supplierId) {
		this.supplierId = supplierId;
	}
	
	public SupplierVo() {
	}

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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getIsDel() {
		return isDel;
	}
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	public int getSupState() {
		return supState;
	}
	public void setSupState(int supState) {
		this.supState = supState;
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
	public int getIsLocked() {
		return isLocked;
	}
	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}
	
}
