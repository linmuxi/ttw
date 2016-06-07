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
 * 商品分类模块VO实体对象
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:35:20
 */
@DataTransferObject
public class GoodsCategoryVO extends BaseVO {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	//分类ID
	private String id;
	//分类等级
	private String grade;
	//搜索关键字
	private String metaKeywords;
	//搜索描述
	private String metaDes;
	//名称
	private String name;
	//分类编码
	private String categoryCode;
	//状态
	private String state;
	//路径（A-a-a1）一级类型ID,二级类型ID,三级类型ID
	private String path;
	//排序
	private int sort;
	//标志(名称拼音缩写)
	private String  sign;
	//商品类型ID
	private String goodsTypeId;
	//分类父ID
	private String parentId;
	//分类父名称
	private String parentCategoryName;
	//分类父URL链接
	private String parentCategoryUrl;
	//图标
	private String logo;
	//是否可用 
	private int enabled;
	//推荐
	private String recommended;
	//首页滚动
	private String scroll;
	private String pcurl;
	
	//更多父分类
	private String moreParentCategory;
	
	/***
	 * 更多父分类
	 */
	private List<CategoryRpVO> moreParentCategoryList;
	
	/**
	 * 子分类
	 */
	private List<GoodsCategoryVO> childGoodsCategoryList;
	/**
	 * 父分类 
	 */
	private GoodsCategoryVO parentGoodsCategory;

	private double price;
	// more链接地址
	private String url;
	//当前产品类别是否有子类别
	private int isHaveChild;
	
	//产品类别图片跳转路径
	private String picHref;

	public String getPicHref() {
		return picHref;
	}

	public void setPicHref(String picHref) {
		this.picHref = picHref;
	}

	public int getIsHaveChild() {
		return isHaveChild;
	}

	public void setIsHaveChild(int isHaveChild) {
		this.isHaveChild = isHaveChild;
	}

	public String getParentCategoryUrl() {
		return parentCategoryUrl;
	}

	public void setParentCategoryUrl(String parentCategoryUrl) {
		this.parentCategoryUrl = parentCategoryUrl;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPcurl() {
		return pcurl;
	}

	public void setPcurl(String pcurl) {
		this.pcurl = pcurl;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getMetaKeywords() {
		return metaKeywords;
	}



	public void setMetaKeywords(String metaKeywords) {
		this.metaKeywords = metaKeywords;
	}



	public String getMetaDes() {
		return metaDes;
	}



	public void setMetaDes(String metaDes) {
		this.metaDes = metaDes;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getState() {
		return state;
	}



	public void setState(String state) {
		this.state = state;
	}



	public String getPath() {
		return path;
	}



	public void setPath(String path) {
		this.path = path;
	}



	public int getSort() {
		return sort;
	}



	public void setSort(int sort) {
		this.sort = sort;
	}



	public String getSign() {
		return sign;
	}



	public void setSign(String sign) {
		this.sign = sign;
	}



	public String getGoodsTypeId() {
		return goodsTypeId;
	}



	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}



	public String getParentId() {
		return parentId;
	}



	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	
	public String getParentCategoryName() {
		return parentCategoryName;
	}

	public void setParentCategoryName(String parentCategoryName) {
		this.parentCategoryName = parentCategoryName;
	}

	public int getEnabled() {
		return enabled;
	}
	
	
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	

	
	public String getRecommended() {
		return recommended;
	}

	public void setRecommended(String recommended) {
		this.recommended = recommended;
	}

	public String getScroll() {
		return scroll;
	}

	public void setScroll(String scroll) {
		this.scroll = scroll;
	}

	public String getLogo() {
		return logo;
	}

	
	public void setLogo(String logo) {
		this.logo = logo;
	}


	public List<GoodsCategoryVO> getChildGoodsCategoryList() {
		return childGoodsCategoryList;
	}



	public void setChildGoodsCategoryList(
			List<GoodsCategoryVO> childGoodsCategoryList) {
		this.childGoodsCategoryList = childGoodsCategoryList;
	}



	public GoodsCategoryVO getParentGoodsCategory() {
		return parentGoodsCategory;
	}



	public void setParentGoodsCategory(GoodsCategoryVO parentGoodsCategory) {
		this.parentGoodsCategory = parentGoodsCategory;
	}



	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

	public String getMoreParentCategory() {
		return moreParentCategory;
	}

	public void setMoreParentCategory(String moreParentCategory) {
		this.moreParentCategory = moreParentCategory;
	}

	public List<CategoryRpVO> getMoreParentCategoryList() {
		return moreParentCategoryList;
	}

	public void setMoreParentCategoryList(List<CategoryRpVO> moreParentCategoryList) {
		this.moreParentCategoryList = moreParentCategoryList;
	}
	
	
}
