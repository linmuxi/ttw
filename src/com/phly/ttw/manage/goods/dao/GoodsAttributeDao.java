/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;

/**
 * 商品属性模块dao类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午4:51:46
 */
@Repository
public class GoodsAttributeDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询商品属性列表
	 * @param goodsAttributeVO
	 * @return
	 */
	public List<GoodsAttributeVO> queryGoodsAttributeList(GoodsAttributeVO goodsAttributeVO){
		return this.queryList("goodsAttribute.queryGoodsAttributeList", goodsAttributeVO,goodsAttributeVO.getPageNo(),goodsAttributeVO.getPageSize());
	}
	
	/**
	 * 查询商品属性列表不分页
	 * @param goodsAttributeVO
	 * @return
	 */
	public List<GoodsAttributeVO> queryGoodsAttributeListByGoodsTypeId(GoodsAttributeVO goodsAttributeVO){
		String goodsTypeId = goodsAttributeVO.getGoodsTypeId();
		List<GoodsAttributeVO> list = this.queryList("goodsAttribute.queryGoodsAttributeListByGoodsTypeId", goodsAttributeVO);
		
		List<GoodsAttributeVO> resultList = new ArrayList<GoodsAttributeVO>();
		List<GoodsAttributeVO> parentList = new ArrayList<GoodsAttributeVO>();
		
		//用于去重复
		Set<String> attrSet = new HashSet<String>();
		//循环筛选出不是继承父分类的属性
		for(GoodsAttributeVO vo : list){
			if(goodsTypeId.equals(vo.getGoodsTypeId())){
				vo.setbParentAttr(false);//不是继承父分类的属性
				resultList.add(vo);
				attrSet.add(vo.getGoodsAttributeName());
			}else{
				vo.setbParentAttr(true);//继承父分类的属性
				parentList.add(vo);
			}
		}
		//把继承的属性，判断属性名称是否重复，不重复则筛选出来
		for(GoodsAttributeVO parentVO : parentList){
			boolean existsFlag = attrSet.contains(parentVO.getGoodsAttributeName());
			if(!existsFlag){
				resultList.add(parentVO);
			}
		}
		return resultList;
	}
	
	
	/**
	 * 根据产品ID查询所有产品属性，包括选中的以及没有选的
	 * @param goodsAttributeVO
	 * @return
	 */
	public List<GoodsAttributeVO> queryAllGoodsAttributeListByGoodsId(GoodsAttributeVO goodsAttributeVO){
		String goodsTypeId = goodsAttributeVO.getGoodsTypeId();
		List<GoodsAttributeVO> list = this.queryList("goodsAttribute.queryAllGoodsAttributeListByGoodsId", goodsAttributeVO);
		
		List<GoodsAttributeVO> resultList = new ArrayList<GoodsAttributeVO>();
		List<GoodsAttributeVO> parentList = new ArrayList<GoodsAttributeVO>();
		
		//用于去重复
		Set<String> attrSet = new HashSet<String>();
		//循环筛选出不是继承父分类的属性
		for(GoodsAttributeVO vo : list){
			if(goodsTypeId.equals(vo.getGoodsTypeId())){
				vo.setbParentAttr(false);//不是继承父分类的属性
				resultList.add(vo);
				attrSet.add(vo.getGoodsAttributeName());
			}else{
				vo.setbParentAttr(true);//继承父分类的属性
				parentList.add(vo);
			}
		}
		//把继承的属性，判断属性名称是否重复，不重复则筛选出来
		for(GoodsAttributeVO parentVO : parentList){
			boolean existsFlag = attrSet.contains(parentVO.getGoodsAttributeName());
			if(!existsFlag){
				resultList.add(parentVO);
			}
		}
		return resultList;
	}
	
	/**
	 * 根据产品ID查询产品属性，只查询选中的属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public List<GoodsAttributeVO> queryGoodsAttributeListByGoodsId(GoodsAttributeVO goodsAttributeVO){
		return this.queryList("goodsAttribute.queryGoodsAttributeListByGoodsId", goodsAttributeVO);
	}
	
	
	
	/**
	 * 查询商品属性总数
	 * @param goodsAttributeVO
	 * @return
	 */
	public int getGoodsAttributeCount (GoodsAttributeVO goodsAttributeVO){
		return (Integer) this.getObject("goodsAttribute.getGoodsAttributeCount", goodsAttributeVO);
	}
	
	/**
	 * 查询商品属性总数
	 * @param goodsAttributeVO
	 * @return
	 */
	public GoodsAttributeVO getGoodsAttribute (GoodsAttributeVO goodsAttributeVO){
		return (GoodsAttributeVO)this.getObject("goodsAttribute.getGoodsAttribute", goodsAttributeVO);
	}
	
	
	/**
	 * 添加商品属性信息
	 * @param goodsAttributeVO
	 * @return
	 */
	public boolean addGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		boolean flag = false;
		try {
			this.insert("goodsAttribute.addGoodsAttribute",goodsAttributeVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加商品属性失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 添加商品属性值信息
	 * @param goodsAttributeVO
	 * @return
	 */
	public boolean addGoodsAttributeVal(GoodsAttributeVO goodsAttributeVO){
		boolean flag = false;
		try {
			this.insert("goodsAttribute.addGoodsAttributeVal",goodsAttributeVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加商品属性值失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public boolean updateGoodsAttribute(GoodsAttributeVO goodsAttributeVO) {
		boolean flag = false;
		try {
			this.update("goodsAttribute.updateGoodsAttribute",goodsAttributeVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品属性失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public boolean delGoodsAttribute(GoodsAttributeVO goodsAttributeVO) {
		boolean flag = false;
		try {
			this.delete("goodsAttribute.delGoodsAttribute",goodsAttributeVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除商品属性失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 根据商品ID删除商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public boolean delGoodsAttributeByGoodsId(GoodsAttributeVO goodsAttributeVO) {
		boolean flag = false;
		try {
			this.delete("goodsAttribute.delGoodsAttributeByGoodsId",goodsAttributeVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除商品属性失败,"+e);
		}
		return flag;
	}
	
	
	
}
