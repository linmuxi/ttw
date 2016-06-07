/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.order.model.OrderAuditsVO;
import com.phly.ttw.manage.order.model.OrderVO;
import com.phly.ttw.manage.order.service.OrderAuditsService;
import com.phly.ttw.manage.order.service.OrderService;

/**
 * 订单代理类
 * 
 * @author LGP
 */
@Component
public class OrderFacade {

	@Resource
	private OrderService orderService;
	@Resource
	private OrderAuditsService orderAuditsService;

	/**
	 * 查询订单列表
	 * 
	 * @param orderVO
	 * @return 订单集合
	 */
	public ModelMap queryOrderList(OrderVO orderVO) {
		return this.orderService.queryOrderList(orderVO);
	}

	public OrderVO getOrder(OrderVO orderVO) {
		return orderService.getOrder(orderVO);
	}

	public OrderAuditsVO getOrderAudits(OrderVO orderVO) {
		return orderAuditsService.getOrderAudits(orderVO);
	}

	public List<OrderAuditsVO> queryOrderAuditsList(String userid, OrderVO orderVO) {
		return orderAuditsService.queryOrderAuditsList(userid, orderVO);
	}

	public boolean saveOrderAudits(OrderVO orderVO, String content) {
		return orderAuditsService.saveOrderAudits(orderVO, content);
	}

	/**
	 * 更新订单状态
	 * 
	 * @param memberVO
	 */
	public ModelMap updateOrderStatus(OrderVO orderVO) {
		return this.orderService.updateOrderStatus(orderVO);
	}

	/**
	 * 添加订单
	 * 
	 * @param userVO
	 * @return
	 */
	public ModelMap addOrder(OrderVO orderVO) {
		return this.orderService.addOrder(orderVO);
	}
}
