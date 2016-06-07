/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.model;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.directwebremoting.annotations.DataTransferObject;

import com.phly.common.base.model.BaseVO;

/**
 * 商品属性VO实体对象
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月12日 下午11:35:20
 */
@DataTransferObject
public class GoodsAttributeVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	//商品属性ID
	private String id;
	//产品ID
	private String goodsId;
	//属性名称
	private String goodsAttributeName;
	//商品类别ID
	private String goodsTypeId;
	//商品类别名称
	private String goodsTypeName;
	//属性状态
	private String state;
	//属性集合
	private String attributeList;
	//属性值
	private String attrVal;
	//排序
	private int sort;
	//是否搜索
	private String isSearch;
	
	//是否集成父分类的属性
	private boolean bParentAttr;

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getGoodsId() {
		return goodsId;
	}



	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}



	public String getGoodsAttributeName() {
		return goodsAttributeName;
	}



	public void setGoodsAttributeName(String goodsAttributeName) {
		this.goodsAttributeName = goodsAttributeName;
	}



	public String getGoodsTypeId() {
		return goodsTypeId;
	}



	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}



	public String getGoodsTypeName() {
		return goodsTypeName;
	}



	public void setGoodsTypeName(String goodsTypeName) {
		this.goodsTypeName = goodsTypeName;
	}



	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getAttributeList() {
		return attributeList;
	}



	public void setAttributeList(String attributeList) {
		this.attributeList = attributeList;
	}



	public String getAttrVal() {
		return attrVal;
	}



	public void setAttrVal(String attrVal) {
		this.attrVal = attrVal;
	}



	public int getSort() {
		return sort;
	}



	public void setSort(int sort) {
		this.sort = sort;
	}



	public String getIsSearch() {
		return isSearch;
	}



	public void setIsSearch(String isSearch) {
		this.isSearch = isSearch;
	}
	

	public boolean isbParentAttr() {
		return bParentAttr;
	}



	public void setbParentAttr(boolean bParentAttr) {
		this.bParentAttr = bParentAttr;
	}



	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}
}
