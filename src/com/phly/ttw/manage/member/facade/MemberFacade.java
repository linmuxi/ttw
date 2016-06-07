/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.member.facade;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.SysUserService;
import com.phly.common.util.DigestUtil;
import com.phly.common.util.EmailUtils;
import com.phly.ttw.manage.member.model.MemberVO;
import com.phly.ttw.manage.member.model.TrMemberVo;
import com.phly.ttw.manage.member.service.MemberService;

/**
 * 会员代理类
 * 
 * @author TH
 */
@Component
public class MemberFacade {

	@Resource
	private MemberService memberService;
	@Resource
	private SysUserService userService;

	/**
	 * 查询会员列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	public ModelMap queryMemberList(MemberVO memberVO) {
		return this.memberService.queryMemberList(memberVO);
	}
	
	/**
	 * 更新会员
	 * 
	 * @param memberVO
	 */
	public ModelMap updateMember(MemberVO memberVO) {
		return this.memberService.updateMember(memberVO);
	}

	/**
	 * 根据用户id获取会员vo
	 * 
	 * @param userVO
	 * @return
	 */
	public MemberVO getMember(SysUserVO userVO) {
		return memberService.getMemberByUserId(userVO);
	}
	
	/***
	 * 根据会员账户获取会员信息
	 * @param account
	 * @return
	 */
	public MemberVO getMemberVoByAccount(String account){
		return memberService.getMemberVoByAccount(account);
	}

	/**
	 * 状态变更
	 * 
	 * @param memberVO
	 */
	public void setEnabled(MemberVO memberVO) {
	}

	/**
	 * 会员注册
	 * 
	 * @param memberVO
	 * @return
	 */
	public ModelMap register(MemberVO memberVO) {
		return this.memberService.register(memberVO);
	}

	public ModelMap updateTrMemberInfo(TrMemberVo trMemberVo) {
		MemberVO member = memberService.getMember(new MemberVO(trMemberVo.getAccount()));
		member.setName(trMemberVo.getName());
		member.setAddress(trMemberVo.getAddress());
		member.setStrBirth(trMemberVo.getBirth());
		member.setEmail(trMemberVo.getEmail());
		member.setGender(trMemberVo.getGender());
		member.setQq_code(trMemberVo.getQq_code());
		member.setMobile(trMemberVo.getMobile());
		member.setMsn_code(trMemberVo.getMsn_code());
		member.setOffice_phone(trMemberVo.getOffice_phone());
		member.setUrlImg(trMemberVo.getUrlImg());
		return memberService.updateMember(member);
	}

	public ModelMap putEmailToMember(MemberVO vo) {
		ModelMap map = new ModelMap();
		//1.将会员的邮箱状态设置为：1 未激活
		vo.setEmailStatus("1");
		vo.setVaildTimeEmail(new Date());
		boolean updateFlag = (Boolean) memberService.updateMember(vo).get("result");
		//2.用户找回密码，将密码重置地址发送至用户邮箱。
		if(updateFlag){
			String url = EmailUtils.PASSWORD_FIND_URL;
			boolean sendSuccess = EmailUtils.sendHtmlMail(vo.getEmail(),EmailUtils.EMAIL_SUBJECT_PASSWORD_FIND,EmailUtils.getMessage_passWord_find(vo, url));
			if(sendSuccess){
				map.put("flag", true);
				map.put("msg", "激活邮件已经发送到您邮箱："+vo.getEmail());
				return map;
			}else{
				map.put("flag", false);
				map.put("msg", "密码找回失败或者邮箱服务器链接失败，请联系管理员。");
				return map;
			}
		}else{
			map.put("flag", false);
			map.put("msg", "邮箱状态设置失败，请联系管理员。");
			return map;
		}
	}

	public ModelMap updateMemberPwd(String account,String pwd) {
		SysUserVO userVO =new SysUserVO();
		userVO.setAccount(account);
		userVO = userService.findSysUserVOByAccount(userVO);
		userVO.setPassword(DigestUtil.encodePasswordByMD5(pwd, account));
		
		MemberVO vo = memberService.getMemberVoByAccount(account);
		vo.setEmailStatus("0");
		memberService.updateMember(vo);
		
		return userService.updateUser(userVO);
	}

}
