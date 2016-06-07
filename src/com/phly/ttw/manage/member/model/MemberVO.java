/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.member.model;

import java.util.Date;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;
import com.phly.common.base.model.SysUserVO;

/**
 * 会员
 * 
 * @author TH
 */
@DataTransferObject
public class MemberVO extends BaseVO {
	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String account;
	private Date birth;
	private int gender;
	private String mobile;
	private String email;
	private String zipCode;
	private String area;
	private String address;
	private String sex;
	private String pwd;
	private String surePwd;
	private String userId;
	private boolean enabled;
	private SysUserVO user;
	private String rankName; // 会员等级
	private Date lastLoginDate; // 最后登录时间
	
	private String qq_code;
	
	private String msn_code;
	
	private String home_phone;
	
	private String office_phone;
	
	private String strBirth;
	
	private String emailStatus = "0"; //0:已失效 1：未失效
	
	private Date vaildTimeEmail;//邮箱邮箱激活时间
	
	private String urlImg;//图像URL
	
	public String getUrlImg() {
		return urlImg;
	}

	public void setUrlImg(String urlImg) {
		this.urlImg = urlImg;
	}
	
	public Date getVaildTimeEmail() {
		return vaildTimeEmail;
	}

	public void setVaildTimeEmail(Date vaildTimeEmail) {
		this.vaildTimeEmail = vaildTimeEmail;
	}

	

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	public String getStrBirth() {
		return strBirth;
	}

	public void setStrBirth(String strBirth) {
		this.strBirth = strBirth;
	}

	public String getQq_code() {
		return qq_code;
	}

	public void setQq_code(String qq_code) {
		this.qq_code = qq_code;
	}

	public String getMsn_code() {
		return msn_code;
	}

	public void setMsn_code(String msn_code) {
		this.msn_code = msn_code;
	}

	public String getHome_phone() {
		return home_phone;
	}

	public void setHome_phone(String home_phone) {
		this.home_phone = home_phone;
	}

	public String getOffice_phone() {
		return office_phone;
	}

	public void setOffice_phone(String office_phone) {
		this.office_phone = office_phone;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public SysUserVO getUser() {
		return user;
	}

	public void setUser(SysUserVO user) {
		this.user = user;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getSurePwd() {
		return surePwd;
	}

	public void setSurePwd(String surePwd) {
		this.surePwd = surePwd;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	/**
	 * @param account
	 */
	public MemberVO(String account) {
		super();
		this.account = account;
	}

	/**
	 * 
	 */
	public MemberVO() {
		super();
	}

}
