package com.phly.ttw.manage.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.phly.ttw.manage.order.dao.OrderAuditsDao;
import com.phly.ttw.manage.order.model.OrderAuditsVO;
import com.phly.ttw.manage.order.model.OrderVO;

@Service("OrderAuditsService")
public class OrderAuditsService {

	@Resource
	private OrderAuditsDao orderAuditsDao;

	public List<OrderAuditsVO> queryOrderAuditsList(String userid, OrderVO orderVO) {
		OrderAuditsVO orderAuditsVO = new OrderAuditsVO();
		orderAuditsVO.setOrderVO(orderVO);
		orderAuditsVO.setCreator(userid);
		return orderAuditsDao.queryList(orderAuditsVO);
	}

	public boolean saveOrderAudits(OrderVO orderVO, String content) {
		OrderAuditsVO orderAuditsVO = new OrderAuditsVO();
		orderAuditsVO.setOrderVO(orderVO);
		orderAuditsVO.setCreator(orderVO.getCreator());
		orderAuditsVO.setContent(content);
		orderAuditsVO.setOrderStatus(orderVO.getOrderStatus());
		return orderAuditsDao.addOrderAuditsVO(orderAuditsVO);
	}

	public OrderAuditsVO getOrderAudits(OrderVO orderVO) {
		// return orderDao.getOrder(orderVO);
		OrderAuditsVO orderAuditsVO = new OrderAuditsVO();
		orderAuditsVO.setOrderVO(orderVO);
		orderAuditsVO.setOrderStatus(1);
		return orderAuditsDao.getOrderAudits(orderAuditsVO);
	}
}
