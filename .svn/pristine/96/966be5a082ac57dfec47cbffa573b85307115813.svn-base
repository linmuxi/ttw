/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.supplier.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.action.BaseAction;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;
import com.phly.ttw.manage.order.facade.OrderFacade;
import com.phly.ttw.manage.order.model.OrderVO;

/**
 * 订单Action类(供应商使用)
 * 
 * @author LGP
 */
@Controller
@RemoteProxy
public class SupplierOrderAction extends BaseAction {

	@Resource
	private OrderFacade orderFacade;

	/**
	 * 查询订单列表
	 * 
	 * @param orderVO
	 * @return 订单集合
	 */
	@ExceptionMessage("查询订单列表失败，请联系管理员")
	@RequestMapping("/page/ttw/manage/supplier/order")
	@ResponseBody
	public ModelMap queryOrderList(HttpServletRequest request, OrderVO orderVO) {
		String method = request.getParameter("m");
		String[] orders = null;
		if (method.equals("finish")) {
			orders = new String[1];
			orders[0] = "7";
		}
		if (method.equals("unfinish")) {
			orders = new String[5];
			orders[0] = "2";
			orders[1] = "3";
			orders[2] = "4";
			orders[3] = "5";
			orders[4] = "6";
		}
		if (method.equals("all")) {
			orders = new String[6];
			orders[0] = "2";
			orders[1] = "3";
			orders[2] = "4";
			orders[3] = "5";
			orders[4] = "6";
			orders[4] = "7";
		}
		orderVO.setInOrderStatus(orders);
		return this.orderFacade.queryOrderList(orderVO);
	}
}
