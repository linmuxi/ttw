package com.phly.ttw.manage.member.ws;

import java.util.List;

import javax.jws.WebService;

import com.phly.ttw.manage.member.model.MemberModel;


/***
 * TTW供应商对外接口  tips:主要用于数据同步（TTW与内部管理）
 * @author TH
 *
 */
@WebService
public interface IMemberWS {
	
	
	/***
	 * 获取创建时间为  date-1的会员信息
	 * tips：果参数为空则返回null
	 * @param date YYYY-MM-DD
	 * @return list
	 */
	public List<MemberModel> getMemberFromWwtByDate(String date);
}
