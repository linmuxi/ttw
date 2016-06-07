/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.goods.model.GoodsVO;

/**
 * 商品dao类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月13日 下午4:51:46
 */
@Repository
public class GoodsDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询商品信息
	 * @param GoodsVO
	 * @return
	 */
	public List<GoodsVO> queryGoodsList(GoodsVO goodsVO){
		return this.queryList("goods.queryGoodsList", goodsVO,goodsVO.getPageNo(),goodsVO.getPageSize());
	}
	
	/**
	 * 查询当前商品的商品编号
	 * @param prefix
	 * @return
	 */
	public String queryGoodsSerialNumber(String prefix){
		return (String)this.getObject("goods.queryGoodsSerialNumber", prefix);
	}
	
	
	/**
	 * 查询商品总数
	 * @param goodsVO
	 * @return
	 */
	public int getGoodsCount (GoodsVO goodsVO){
		return (Integer) this.getObject("goods.getGoodsCount", goodsVO);
	}
	
	/**
	 * 根据商品信息查询某分类下的推荐产品
	 * @param GoodsVO
	 * @return
	 */
	public List<GoodsVO> queryGoodsListByRecommendedAndCategoryId(GoodsVO goodsVO){
		return this.queryList("goods.queryGoodsListByRecommendedAndCategoryId", goodsVO, 1, 5);
	}
	
	/**
	 * 根据ID或者名称查询商品信息
	 * @param goodsVO
	 * @return
	 */
	public GoodsVO getGoods(GoodsVO goodsVO){
		return (GoodsVO) this.getObject("goods.getGoods", goodsVO);
	}
	
	
	/**
	 * 添加商品信息
	 * @param goodsVO
	 * @return
	 */
	public boolean addGoods(GoodsVO goodsVO){
		boolean flag = false;
		try {
			this.insert("goods.addGoods",goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加商品信息失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改商品信息
	 * @param goodsVO
	 * @return
	 */
	public boolean updateGoods(GoodsVO goodsVO) {
		boolean flag = false;
		try {
			this.update("goods.updateGoods", goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品信息失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 修改商品价格
	 * @param goodsVO
	 * @return
	 */
	public boolean updateGoodsPrice(GoodsVO goodsVO) {
		boolean flag = false;
		try {
			this.update("goods.updateGoodsPrice", goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品价格失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 修改商品审核状态
	 * @param goodsVO
	 * @return
	 */
	public boolean updateGoodsApproval(GoodsVO goodsVO) {
		boolean flag = false;
		try {
			this.update("goods.updateGoodsApproval", goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品审核状态失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 修改商品上架状态
	 * @param goodsVO
	 * @return
	 */
	public boolean updateSpecificationsOpen(GoodsVO goodsVO) {
		boolean flag = false;
		try {
			this.update("goods.updateSpecificationsOpen", goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改商品上架状态失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除商品
	 * @param goodsVO
	 * @return
	 */
	public boolean delGoods(GoodsVO goodsVO) {
		boolean flag = false;
		try {
			this.delete("goods.delGoods",goodsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除商品失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 根据分类id查询商品总数
	 * @param goodsVO
	 * @return
	 */
	public int getGoodsCountByCategoryId (GoodsVO goodsVO){
		return (Integer) this.getObject("goods.getGoodsCountByCategoryId", goodsVO);
	}
	
	
	/**
	 * 根据产品分类id查询产品列表
	 * @param goodsVO
	 * @return
	 */
	public List<GoodsVO> queryGoodsByCategoryId(GoodsVO goodsVO) {
		return this.queryList("goods.queryGoodsByCategoryId", goodsVO, goodsVO.getPageNo(), goodsVO.getPageSize());
	}
	
	/**
	 * 根据产品分类id查询热门产品
	 * @param goodsVO
	 * @return
	 */
	public List<GoodsVO> queryHotGoodsByCategoryId(GoodsVO goodsVO) {
		return this.queryList("goods.queryHotGoodsByCategoryId", goodsVO);
	}
}
