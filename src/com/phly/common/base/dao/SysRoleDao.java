/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.SysAuthorityVO;
import com.phly.common.base.model.SysModuleVO;
import com.phly.common.base.model.SysRoleVO;

/**
 * 系统角色dao类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午4:51:46
 */
@Repository
public class SysRoleDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询角色列表
	 * 
	 * @param roleVO
	 * @return 角色集合
	 */
	public List<SysRoleVO> queryRoleList(SysRoleVO roleVO) {
		return this.queryList("sysRole.queryRoleList", roleVO,
				roleVO.getPageNo(), roleVO.getPageSize());
	}

	/**
	 * 查询角色总数
	 * 
	 * @param roleVO
	 * @return 角色集合
	 */
	public int getRoleCount(SysRoleVO roleVO) {
		return (Integer) this.getObject("sysRole.getRoleCount", roleVO);
	}
	
	/**
	 * 添加角色
	 * @param roleVO
	 * @return
	 */
	public boolean addRole(SysRoleVO roleVO) {
		boolean flag = false;
		try {
			this.insert("sysRole.addRole",roleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加角色失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 修改角色
	 * @param roleVO
	 * @return
	 */
	public boolean updateRole(SysRoleVO roleVO) {
		boolean flag = false;
		try {
			this.update("sysRole.updateRole",roleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改角色失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除角色
	 * @param roleVO
	 * @return
	 */
	public boolean delRole(SysRoleVO roleVO) {
		boolean flag = false;
		try {
			this.update("sysRole.delRole",roleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除角色失败,"+e);
		}
		return flag;
	}

	/**
	 * 根据角色名称或id获取角色vo
	 * @param roleVO
	 * @return
	 */
	public SysRoleVO getRole(SysRoleVO roleVO) {
		return (SysRoleVO) this.getObject("sysRole.getRole", roleVO);
	}
	
	/**
	 * 查看角色拥有的模块
	 * @param roleVO
	 * @return
	 */
	public List<SysModuleVO> getSelfModule(SysRoleVO roleVO) {
		return this.queryList("sysRole.getSelfModule", roleVO);
	}

	/**
	 * 查看自己未拥有的模块
	 * @param roleVO
	 * @return
	 */
	public List<SysModuleVO> getNoSelfModule(SysRoleVO roleVO) {
		return this.queryList("sysRole.getNoSelfModule", roleVO);
	}
	
	/**
	 * 添加角色模块关系数据
	 * @param roleVO
	 * @return
	 */
	public boolean addRoleModule(SysRoleVO roleVO) {
		boolean flag = false;
		try {
			this.delete("sysRole.delRoleModule", roleVO);
			List<SysModuleVO> modules = roleVO.getModules();
			if(null != modules && modules.size() > 0){
				for (SysModuleVO sysModuleVO : modules) {
					sysModuleVO.setRoleId(roleVO.getRoleId());
					this.insert("sysRole.addRoleModule", sysModuleVO);
				}
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加角色模块关系数据失败",e);
		}
		return flag;
	}
	

	/**
	 * 查看角色拥有的权限
	 * @param roleVO
	 * @return
	 */
	public List<SysAuthorityVO> getSelfAuth(SysRoleVO roleVO) {
		return this.queryList("sysRole.getSelfAuth", roleVO);
	}

	/**
	 * 查看自己未拥有的权限
	 * @param roleVO
	 * @return
	 */
	public List<SysAuthorityVO> getNoSelfAuth(SysRoleVO roleVO) {
		return this.queryList("sysRole.getNoSelfAuth", roleVO);
	}
	
	/**
	 * 添加角色权限关系数据
	 * @param roleVO
	 * @return
	 */
	public boolean addRoleAuth(SysRoleVO roleVO) {
		boolean flag = false;
		try {
			this.delete("sysRole.delRoleAuth", roleVO);
			List<SysAuthorityVO> auths = roleVO.getAuths();
			if(null != auths && auths.size() > 0){
				for (SysAuthorityVO authVO : auths) {
					authVO.setRoleId(roleVO.getRoleId());
					this.insert("sysRole.addRoleAuth", authVO);
				}
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加角色权限关系数据失败",e);
		}
		return flag;
	}
}
