/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.member.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.action.BaseAction;
import com.phly.common.base.action.upload.UploadConstants;
import com.phly.common.base.facade.SysUserFacade;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;
import com.phly.common.util.DateUtil;
import com.phly.common.util.DesUtil;
import com.phly.common.util.DigestUtil;
import com.phly.common.util.GenerationImgUtil;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.member.facade.MemberFacade;
import com.phly.ttw.manage.member.model.MemberVO;
import com.phly.ttw.manage.member.model.TrMemberVo;
import com.phly.ttw.manage.order.facade.OrderFacade;
import com.phly.ttw.manage.order.model.OrderVO;
import com.phly.ttw.portal.cart.facade.CartFacade;

/**
 * 会员控制类
 * 
 * @author TH
 */
@Controller
@RemoteProxy
public class MemberAction extends BaseAction {

	@Resource
	private MemberFacade memberFacade;
	@Resource
	private SysUserFacade sysUserFacade;
	@Resource
	private OrderFacade orderFacade;
	@Resource
	private CartFacade cartFacade;

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 会员中心
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	@RequestMapping("/page/ttw/frontbg/member/center")
	@ResponseBody
	public ModelAndView center(HttpServletRequest request, OrderVO orderVO) {
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		ModelAndView mav = new ModelAndView(
				"/page/ttw/frontbg/member/index_member.jsp");
		orderVO.setCreator(userId);
		request.setAttribute("modelMap",
				this.orderFacade.queryOrderList(orderVO));
		return mav;
	}

