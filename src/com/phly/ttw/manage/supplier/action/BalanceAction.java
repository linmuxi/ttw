package com.phly.ttw.manage.supplier.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.ttw.manage.order.facade.OrderFacade;
import com.phly.ttw.manage.order.model.OrderVO;

/**
 * 供应商结算控制类
 * 
 * @author LGP
 */
@Controller
@RemoteProxy
public class BalanceAction {

	@Resource
	private OrderFacade orderFacade;

	@RequestMapping("/page/ttw/manage/supplier/balance")
	@ResponseBody
	public ModelMap queryBalanceList(HttpServletRequest request) {
		String method = request.getParameter("m");
		OrderVO orderVO = new OrderVO();
		String[] orders = null;
		if (method.equals("unsettle")) {
			orders = new String[7];
			orders[0] = "0";
			orders[1] = "1";
			orders[2] = "2";
			orders[3] = "3";
			orders[4] = "4";
			orders[5] = "5";
			orders[6] = "6";
		}
		if (method.equals("settled")) {
			orders = new String[1];
			orders[0] = "7";
		}
		orderVO.setInOrderStatus(orders);
		return this.orderFacade.queryOrderList(orderVO);
	}

}
