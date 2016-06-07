package com.phly.ttw.manage.order.ws;

import java.util.List;

import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.util.ApplicationContextUtil;
import com.phly.ttw.manage.order.model.OrderModel;
import com.phly.ttw.manage.order.service.OrderService;

@WebService(endpointInterface = "com.phly.ttw.manage.order.ws.IOrderWS", serviceName = "OrderWS")
public class OrderWSimpl implements IOrderWS {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	OrderService bean =(OrderService)ApplicationContextUtil.getApplicationContext().getBean("OrderService");
	
	@Override
	public List<OrderModel> getOrderFromWwtByDate(String date) {
		logger.info("ws 同步调用订单开始");
		if(StringUtils.isBlank(date)) return null;
		List<OrderModel> orderFromWwtByDate = bean.getOrderFromWwtByDate(date);
		logger.info("ws 同步调用订单结束");
		return orderFromWwtByDate;
	}

}