	/**
	 * 查询会员列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	@ExceptionMessage("查询会员列表失败，请联系管理员")
	@RequestMapping("/page/business/manage/member/memberList")
	@ResponseBody
	public ModelMap queryMemberList(HttpServletRequest request) {
		MemberVO memberVO = new MemberVO();
		return this.memberFacade.queryMemberList(memberVO);
	}

	/**
	 * 会员状态变更
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/setEnabled")
	public String setEnabled(SysUserVO sysUserVO) {
		boolean enabled = sysUserVO.isEnabled();
		sysUserVO = (SysUserVO) sysUserFacade.getUser(sysUserVO).get("bean");
		sysUserVO.setEnabled(enabled);
		sysUserVO.setUpdateTime(new Timestamp(System.currentTimeMillis()));
		sysUserFacade.updateUser(sysUserVO);
		return "redirect:/page/ttw/manage/member/memberList.jsp";
	}

	/**
	 * 查看会员详情
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/memberDetail")
	public String memberDetail(HttpServletRequest request, SysUserVO sysUserVO) {
		// 用户信息
		sysUserVO = (SysUserVO) sysUserFacade.getUser(sysUserVO).get("bean");
		// 会员信息
		MemberVO memberVO = memberFacade.getMember(sysUserVO);
		request.setAttribute("user", sysUserVO);
		request.setAttribute("member", memberVO);
		return "/page/ttw/manage/member/memberDetail.jsp";
	}

	/**
	 * 查看会员详情
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/memberDetail_portal")
	public ModelAndView memberDetail_portal(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		SysUserVO sysUserVO = new SysUserVO();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		sysUserVO.setUserId(userId);
		// 会员信息
		MemberVO memberVO = memberFacade.getMember(sysUserVO);
		if (memberVO == null) {
			view.addObject("msg", "该用户未绑定会员，请联系管理员。");
			view.setViewName("/page/ttw/portal/html/tips.jsp");
		} else {
			view.setViewName("/page/ttw/portal/html/jiben.jsp");
			request.setAttribute("member", memberVO);
		}
		return view;
	}

	/**
	 * 进入会员信息变更页面
	 * 
	 * @param userVO
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/page/business/manage/member/doMemberInfoUpdate_portal")
	public ModelAndView doMemberInfoUpdate_portal(HttpServletRequest request,
			MemberVO memberVO) {
		ModelAndView view = new ModelAndView();
		view.setViewName("/page/ttw/portal/html/tips.jsp");
		ModelMap map = memberFacade.updateMember(memberVO);
		if ((Boolean) map.get("result")) {
			view.addObject("msg", "操作成功！");
		} else {
			view.addObject("msg", "操作失败！");
		}
		return view;
	}

	/**
	 * 会员信息变更
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/goMemberInfoUpdate_portal")
	public ModelAndView goMemberInfoUpdate_portal(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		SysUserVO sysUserVO = new SysUserVO();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		sysUserVO.setUserId(userId);
		// 会员信息
		MemberVO memberVO = memberFacade.getMember(sysUserVO);
		if (memberVO == null) {
			view.addObject("msg", "该用户未绑定会员，无法做变更操作，请联系管理员。");
			view.setViewName("/page/ttw/portal/html/tips.jsp");
		} else {
			view.setViewName("/page/ttw/portal/html/xinxi.jsp");
			request.setAttribute("member", memberVO);
		}
		return view;
	}

	/**
	 * 会员信息变更
	 * 
	 * @param userVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateMemberInfo(MemberVO memberVO) {
		ModelMap map = memberFacade.updateMember(memberVO);
		return map;
	}

	/***
	 * 会员信息变更 仅供TTW前台使用 为了让serializeObject()方法转换方便 新增TrMemberVo类做临时转换用
	 * 
	 * @param trMemberVo
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateTrMemberInfo(TrMemberVo trMemberVo) {
		ModelMap map = memberFacade.updateTrMemberInfo(trMemberVo);
		return map;
	}

	/**
	 * 会员注册
	 * 
	 * @param memberVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap register(MemberVO memberVO) {
		return this.memberFacade.register(memberVO);
	}

	/**
	 * 会员中心
	 * 
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/memberHome")
	public String memberHome(HttpServletRequest request, MemberVO memberVO) {
		return "/page/ttw/portal/html/Member.jsp";
	}

	@RequestMapping("/page/business/manage/member/changePasswordView")
	public ModelAndView changePasswordView(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/page/ttw/portal/html/memberPwdUpdate.jsp");
		return mav;
	}

	/**
	 * 修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/changePassword")
	@ResponseBody
	public ModelMap changePassword(MemberVO member, HttpServletRequest request,
			HttpServletResponse response) {
		ModelMap mm = new ModelMap();
		SysUserVO sysUser = RequestContextUtil.getCurrentUser();
		String oldPwd = sysUser.getPassword();
		String memberPwd = DigestUtil.encodePasswordByMD5(member.getPwd(),
				sysUser.getAccount());
		if (!oldPwd.equals(memberPwd)) {
			mm.addAttribute("result", false);
			mm.addAttribute("message", "原始密码输入错误！");
		} else {
			sysUser.setPassword(member.getSurePwd());
			this.sysUserFacade.updateUser(sysUser);
			mm.addAttribute("result", true);
			mm.addAttribute("message", "密码修改成功！");
		}

		return mm;
	}

	// /**
	// * 购物车
	// *
	// * @param request
	// * @param response
	// * @return
	// */
	// @RequestMapping("/page/business/manage/member/shopcar")
	// public ModelAndView shopcar(HttpServletRequest request,
	// HttpServletResponse response) {
	// ModelAndView mav = new ModelAndView();
	// cartFacade.queryAllCart(cart);
	// mav.setViewName("/page/ttw/portal/html/shopcar.jsp");
	// return mav;
	// }

	/**
	 * 订单查询
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/page/business/manage/member/order")
	public ModelAndView order(HttpServletRequest request,
			HttpServletResponse response, OrderVO orderVO) {
		ModelAndView mav = new ModelAndView();
		String method = request.getParameter("m");
		String[] orders = null;
		if (StringUtils.isNotBlank(method)) {
			if (method.equals("nopay")) {
				orders = new String[1];
				orders[0] = "0";
			}
			if (method.equals("accept")) {
				orders = new String[1];
				orders[0] = "6";
			}
			orderVO.setInOrderStatus(orders);
		}
		ModelMap modelMap = this.orderFacade.queryOrderList(orderVO);
		mav.addObject("list", modelMap.get("ROWS"));
		mav.setViewName("/page/ttw/portal/html/order.jsp");
		return mav;
	}

	// ////////////////////////////front///////////////////////////////////////////
	/***
	 * 会员中心
	 * 
	 * @param request
	 * @return 获取当前登录用户关联用户
	 */
	@RemoteMethod
	public ModelMap getMemberInfo_front() {
		ModelMap map = new ModelMap();
		SysUserVO sysUserVO = new SysUserVO();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		sysUserVO.setUserId(userId);
		MemberVO vo = memberFacade.getMember(sysUserVO);
		map.put("member", vo);
		return map;
	}

