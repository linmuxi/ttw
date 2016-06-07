/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.cart.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.portal.cart.dao.CartDao;
import com.phly.ttw.portal.cart.model.CartVO;

/**
 * 购物车服务类
 * 
 */
@Service
public class CartService extends ServiceBase {

	//private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private CartDao cartDao;
	
	/**
	 * 查询购物车
	 * @param request
	 * @param cart
	 * @return
	 */
	public List<CartVO> queryAllCart(CartVO cart){
		return this.cartDao.queryAllCart(cart);
	}
	
	/**
	 * 添加购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap insertCart(CartVO cart){
		ModelMap model = new ModelMap();
		int cartGoodsCount = this.cartDao.getCartCountByGoods(cart);
		if(cartGoodsCount > 0){
			model.put("result", this.cartDao.updateCart(cart));
		}else{
			model.put("result", this.cartDao.insertCart(cart));
		}
		return model;
	}
	
	/**
	 * 修改购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap updateCart(CartVO cart){
		ModelMap model = new ModelMap();
		model.put("result", this.cartDao.updateCart(cart));
		return model;
	}
	
	/**
	 * 删除购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap delCart(CartVO cart){
		ModelMap model = new ModelMap();
		model.put("result", this.cartDao.delCart(cart));
		return model;
	}
	
	/**
	 * 购物车中所有商品数
	 * @param cart
	 * @return
	 */
	public int getCartProductCount(CartVO cart){
		return this.cartDao.getCartProductCount(cart);
	}
}
