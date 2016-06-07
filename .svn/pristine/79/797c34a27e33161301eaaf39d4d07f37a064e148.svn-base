/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.cart.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.portal.cart.model.CartVO;
import com.phly.ttw.portal.cart.service.CartService;

/**
 * 购物车
 * 
 */
@Component
public class CartFacade extends ServiceBase {
	
	@Resource
	private CartService cartService;
	
	/**
	 * 查询购物车
	 * @param request
	 * @param cart
	 * @return
	 */
	public List<CartVO> queryAllCart(CartVO cart){
		return this.cartService.queryAllCart(cart);
	}
	
	/**
	 * 添加购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap insertCart(CartVO cart){
		return this.cartService.insertCart(cart);
	}
	
	/**
	 * 修改购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap updateCart(CartVO cart){
		return this.cartService.updateCart(cart);
	}
	
	/**
	 * 删除购物车
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	public ModelMap delCart(CartVO cart){
		return this.cartService.delCart(cart);
	}

	public int getCartProductCount(CartVO cart){
		return this.cartService.getCartProductCount(cart);
	}
}
