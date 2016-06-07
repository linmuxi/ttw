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

import com.phly.common.base.dao.SysRoleDao;
import com.phly.common.base.model.AuthorizationKV;
import com.phly.common.base.model.SysAuthorityVO;
import com.phly.common.base.model.SysModuleVO;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.security.URLFilterInvocationSecurityMetadataSource;
import com.phly.common.util.ApplicationContextUtil;

/**
 * 系统角色服务类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Service
public class SysRoleService extends ServiceBase{
	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private SysRoleDao roleDao;

	/**
	 * 查询角色列表
	 * 
	 * @param roleVO
	 * @return 角色集合
	 */
	public ModelMap queryRoleList(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = this.roleDao.getRoleCount(roleVO);
		if(count > 0){
			map.put(ROWS, this.roleDao.queryRoleList(roleVO));
			map.put(TOTAL, count);
			map.put(CURRENT, roleVO.getPageNo());
			map.put(ROWCOUNT, roleVO.getPageSize());
		}
		return map;
	}

	/**
	 * 添加角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRole(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		if(this.roleDao.getRole(roleVO) == null){
			map.put("result", this.roleDao.addRole(roleVO));
		}else{
			map.put("result", false);
			map.put("remark", "该角色已经存在。");
		}
		return map;
	}
	
	/**
	 * 修改角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap updateRole(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		SysRoleVO paramVO = new SysRoleVO();
		paramVO.setRoleName(roleVO.getRoleName());
		SysRoleVO vo = this.roleDao.getRole(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getRoleId(), roleVO.getRoleId())){
			map.put("result", false);
			map.put("remark", "该角色已经存在");
		}else{
			map.put("result", this.roleDao.updateRole(roleVO));
		}
		return map;
	}
	
	/**
	 * 删除角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap delRole(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		boolean flag = false;
		String ids = roleVO.getRoleId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					roleVO = new SysRoleVO();
					roleVO.setRoleId(id);
					flag = this.roleDao.delRole(roleVO);
				}
			}
		}
		map.put("result", flag);
		return map;
	}
	
	/**
	 * 查看角色可以访问的模块
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRoleModuleInfo(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		map.put("selfAuth", transModuleKV(this.roleDao.getSelfModule(roleVO)));
		map.put("noSelfAuth", transModuleKV(this.roleDao.getNoSelfModule(roleVO)));
		return map;
	}
	
	/**
	 * 查询角色
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRole(SysRoleVO roleVO){
		ModelMap map = new ModelMap();
		SysRoleVO vo = this.roleDao.getRole(roleVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}

	/**
	 * 添加角色模块关系数据
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRoleModule(SysRoleVO roleVO){
		ModelMap map = new ModelMap();
		map.put("result", this.roleDao.addRoleModule(roleVO));
		return map;
	}
	
	/**
	 * 查看角色可以访问的权限
	 * @param roleVO
	 * @return
	 */
	public ModelMap getRoleAuthInfo(SysRoleVO roleVO) {
		ModelMap map = new ModelMap();
		map.put("selfAuth", transAuthKV(this.roleDao.getSelfAuth(roleVO)));
		map.put("noSelfAuth", transAuthKV(this.roleDao.getNoSelfAuth(roleVO)));
		return map;
	}

	/**
	 * 添加角色权限关系数据
	 * @param roleVO
	 * @return
	 */
	public ModelMap addRoleAuth(SysRoleVO roleVO){
		ModelMap map = new ModelMap();
		map.put("result", this.roleDao.addRoleAuth(roleVO));
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
	 * 转换模块kv
	 * @param modules
	 * @return
	 */
	private List<AuthorizationKV> transModuleKV(List<SysModuleVO> modules){
		List<AuthorizationKV> auths = new ArrayList<AuthorizationKV>();
		if(null != modules && modules.size() > 0){
			for (SysModuleVO module : modules) {
				auths.add(new AuthorizationKV(module.getModuleId(), module.getModuleName()));
			}
		}
		return auths;
	}

	/**
	 * 转换权限kv
	 * @param sysAuths
	 * @return
	 */
	private List<AuthorizationKV> transAuthKV(List<SysAuthorityVO> sysAuths){
		List<AuthorizationKV> auths = new ArrayList<AuthorizationKV>();
		if(null != sysAuths && sysAuths.size() > 0){
			for (SysAuthorityVO authVO : sysAuths) {
				auths.add(new AuthorizationKV(authVO.getAuthorityId(),authVO.getAuthorityName()));
			}
		}
		return auths;
	}
}
