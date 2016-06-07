/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.ttw.manage.order.model.OrderItemVO;
import com.phly.ttw.manage.order.service.OrderItemService;

/**
 * 订单项代理类
 * 
 * @author LGP
 */
@Component
public class OrderItemFacade {

	@Resource
	private OrderItemService orderItemService;

	/**
	 * 查询订单项列表
	 * 
	 * @param orderVO
	 * @return 订单项集合
	 */
	public List<OrderItemVO> queryOrderItemList(OrderItemVO orderItemVO) {
		return this.orderItemService.queryOrderItemList(orderItemVO);
	}

	/**
	 * 添加订单
	 * 
	 * @param userVO
	 * @return
	 */
	public ModelMap addOrderItem(OrderItemVO orderItemVO) {
		return this.orderItemService.addOrderItem(orderItemVO);
	}

}
