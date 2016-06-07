/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.model;

import java.math.BigDecimal;

import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;
import com.phly.ttw.manage.member.model.MemberVO;

/**
 * 订单
 * 
 * @author LGP
 */
@DataTransferObject
public class OrderVO extends BaseVO {

	/**
	 * @Fields serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String orderSn;
	private MemberVO memberVO;
	private int isInvoice;
	private String invoiceTitle;
	private String memo;
	private int orderStatus; // 0-未确认、1-待核实、2-待制作、3-制作中、4-待验收、5-已验收，待传源码、6-已传源码，待支付尾款、7-已完成
	private String paymentMethodName;
	private int paymentStatus;
	private PaymentMethodVO paymentMethodVO;
	private String mobile;

	private BigDecimal amount; // 总金额
	private Integer num; // 总笔数
	private String memberName; // 会员名称
	private String rankName; // 会员等级
	private String goodsName;
	private String supName; // 供应商名称

	/************ 查询条件 **************/
	private String[] inOrderStatus;
	private String[] inPaymentStatus;
	private String supplier; // 供应商

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public int getIsInvoice() {
		return isInvoice;
	}

	public void setIsInvoice(int isInvoice) {
		this.isInvoice = isInvoice;
	}

	public String getInvoiceTitle() {
		return invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getPaymentMethodName() {
		return paymentMethodName;
	}

	public void setPaymentMethodName(String paymentMethodName) {
		this.paymentMethodName = paymentMethodName;
	}

	public int getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public PaymentMethodVO getPaymentMethodVO() {
		return paymentMethodVO;
	}

	public void setPaymentMethodVO(PaymentMethodVO paymentMethodVO) {
		this.paymentMethodVO = paymentMethodVO;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String[] getInOrderStatus() {
		return inOrderStatus;
	}

	public void setInOrderStatus(String[] inOrderStatus) {
		this.inOrderStatus = inOrderStatus;
	}

	public String[] getInPaymentStatus() {
		return inPaymentStatus;
	}

	public void setInPaymentStatus(String[] inPaymentStatus) {
		this.inPaymentStatus = inPaymentStatus;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	@Override
	public void setCreator(String creator) {
		super.creator = creator;
	}

	@Override
	public String getCreator() {
		return super.creator;
	}

	public String getSupName() {
		return supName;
	}

	public void setSupName(String supName) {
		this.supName = supName;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

}
