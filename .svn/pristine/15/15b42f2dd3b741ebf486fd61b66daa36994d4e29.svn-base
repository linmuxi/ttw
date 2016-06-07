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
import com.phly.ttw.manage.order.model.OrderAuditsVO;

/**
 * 订单审批dao类
 * 
 * @author LGP
 */
@Repository
public class OrderAuditsDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询订单审批列表
	 * 
	 * @param orderAuditsVO
	 * @return 订单审核集合
	 */
	public List<OrderAuditsVO> queryList(OrderAuditsVO orderAuditsVO) {
		return this.queryList("orderAudits.queryList", orderAuditsVO, orderAuditsVO.getPageNo(),
				orderAuditsVO.getPageSize());
	}

	public boolean addOrderAuditsVO(OrderAuditsVO orderAuditsVO) {
		boolean flag = false;
		try {
			this.insert("orderAudits.addOrderAudits", orderAuditsVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加审批失败," + e);
		}
		return flag;
	}

	/**
	 * 查询订单审批列表
	 * 
	 * @param orderAuditsVO
	 * @return 订单审核集合
	 */
	public OrderAuditsVO getOrderAudits(OrderAuditsVO orderAuditsVO) {
		return (OrderAuditsVO) this.getObject("orderAudits.getOrderAudits", orderAuditsVO);
	}

}
