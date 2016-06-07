package com.phly.ttw.manage.member.ws;

import java.util.List;

import javax.annotation.Resource;
import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.util.ApplicationContextUtil;
import com.phly.ttw.manage.member.dao.MemberDao;
import com.phly.ttw.manage.member.model.MemberModel;
import com.phly.ttw.manage.member.service.MemberService;


@WebService(endpointInterface = "com.phly.ttw.manage.member.ws.IMemberWS", serviceName = "MemberWS")
public class MemberWSImpl implements IMemberWS {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private MemberDao memberDao;
	
	MemberService bean =(MemberService)ApplicationContextUtil.getApplicationContext().getBean("MemberService");

	@Override
	public List<MemberModel> getMemberFromWwtByDate(String date) {
		logger.info("ws 同步调用会员开始");
		if(StringUtils.isBlank(date)) return null;
		List<MemberModel> findMemberByDate = memberDao.findMemberByDate(date);
		logger.info("ws 同步调用会员开始");
		return findMemberByDate;
	}

}
