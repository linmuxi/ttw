/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.model;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 订单审批
 * 
 * @author LGP
 */
@DataTransferObject
public class OrderAuditsVO extends BaseVO {

	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private OrderVO orderVO;
	private String content;
	private String username;
	private int orderStatus; // 0-未确认、1-待核实、2-待制作、3-制作中、4-待验收、5-已验收，待传源码、6-已传源码，待支付尾款、7-已完成

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

}
