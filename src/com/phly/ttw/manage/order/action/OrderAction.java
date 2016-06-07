/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.order.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.action.BaseAction;
import com.phly.common.base.facade.SysUserFacade;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.order.facade.OrderFacade;
import com.phly.ttw.manage.order.facade.OrderItemFacade;
import com.phly.ttw.manage.order.model.OrderAuditsVO;
import com.phly.ttw.manage.order.model.OrderItemVO;
import com.phly.ttw.manage.order.model.OrderVO;

/**
 * 订单Action类(管理员使用)
 * 
 * @author LGP
 */
@Controller
@RemoteProxy
public class OrderAction extends BaseAction {

	@Resource
	private OrderFacade orderFacade;
	@Resource
	private OrderItemFacade orderItemFacade;
	@Resource
	private SysUserFacade sysUserFacade;

	/**
	 * 查询订单列表
	 * 
	 * @param orderVO
	 * @return 订单集合
	 */
	@ExceptionMessage("查询订单列表失败，请联系管理员")
	@RequestMapping("/page/ttw/manage/order")
	@ResponseBody
	public ModelMap queryOrderList(HttpServletRequest request, OrderVO orderVO) {
		String method = request.getParameter("m");
		String[] orders = null;
		if (method.equals("member")) {
			orders = new String[4];
			orders[0] = "0";
			orders[1] = "1";
			orders[2] = "2";
			orders[3] = "10";
		}
		if (method.equals("supplier")) {
			orders = new String[5];
			orders[0] = "2";
			orders[1] = "3";
			orders[2] = "4";
			orders[3] = "5";
			orders[4] = "6";
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if (userVO != null) {
				orderVO.setSupplier(userVO.getAccount());
			}
		}
		orderVO.setInOrderStatus(orders);
		return this.orderFacade.queryOrderList(orderVO);
	}

	/**
	 * 查看订单详情
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/order/orderDetail")
	public String orderDetail(HttpServletRequest request, OrderVO orderVO) {
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		String method = request.getParameter("m");
		// 订单信息
		orderVO = orderFacade.getOrder(orderVO);
		// 供应商查看订单时，表示已经接收到了订单，需要更新订单状态
		if (StringUtils.isNotBlank(method) && method.equals("supplier")) {
			if (orderVO.getOrderStatus() == 2) {
				orderVO.setOrderStatus(3);
				orderFacade.updateOrderStatus(orderVO);
				orderVO.setCreator(userId);
				orderFacade.saveOrderAudits(orderVO, "【确定】");
			}
		}
		// 订单项信息
		OrderItemVO orderItemVO = new OrderItemVO();
		orderItemVO.setOrderId(orderVO.getOrderSn());
		List<OrderItemVO> list = orderItemFacade.queryOrderItemList(orderItemVO);
		List<OrderAuditsVO> orderAuditsVOs = orderFacade.queryOrderAuditsList(userId, orderVO);
		// 取客户上传的订单附件
		OrderAuditsVO orderAuditsVO = orderFacade.getOrderAudits(orderVO);
		request.setAttribute("order", orderVO);
		request.setAttribute("items", list);
		request.setAttribute("orderAudits", orderAuditsVOs);
		request.setAttribute("oa", orderAuditsVO);
		return "/page/ttw/manage/order/orderDetail.jsp";
	}

	/**
	 * 订单审核
	 * 
	 * @param request
	 * @param orderVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/order/orderAudits")
	public String orderAudits(HttpServletRequest request, OrderVO orderVO) {
		Boolean result = Boolean.valueOf(request.getParameter("result"));
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		String content = request.getParameter("content");
		orderVO = orderFacade.getOrder(orderVO);
		if (result) {
			// 修改状态
			orderVO.setOrderStatus(2);
			// 保存审核结果
			orderVO.setCreator(userId);
			content = "【通过】";
		} else {
			orderVO.setOrderStatus(10);
			content = "【拒绝】".concat(content);
		}
		// 更新订单状态
		orderFacade.updateOrderStatus(orderVO);
		// 保存审核结果
		orderFacade.saveOrderAudits(orderVO, content);
		return orderDetail(request, orderVO);
	}

	/**
	 * 供应商[确定]订单
	 * 
	 * @param request
	 * @param orderVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/order/receive")
	public String receive(HttpServletRequest request, OrderVO orderVO) {
		orderVO = orderFacade.getOrder(orderVO);
		orderVO.setOrderStatus(3);
		orderFacade.updateOrderStatus(orderVO);
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		orderVO.setCreator(userId);
		orderFacade.saveOrderAudits(orderVO, "【确定】");
		return "redirect:/page/ttw/manage/order/orderList.jsp?m=supplier";
	}

	/**
	 * 跳转到验收界面
	 * 
	 * @param request
	 * @param orderVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/order/goAccept")
	public ModelAndView goAccept(HttpServletRequest request, OrderVO orderVO) {
		ModelAndView mav = new ModelAndView("/page/ttw/manage/order/order_accept.jsp");
		// String userId = RequestContextUtil.getCurrentUser().getUserId();
		orderVO = orderFacade.getOrder(orderVO);
		// 订单项信息
		OrderItemVO orderItemVO = new OrderItemVO();
		orderItemVO.setOrderId(orderVO.getOrderSn());
		List<OrderItemVO> list = orderItemFacade.queryOrderItemList(orderItemVO);
		request.setAttribute("order", orderVO);
		request.setAttribute("items", list);
		return mav;
	}

	/**
	 * 供应商提交订单制作结果
	 * 
	 * @param request
	 * @param orderVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/order/saveAccept")
	public String saveAccept(HttpServletRequest request, OrderVO orderVO) {
		String fileUrl = request.getParameter("fileUrl");
		orderVO = orderFacade.getOrder(orderVO);
		if (orderVO.getOrderStatus() == 3) {
			// 上传样本
			orderVO.setOrderStatus(4);
		}
		if (orderVO.getOrderStatus() == 5) {
			// 上传源码
			orderVO.setOrderStatus(6);
		}
		orderFacade.updateOrderStatus(orderVO);
		// 保存文件地址
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		orderVO.setCreator(userId);
		orderFacade.saveOrderAudits(orderVO, fileUrl);
		return "redirect:/page/ttw/manage/order/orderList.jsp?m=supplier";
	}
}
