/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.cart.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.portal.cart.model.CartVO;

/**
 * 购物车dao类
 * 
 */
@Repository
public class CartDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询购物车
	 * 
	 * @param request
	 * @param cart
	 * @return
	 */
	public List<CartVO> queryAllCart(CartVO cart) {
		return this.queryList("cart.queryAllCart", cart, cart.getPageNo(), cart.getPageSize());
	}

	/**
	 * 添加购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public boolean insertCart(CartVO cart) {
		boolean flag = false;
		try {
			this.insert("cart.insertCart", cart);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加商品到购物车失败," + e);
		}
		return flag;
	}

	/**
	 * 查询购物车是否存在该商品
	 * 
	 * @param cart
	 * @return
	 */
	public int queryCartOneGoods(CartVO cart) {
		List<CartVO> cartLst = this.queryList("cart.queryCartOneGoods", cart, cart.getPageNo(), cart.getPageSize());
		return null != cartLst && cartLst.size() > 0 ? cartLst.size() : 0;
	}

	/**
	 * 修改购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public boolean updateCart(CartVO cart) {
		boolean flag = false;
		try {
			this.update("updateCart", cart);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("商品添加到购物车失败," + e);
		}
		return flag;
	}

	/**
	 * 删除购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public boolean delCart(CartVO cart) {
		boolean flag = false;
		try {
			this.update("cart.delCart", cart);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除用户失败," + e);
		}
		return flag;
	}

	/**
	 * 查询指定商品在购物车中的数量
	 * 
	 * @param cart
	 * @return
	 */
	public int getCartCountByGoods(CartVO cart) {
		return (Integer) this.getObject("cart.getCartCountByGoods", cart);
	}

	/**
	 * 购物车中所有商品数
	 * 
	 * @param cart
	 * @return
	 */
	public int getCartProductCount(CartVO cart) {
		return (Integer) this.getObject("cart.getCartProductCount", cart);
	}
}
