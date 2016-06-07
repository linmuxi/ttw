/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.member.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysUserDao;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.DictUtil;
import com.phly.common.util.DigestUtil;
import com.phly.ttw.manage.member.dao.MemberDao;
import com.phly.ttw.manage.member.model.MemberVO;

/**
 * 会员服务类
 * 
 * @author TH
 */
@Service("MemberService")
public class MemberService extends ServiceBase {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private MemberDao memberDao;
	@Resource
	private SysUserDao userDao;

	/**
	 * 查询会员列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	public ModelMap queryMemberList(MemberVO memberVO) {
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.memberDao.getMemberCount(memberVO);
		if (count > 0) {
			model.put(ROWS, memberDao.queryMemberList(memberVO));
			model.put(TOTAL, count);
			model.put(CURRENT, memberVO.getPageNo());
			model.put(ROWCOUNT, memberVO.getPageSize());
		}
		return model;
	}

	/**
	 * 会员注册
	 * 
	 * @param memberVO
	 * @return
	 */
	public ModelMap register(MemberVO memberVO) {
		ModelMap map = new ModelMap();
		//EF895EBD11ED11E5BB0D02004C4F4F11
		String defaultOrgId =(String) DictUtil.getValue("HUIYUAN", "memberDefaultOrgId");
		SysUserVO userVO = new SysUserVO(memberVO.getName(), memberVO.getEmail(), DigestUtil.encodePasswordByMD5(memberVO.getPwd(), memberVO.getEmail()), defaultOrgId, true, true, true, true, "1");
		boolean flag = this.userDao.addUser(userVO);
		memberVO.setUserId(this.userDao.getUserByAccount(memberVO.getEmail()).getUserId());
		logger.info("会员注册-添加系统用户" + flag);
		if (flag) {
			flag = this.memberDao.addMember(memberVO);
			logger.info("会员注册-添加会员信息" + flag);
		}
		map.put("result", flag);
		return map;
	}

	/**
	 * 根据用户名称或id获取会员vo
	 * 
	 * @param userVO
	 * @return
	 */
	public MemberVO getMemberByUserId(SysUserVO userVO) {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserId(userVO.getUserId());
		return memberDao.getMember(memberVO);
	}
	
	/**
	 * 获取会员vo
	 * 
	 * @param userVO
	 * @return
	 */
	public MemberVO getMember(MemberVO memberVO) {
		return memberDao.getMember(memberVO);
	}
	

	public ModelMap updateMember(MemberVO memberVO) {
		ModelMap map = new ModelMap();
		boolean updateMember = memberDao.updateMember(memberVO);
		map.put("result", updateMember);
		return map;
	}

	public MemberVO getMemberVoByAccount(String account) {
		return memberDao.getMemberVoByAccount(account);
	}

}
