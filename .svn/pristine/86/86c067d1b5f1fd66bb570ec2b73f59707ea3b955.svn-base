/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.cart.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.member.facade.MemberFacade;
import com.phly.ttw.manage.member.model.MemberVO;
import com.phly.ttw.portal.cart.facade.CartFacade;
import com.phly.ttw.portal.cart.model.CartVO;

/**
 * 购物车
 * 
 */
@Controller
@RequestMapping("/page/ttw/frontbg")
public class CartAction extends ServiceBase {

	@Resource
	private CartFacade cartFacade;
	@Resource
	private MemberFacade memberFacade;

	@RequestMapping("/cart")
	public ModelAndView list(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		CartVO cart = new CartVO();
		List<CartVO> list = this.cartFacade.queryAllCart(cart);
		mav.addObject("carts", list);
		// mav.setViewName("/page/ttw/portal/html/NewPro/Submit.jsp");
		mav.setViewName("/page/ttw/frontbg/member/cart_list.jsp");
		return mav;
	}

	/**
	 * 查询购物车
	 * 
	 * @param request
	 * @param cart
	 * @return
	 */
	@RequestMapping("/cart/queryAllCart")
	@ResponseBody
	public List<CartVO> queryAllCart(CartVO cart) {
		return this.cartFacade.queryAllCart(cart);
	}

	/**
	 * 添加购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	@RequestMapping("/cart/insertCart")
	@ResponseBody
	public ModelAndView insertCart(HttpServletRequest request, CartVO cart) {
		ModelAndView mav = new ModelAndView();
		SysUserVO sysUserVO = new SysUserVO();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		sysUserVO.setUserId(userId);
		// 会员信息
		MemberVO memberVO = memberFacade.getMember(sysUserVO);
		cart.setMemberId(memberVO.getId());
		this.cartFacade.insertCart(cart);
		mav.setViewName("redirect:/page/ttw/frontbg/product/cartSuccess");
		return mav;
	}

	/**
	 * 修改购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	@RequestMapping("/cart/updateCart")
	@ResponseBody
	public ModelMap updateCart(CartVO cart) {
		return this.cartFacade.updateCart(cart);
	}

	/**
	 * 删除购物车
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	@RequestMapping("/cart/delCart")
	@ResponseBody
	public ModelAndView delCart(HttpServletRequest request, CartVO cart) {
		this.cartFacade.delCart(cart);
		return list(request);
	}

	/**
	 * 获取购物车中商品总数
	 * 
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	@RequestMapping("/cart/getCartProductCount")
	@ResponseBody
	public int getCartProductCount(HttpServletRequest request) {
		CartVO cart = new CartVO();
		MemberVO member = (MemberVO) request.getSession().getAttribute("memberInfo");
		if (member == null) {
			return 0;
		}
		cart.setMemberId(member.getId());
		return this.cartFacade.getCartProductCount(cart);
	}

	@RequestMapping("/product/cartSuccess")
	public ModelAndView cartSuccess(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/page/ttw/front/cart_success.jsp");
		return mav;
	}
}
