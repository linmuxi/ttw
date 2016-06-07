/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.manage.order.dao.OrderItemDao;
import com.phly.ttw.manage.order.model.OrderItemVO;

/**
 * 订单Service类
 * 
 * @author LGP
 */
@Service
public class OrderItemService extends ServiceBase {

	@Resource
	private OrderItemDao orderItemDao;

	/**
	 * 查询订单列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	public List<OrderItemVO> queryOrderItemList(OrderItemVO orderItemVO) {
		List<OrderItemVO> list = this.orderItemDao.queryOrderItemList(orderItemVO);
		return list;
	}

	/**
	 * 添加订单产品项
	 * 
	 * @param orderVO
	 * @return
	 */
	public ModelMap addOrderItem(OrderItemVO orderItemVO) {
		ModelMap map = new ModelMap();
		boolean result = this.orderItemDao.addOrderItemVO(orderItemVO);
		map.put("result", result);
		map.put("remark", result ? "" : "保存订单项异常，请联系管理员");
		return map;
	}

}