	/***
	 * 忘记密码 发送邮件
	 * 
	 * @return
	 */
	@RemoteMethod
	public ModelMap passWord_find(String account) {
		ModelMap map = new ModelMap();
		MemberVO vo = memberFacade.getMemberVoByAccount(account);
		map = memberFacade.putEmailToMember(vo);
		return map;
	}
	

	/**
	 * 会员重置密码_go   邮件连接跳转
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/page/manage/member/resertpwd")
	public ModelAndView resertpwd(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String param = request.getParameter("vs");
		if (param != null) {
			try {
				String email = DesUtil.decrypt(param);
				MemberVO vo = memberFacade.getMemberVoByAccount(String.valueOf(email));
				if (vo == null)
					return mav;
				// 1.连接失效
				// 2.邮箱有效激活时间不得超过3天
				if (!"1".equals(vo.getEmailStatus())) {
					mav.addObject("msg", "此链接已失效");
					mav.setViewName("/page/ttw/front/member/message.jsp");
				} else if (DateUtil.daysBetween(vo.getVaildTimeEmail(),
						new Date()) > 3) {
					mav.addObject("msg", "此链接已经超时，请重新发送邮件（链接有效期为3天）");
					mav.setViewName("/page/ttw/front/member/message.jsp");
				} else {
					mav.addObject("email", email);
					mav.setViewName("/page/ttw/front/member/resertpassword_member.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("邮件参数解密异常:" + e.getMessage());
				mav.addObject("msg", "系统内部异常，请联系管理员。");
				mav.setViewName("/page/ttw/front/member/message.jsp");
			}
		}
		return mav;
	}

	/***
	 * 忘记密码
	 * 
	 * @return
	 */
	@RemoteMethod
	public ModelMap updatepwd(String account, String pwd) {
		ModelMap map = new ModelMap();
		boolean flag = (Boolean) memberFacade.updateMemberPwd(account, pwd)
				.get("result");
		if (flag) {
			map.put("flag", true);
			map.put("msg", "密码重置成功");
		} else {
			map.put("flag", false);
			map.put("msg", "密码重置失败，请联系管理员");
		}
		return map;
	}

	@RequestMapping("/uploadImg")
	public String uploadImg(HttpServletRequest request,
			HttpServletResponse response) {
		String newFilename = "";
		String nowTimeStr = "";
		String realpath = request.getSession().getServletContext()
				.getRealPath("/");
		String fileDir = UploadConstants.UPLOAD_IMG_PATH_MEMBER;
		String savePath = realpath + fileDir;
		File destFile = new File(savePath);
		if (!destFile.exists()) {
			destFile.mkdirs();
		}
		SimpleDateFormat sDateFormat;
		Random r = new Random();

		int rannum = (int) (r.nextDouble() * (99999 - 1000 + 1)) + 10000;
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		nowTimeStr = sDateFormat.format(new Date());
		String filename = request.getHeader("X-File-Name");
		String extName = "";
		if (filename.lastIndexOf(".") >= 0) {
			extName = filename.substring(filename.lastIndexOf("."));
		}
		newFilename = nowTimeStr + rannum + extName;
		PrintWriter writer = null;
		InputStream is = null;
		FileOutputStream fos = null;
		try {
			writer = response.getWriter();
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		try {
			is = request.getInputStream();
			File file = new File(savePath + newFilename);
			fos = new FileOutputStream(file);
			IOUtils.copy(is, fos);
			response.setStatus(HttpServletResponse.SC_OK);
			writer.print("{success:'" + fileDir + newFilename + "'}");
		} catch (FileNotFoundException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} catch (IOException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} finally {
			try {
				fos.close();
				is.close();
			} catch (IOException ignored) {

			}
		}
		writer.flush();
		writer.close();
		return null;
	}

	/***
	 * 生成忘记密码——验证码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/forGetVerifyCode")
	public void forGetVerifyCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		GenerationImgUtil.buildVerifyCodeImg(request, response,"forGetCode");
	}
	
	/***
	 * 验证码是否正确
	 * @param request
	 * @param code
	 * @return
	 */
	@RequestMapping("/page/manage/member/forGetCheckverifyCode")
	@ResponseBody
	public ModelMap forGetCheckverifyCode(HttpServletRequest request,String code) {
		ModelMap map = new ModelMap();
		String sessionCode = (String) request.getSession().getAttribute("forGetCode");
		map.put("flag", sessionCode.equalsIgnoreCase(code));
		return map;
	}
}
