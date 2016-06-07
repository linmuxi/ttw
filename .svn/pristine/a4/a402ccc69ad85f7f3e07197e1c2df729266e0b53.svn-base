/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.member.dao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.common.util.DateUtil;
import com.phly.ttw.manage.member.model.MemberModel;
import com.phly.ttw.manage.member.model.MemberVO;

/**
 * 会员dao类
 * 
 * @author TH
 */
@Repository
public class MemberDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询会员列表
	 * 
	 * @param memberVO
	 * @return 会员集合
	 */
	public List<MemberVO> queryMemberList(MemberVO memberVO) {
		return this.queryList("member.queryMemberList", memberVO, memberVO.getPageNo(), memberVO.getPageSize());
	}

	/**
	 * 获取会员总数
	 * 
	 * @param memberVO
	 * @return
	 */
	public int getMemberCount(MemberVO memberVO) {
		return (Integer) this.getObject("member.getMemberCount", memberVO);
	}

	/**
	 * 添加会员信息
	 * 
	 * @param memberVO
	 * @return
	 */
	public boolean addMember(MemberVO memberVO) {
		boolean flag = false;
		try {
			this.insert("member.addMember", memberVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加会员失败," + e);
		}
		return flag;
	}

	/**
	 * 获取会员信息
	 * 
	 * @param memberVO
	 * @return
	 */
	public MemberVO getMember(MemberVO memberVO) {
		return (MemberVO) this.getObject("member.getMember", memberVO);
	}

	public boolean updateMember(MemberVO memberVO) {
		boolean flag = false;
		try {
			String strBirth = memberVO.getStrBirth();
			if(StringUtils.isNotBlank(strBirth)){
				memberVO.setBirth(DateUtil.getDateByStr(strBirth));
			}
			this.update("member.updateMember", memberVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改会员失败," + e);
		}
		return flag;
	}

	public List<MemberModel> findMemberByDate(String date) {
		List<MemberModel> memberModels = this.queryList("member.findMemberByDate", date);
		return memberModels;
	}

	/**
	 * 此方法根据会员账户查询会员信息，返回对象中不包括会员关联的用户信息
	 * @param account
	 * @return
	 */
	public MemberVO getMemberVoByAccount(String account) {
		return (MemberVO) this.getObject("member.getMemberVoByAccount", account);
	}
}
