/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.service;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.manage.order.dao.OrderDao;
import com.phly.ttw.manage.order.model.OrderModel;
import com.phly.ttw.manage.order.model.OrderVO;

/**
 * 订单Service类
 * 
 * @author LGP
 */
@Service("OrderService")
public class OrderService extends ServiceBase {

	@Resource
	private OrderDao orderDao;

	/**
	 * 查询订单列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	public ModelMap queryOrderList(OrderVO orderVO) {
		int count = this.orderDao.getOrderCount(orderVO);
		List<OrderVO> list = Collections.emptyList();
		if (count > 0) {
			list = this.orderDao.queryOrderList(orderVO);
		}
		ModelMap map = new ModelMap();
		map.put(ROWS, list);
		map.put(TOTAL, count);
		map.put(CURRENT, orderVO.getPageNo());
		map.put(ROWCOUNT, orderVO.getPageSize());
		return map;
	}

	public OrderVO getOrder(OrderVO orderVO) {
		return orderDao.getOrder(orderVO);
	}

	public List<OrderModel> getOrderFromWwtByDate(String date) {
		return orderDao.getOrderFromWwtByDate(date);
	}

	/**
	 * 添加订单
	 * 
	 * @param orderVO
	 * @return
	 */
	public ModelMap addOrder(OrderVO orderVO) {
		ModelMap map = new ModelMap();
		boolean result = this.orderDao.addOrderVO(orderVO);
		map.put("result", result);
		map.put("remark", result ? "" : "保存订单异常，请联系管理员");
		return map;
	}

	/**
	 * 更新订单状态
	 * 
	 * @param orderVO
	 * @return
	 */
	public ModelMap updateOrderStatus(OrderVO orderVO) {
		ModelMap map = new ModelMap();
		boolean result = orderDao.updateOrderStatus(orderVO);
		map.put("result", result);
		return map;
	}

}
