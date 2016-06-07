/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysUserDao;
import com.phly.common.base.model.AuthorizationKV;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.security.URLFilterInvocationSecurityMetadataSource;
import com.phly.common.util.ApplicationContextUtil;
import com.phly.common.util.DictUtil;
import com.phly.common.util.DigestUtil;

/**
 * 系统用户服务类
 * 
 * @Description TODO
 * @author lihui
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Service
public class SysUserService extends ServiceBase {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	private SysUserDao userDao;
	
	/**
	 * 查询用户列表
	 * 
	 * @param userVO
	 * @return 用户集合
	 */
	public ModelMap queryUserList(SysUserVO userVO) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = this.userDao.getUserCount(userVO);
		if(count > 0){
			map.put(ROWS, this.userDao.queryUserList(userVO));
			map.put(TOTAL, count);
			map.put(CURRENT, userVO.getPageNo());
			map.put(ROWCOUNT, userVO.getPageSize());
		}
		return map;
	}
	
	/**
	 * 根据用户名称或id获取用户vo
	 * @param userVO
	 * @return
	 */
	public ModelMap getUser(SysUserVO userVO) {
		ModelMap map = new ModelMap();
		SysUserVO vo = this.userDao.getUser(userVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}
	
	
	public SysUserVO findSysUserVOByAccount(SysUserVO userVO){
		return this.userDao.getUserByAccount(userVO.getAccount());
	}
	
	

	/**
	 * 添加用户
	 * @param userVO
	 * @return
	 */
	public ModelMap addUser(SysUserVO userVO) {
		ModelMap map = new ModelMap();
		SysUserVO vo = new SysUserVO();
		vo.setAccount(userVO.getAccount());
		if(this.userDao.getUser(vo) == null){
			userVO.setPassword(DigestUtil.encodePasswordByMD5(userVO.getPassword(),userVO.getAccount()));
			map.put("result", this.userDao.addUser(userVO));
		}else{
			map.put("result", false);
			map.put("remark", "该账户已经存在。");
		}
		return map;
	}

	/**
	 * 修改用户
	 * @param userVO
	 * @return
	 */
	public ModelMap updateUser(SysUserVO userVO) {
		ModelMap map = new ModelMap();
		SysUserVO paramVO = new SysUserVO();
		paramVO.setUserId(userVO.getUserId());
		SysUserVO vo = this.userDao.getUser(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getUserId(), userVO.getUserId())){
			map.put("result", false);
			map.put("remark", "该用户已经存在");
		}else{
			map.put("result", this.userDao.updateUser(userVO));
		}
		return map;
	}
	 
	/**
	 * 删除用户
	 * @param userVO
	 * @return
	 */
	public ModelMap delUser(SysUserVO userVO) {
		ModelMap map = new ModelMap();
		boolean flag = false;
		String ids = userVO.getUserId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String userId : idArr){
				if(StringUtils.isNotEmpty(userId)){
					userVO = new SysUserVO();
					userVO.setUserId(userId);
					flag = this.userDao.delUser(userVO);
				}
			}
		}
		map.put("result", flag);
		return map;
	}
	
	/**
	 * 编辑用户
	 * @param userVO
	 * @return
	 */
	public ModelMap formUser(SysUserVO userVO){
		ModelMap map = new ModelMap();
		
		if(null == userVO){
			map.put("result", false);
			map.put("remark", "对象为null");
			return map;
		}
		
		if(StringUtils.isNotEmpty(userVO.getUserId())){
			//修改
			return this.updateUser(userVO);
		}else{
			//新增
			return this.addUser(userVO);
		}
	}

	/**
	 * 查询指定帐号是否存在
	 * @param userVO
	 * @return  true:存在  反之。
	 */
	public ModelMap getAccountExists(SysUserVO userVO){
		ModelMap map = new ModelMap();
		map.put("valid", false);
		SysUserVO vo = this.userDao.getUserByAccount(userVO.getAccount());
//		if(null != vo && !StringUtils.equalsIgnoreCase(vo.getUserId(), userVO.getUserId())){
//			map.put("valid", false);
//		}
		if(null!=vo){
			map.put("valid", true);
		}
		return map;
	}
	
	/**
	 * 查看用户拥有的角色
	 * @param userVO
	 * @return
	 */
	public ModelMap getUserRoleInfo(SysUserVO userVO){
		ModelMap map = new ModelMap();
		map.put("selfAuth", transKV(this.userDao.getSelfRole(userVO)));
		map.put("noSelfAuth", transKV(this.userDao.getNoSelfRole(userVO)));
		return map;
	}

	/**
	 * 添加用户角色关系数据
	 * @param userVO
	 * @return
	 */
	public ModelMap addUserRole(SysUserVO userVO){
		ModelMap map = new ModelMap();
		map.put("result", this.userDao.addUserRole(userVO));
		// 刷新缓冲权限列表
		URLFilterInvocationSecurityMetadataSource sec = (URLFilterInvocationSecurityMetadataSource) ApplicationContextUtil
				.getBean("securityMetadataSource");
		try {
			logger.info("刷新权限列表");
			sec.afterPropertiesSet();
		} catch (Exception e) {
			logger.info("刷新权限列表失败");
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * 转换权限kv
	 * @param roles
	 * @return
	 */
	private List<AuthorizationKV> transKV(List<SysRoleVO> roles){
		List<AuthorizationKV> auths = new ArrayList<AuthorizationKV>();
		if(null != roles && roles.size() > 0){
			for (SysRoleVO role : roles) {
				auths.add(new AuthorizationKV(role.getRoleId(),role.getRoleName()));
			}
		}
		return auths;
	}

	public boolean updateSupplierUserPwd(SysUserVO sysUserVO) {
		SysUserVO vo = userDao.getUserByAccount(sysUserVO.getAccount());
		String encodePasswordByMD5 = DigestUtil.encodePasswordByMD5(sysUserVO.getPassword(),sysUserVO.getAccount());
		vo.setPassword(encodePasswordByMD5);
		return userDao.updateUser(vo);
	}

	public String resetPwd(SysUserVO userVO) {
		SysUserVO user = userDao.getUser(userVO);
		String defaultPassword = (String) DictUtil.getValue("GONGYINGSHANG", "suppDefaultPwd");
		String encodePasswordByMD5 = DigestUtil.encodePasswordByMD5(defaultPassword,user.getAccount());
		user.setPassword(encodePasswordByMD5);
		return userDao.updateUser(user) == true? "密码重置成功,默认为："+defaultPassword+",由于密码简单,请及时修改。":"密码重置失败";
	}

}