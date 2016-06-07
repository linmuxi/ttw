/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.product.action;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.facade.FileStoreFacade;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.DateUtil;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.facade.GoodsFacade;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.model.GoodsVO;
import com.phly.ttw.manage.member.facade.MemberFacade;
import com.phly.ttw.manage.member.model.MemberVO;
import com.phly.ttw.manage.order.facade.OrderFacade;
import com.phly.ttw.manage.order.facade.OrderItemFacade;
import com.phly.ttw.manage.order.model.OrderAuditsVO;
import com.phly.ttw.manage.order.model.OrderItemVO;
import com.phly.ttw.manage.order.model.OrderVO;
import com.phly.ttw.manage.order.model.PaymentMethodVO;

/**
 * 订单控制器类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Controller("frontOrder")
@RequestMapping("/page/ttw/frontbg")
@RemoteProxy
public class OrderAction {

	@Resource
	private GoodsFacade goodsFacade;
	@Resource
	private OrderFacade orderFacade;
	@Resource
	private MemberFacade memberFacade;
	@Resource
	private OrderItemFacade orderItemFacade;
	@Resource
	private FileStoreFacade fileStoreFacade;

	@RequestMapping("/member/order")
	public ModelAndView queryOrderList(HttpServletRequest request) {
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		String status = request.getParameter("status");
		ModelAndView mav = new ModelAndView();
		OrderVO orderVO = new OrderVO();
		if (StringUtils.isNotBlank(status)) {
			orderVO.setOrderStatus(Integer.valueOf(status));
		}
		orderVO.setCreator(userId);
		request.setAttribute("modelMap", this.orderFacade.queryOrderList(orderVO));
		mav.setViewName("/page/ttw/frontbg/member/order_list.jsp");
		return mav;
	}

	@RequestMapping("/member/order/detail")
	public ModelAndView detail(HttpServletRequest request, OrderVO orderVO) {
		ModelAndView mav = new ModelAndView();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		// 订单信息
		orderVO = orderFacade.getOrder(orderVO);
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
		mav.setViewName("/page/ttw/frontbg/member/order_detail.jsp");
		return mav;
	}

	/**
	 * 会员验收结果
	 * 
	 * @param request
	 * @param orderVO
	 * @return
	 */
	@RequestMapping("/member/order/accept")
	public String accept(HttpServletRequest request, OrderVO orderVO) {
		ModelAndView mav = new ModelAndView();
		String content = request.getParameter("content");
		String result = request.getParameter("result");
		orderVO = orderFacade.getOrder(orderVO);
		if (StringUtils.isNotBlank(content)) {
			try {
				content = new String(content.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {

			}
		}
		if ("false".equals(result)) {
			content = "【退回】".concat(content);
			orderVO.setOrderStatus(4);
		} else {
			content = "【验收通过】";
			orderVO.setOrderStatus(5);
		}
		orderFacade.updateOrderStatus(orderVO);
		// 保存文件地址
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		orderVO.setCreator(userId);
		orderFacade.saveOrderAudits(orderVO, content);
		return "redirect:/page/ttw/frontbg/member/order/detail?id=".concat(orderVO.getId());
	}

	@RequestMapping("/product/order")
	public ModelAndView productOrder(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String serialNumber = request.getParameter("serialno");
		// 保存到订单表
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setSerialNumber(serialNumber);

		ModelMap modelMap = goodsFacade.getGoods(goodsVO);
		if (null != modelMap.get("remark")) {
			mav.setViewName("/page/ttw/front/login.jsp");
			return mav;
		}
		goodsVO = (GoodsVO) modelMap.get("result");
		List<GoodsAttributeVO> attrList = (List<GoodsAttributeVO>) modelMap.get("attrList");

		// 取产品范本
		FileStoreVO fileStoreVO = new FileStoreVO();
		fileStoreVO.setBusinessId(goodsVO.getId());
		ModelMap map = fileStoreFacade.queryFileStoreListByBusinessId(fileStoreVO);
		mav.addObject("goods", goodsVO);
		mav.addObject("attrList", attrList);
		mav.addObject("goodsNum", 1);
		mav.addObject("filestore", map.get(ServiceBase.ROWS));
		mav.setViewName("/page/ttw/front/goods_order.jsp");
		return mav;
	}

	/**
	 * 提交订单
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/product/submitOrder")
	public ModelAndView submitOrder(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String serialNumber = request.getParameter("serialno");
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setSerialNumber(serialNumber);
		ModelMap modelMap = goodsFacade.getGoods(goodsVO);
		if (null != modelMap.get("remark")) {
			mav.setViewName("/page/ttw/front/login.jsp");
			return mav;
		}
		goodsVO = (GoodsVO) modelMap.get("result");
		List<GoodsAttributeVO> attrList = (List<GoodsAttributeVO>) modelMap.get("attrList");
		// 入库保存到订单表
		SysUserVO sysUserVO = new SysUserVO();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		sysUserVO.setUserId(userId);
		// 会员信息
		MemberVO memberVO = memberFacade.getMember(sysUserVO);

		String mobile = request.getParameter("mobile");
		String memo = request.getParameter("memo");
		if (StringUtils.isNotBlank(memo)) {
			try {
				memo = new String(memo.getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} finally {

			}
		}
		OrderVO orderVO = new OrderVO();
		String id = request.getParameter("id");
		String uuid = UUID.randomUUID().toString().replace("-", "");
		uuid = uuid.substring(uuid.length() - 6, uuid.length());
		String orderSn = "YY".concat(DateUtil.pattern("yyyyMMdd", new Date()).concat(uuid));
		orderVO.setId(id);
		orderVO.setOrderSn(orderSn); // 分类代码+YYYYMMDD+6位随机
		orderVO.setMemberVO(memberVO);
		orderVO.setIsInvoice(0);
		orderVO.setInvoiceTitle("Aisce.lin");
		orderVO.setMemo(memo);
		orderVO.setMobile(mobile);
		orderVO.setOrderStatus(1);
		orderVO.setPaymentMethodName("网银");
		orderVO.setPaymentStatus(0);
		orderVO.setPaymentMethodVO(new PaymentMethodVO("1"));
		orderVO.setAmount(BigDecimal.valueOf(goodsVO.getMemberPrice()));
		orderVO.setNum(1);
		orderVO.setGoodsName(goodsVO.getGoodsName());
		orderVO.setCreator(userId);
		orderFacade.addOrder(orderVO);

		// order_item
		OrderItemVO orderItemVO = new OrderItemVO();
		orderItemVO.setName(goodsVO.getGoodsName());
		orderItemVO.setPrice(BigDecimal.valueOf(goodsVO.getMemberPrice()));
		orderItemVO.setQuantity(1);
		orderItemVO.setSn(goodsVO.getSerialNumber());
		orderItemVO.setThumbnail(goodsVO.getPictureUrl());
		orderItemVO.setOrderId(orderSn);
		orderItemFacade.addOrderItem(orderItemVO);
		// 保存到审批表
		orderVO = orderFacade.getOrder(orderVO);
		String fileUrl = request.getParameter("fileUrl");
		orderFacade.saveOrderAudits(orderVO, fileUrl);
		// mav.setViewName("/page/ttw/front/goods_order.jsp");
		// mav.setViewName("/page/ttw/front/order_success.jsp");
		mav.setViewName("redirect:/page/ttw/frontbg/product/orderSuccess");
		return mav;
	}

	@RequestMapping("/product/orderSuccess")
	public ModelAndView orderSuccess(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/page/ttw/front/order_success.jsp");
		return mav;
	}
}
