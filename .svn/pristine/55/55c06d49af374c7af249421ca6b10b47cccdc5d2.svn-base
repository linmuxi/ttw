/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.order.model.OrderModel;
import com.phly.ttw.manage.order.model.OrderVO;

/**
 * 订单dao类
 * 
 * @author LGP
 */
@Repository
public class OrderDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询订单列表
	 * 
	 * @param orderVO
	 * @return 订单集合
	 */
	public List<OrderVO> queryOrderList(OrderVO orderVO) {
		return this.queryList("order.queryOrderList", orderVO, orderVO.getPageNo(), orderVO.getPageSize());
	}

	/**
	 * 获取订单总数
	 * 
	 * @param memberVO
	 * @return
	 */
	public int getOrderCount(OrderVO orderVO) {
		return (Integer) this.getObject("order.getOrderCount", orderVO);
	}

	public OrderVO getOrder(OrderVO orderVO) {
		return (OrderVO) this.getObject("order.getOrder", orderVO);
	}

	public List<OrderModel> getOrderFromWwtByDate(String date) {
		List<OrderModel> orderModels = this.queryList("order.findOrderByDate", date);
		return orderModels;
	}

	/**
	 * 添加订单
	 * 
	 * @param orderVO
	 * @return
	 */
	public boolean addOrderVO(OrderVO orderVO) {
		boolean flag = false;
		try {
			this.insert("order.addOrder", orderVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加订单失败," + e);
		}
		return flag;
	}

	/**
	 * 更新订单状态
	 * 
	 * @param orderVO
	 * @return
	 */
	public boolean updateOrderStatus(OrderVO orderVO) {
		boolean flag = false;
		try {
			this.insert("order.updateOrderStatus", orderVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("更新订单失败," + e);
		}
		return flag;
	}

}
