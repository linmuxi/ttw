/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.model;

import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 商品VO实体对象
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月12日 下午11:35:20
 */
@DataTransferObject
public class GoodsVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	// 商品ID
	private String id;
	// 商品编号
	private String serialNumber;
	// 商品名称
	private String goodsName;
	// 品牌ID
	private String brandId;
	// 品牌名称
	private String brandName;
	// 分类ID
	private String goodsCategoryId;
	// 分类名称
	private String goodsCategoryName;
	// 成本价格
	private Double cost;
	// 销售价格
	private Double price;
	// 会员价
	private Double memberPrice;
	// 照片URL
	private String pictureUrl;
	// 数量
	private Integer quantity;
	// 销售状态
	private String salestate;
	// 审批状态
	private int approvalState;
	// 单位名称
	private String unitName;
	// 关键字
	private String keywordName;
	// 商品介绍
	private String intro;
	// 排序
	private Integer sort;
	// 是否新品
	private String isNew;
	// 热销产品
	private String hotsSale;
	// 推荐
	private String recommended;
	// 静态页面地址
	private String htmlPath;
	// 是否上架
	private String isSpecificationsOpen;
	// 是否删除
	private int isDel;

	// 图片附件
	private String pcurl;

	// 产品属性值（添加、修改是用于传输 产品属性数据）
	private String goodsAttrsVals;

	// 属性ID（商品分类根据商品属性查询用）
	private List<String[]> categoryAttrList;

	public List<String[]> getCategoryAttrList() {
		return categoryAttrList;
	}

	public void setCategoryAttrList(List<String[]> categoryAttrList) {
		this.categoryAttrList = categoryAttrList;
	}

	// 工作流：业务表单服务类,全路径
	protected String actFormService;

	// 工作流：业务表单页面URI
	protected String actFormPage;

	private String supname; // 供应商名称

	public String getActFormService() {
		return actFormService;
	}

	public void setActFormService(String actFormService) {
		this.actFormService = actFormService;
	}

	public String getActFormPage() {
		return actFormPage;
	}

	public void setActFormPage(String actFormPage) {
		this.actFormPage = actFormPage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getGoodsCategoryId() {
		return goodsCategoryId;
	}

	public void setGoodsCategoryId(String goodsCategoryId) {
		this.goodsCategoryId = goodsCategoryId;
	}

	public String getGoodsCategoryName() {
		return goodsCategoryName;
	}

	public void setGoodsCategoryName(String goodsCategoryName) {
		this.goodsCategoryName = goodsCategoryName;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getMemberPrice() {
		return memberPrice;
	}

	public void setMemberPrice(Double memberPrice) {
		this.memberPrice = memberPrice;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getSalestate() {
		return salestate;
	}

	public void setSalestate(String salestate) {
		this.salestate = salestate;
	}

	public int getApprovalState() {
		return approvalState;
	}

	public void setApprovalState(int approvalState) {
		this.approvalState = approvalState;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getKeywordName() {
		return keywordName;
	}

	public void setKeywordName(String keywordName) {
		this.keywordName = keywordName;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getIsNew() {
		return isNew;
	}

	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}

	public String getHotsSale() {
		return hotsSale;
	}

	public void setHotsSale(String hotsSale) {
		this.hotsSale = hotsSale;
	}

	public String getRecommended() {
		return recommended;
	}

	public void setRecommended(String recommended) {
		this.recommended = recommended;
	}

	public String getHtmlPath() {
		return htmlPath;
	}

	public void setHtmlPath(String htmlPath) {
		this.htmlPath = htmlPath;
	}

	public String getIsSpecificationsOpen() {
		return isSpecificationsOpen;
	}

	public void setIsSpecificationsOpen(String isSpecificationsOpen) {
		this.isSpecificationsOpen = isSpecificationsOpen;
	}

	public int getIsDel() {
		return isDel;
	}

	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}

	public String getPcurl() {
		return pcurl;
	}

	public void setPcurl(String pcurl) {
		this.pcurl = pcurl;
	}

	public String getGoodsAttrsVals() {
		return goodsAttrsVals;
	}

	public void setGoodsAttrsVals(String goodsAttrsVals) {
		this.goodsAttrsVals = goodsAttrsVals;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getSupname() {
		return supname;
	}

	public void setSupname(String supname) {
		this.supname = supname;
	}

}
