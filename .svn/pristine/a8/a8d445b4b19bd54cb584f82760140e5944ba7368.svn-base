package com.phly.ttw.manage.order.ws;

import java.util.List;

import javax.jws.WebService;

import com.phly.ttw.manage.order.model.OrderModel;


/***
 * TTW供应商对外接口  tips:主要用于数据同步（TTW与内部管理）
 * @author TH
 *
 */
@WebService
public interface IOrderWS {
	
	/***
	 * 获取创建时间为  date-1的订单信息
	 * tips：果参数为空则返回null
	 * @param date YYYY-MM-DD
	 * @return list
	 */
	public List<OrderModel> getOrderFromWwtByDate(String date);

}
