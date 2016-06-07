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
import com.phly.ttw.manage.order.model.OrderItemVO;

/**
 * 订单项dao类
 * 
 * @author LGP
 */
@Repository
public class OrderItemDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询订单项列表
	 * 
	 * @param orderVO
	 * @return 订单项集合
	 */
	public List<OrderItemVO> queryOrderItemList(OrderItemVO orderItemVO) {
		return this.queryList("orderItem.queryOrderItemList", orderItemVO, orderItemVO.getPageNo(),
				orderItemVO.getPageSize());
	}

	/**
	 * 添加订单项
	 * 
	 * @param orderVO
	 * @return
	 */
	public boolean addOrderItemVO(OrderItemVO orderItemVO) {
		boolean flag = false;
		try {
			this.insert("orderItem.addOrderItem", orderItemVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加订单项失败," + e);
		}
		return flag;
	}
}
