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
import com.phly.common.base.model.SysResourceVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月19日 上午 11:51:09
 */

@Repository
public class SysAuthorityDao extends MyBatisDao{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询权限列表
	 * @param authorityVO
	 * @return
	 */
	public List<SysAuthorityVO> queryAuthorityList(SysAuthorityVO authorityVO){
		return this.queryList("sysAuthority.queryAuthorityList", authorityVO,authorityVO.getPageNo(),authorityVO.getPageSize());
	}
	
	
	/**
	 * 查询权限总数
	 * @param authorityVO
	 * @return
	 */
	public int getAuthorityCount (SysAuthorityVO authorityVO){
		return (Integer) this.getObject("sysAuthority.getAuthorityCount", authorityVO);
	}
	
	
	/**
	 * 根据权限ID或者权限名称查询权限信息
	 * @param authorityVO
	 * @return
	 */
	public SysAuthorityVO getAuthority(SysAuthorityVO authorityVO){
		return (SysAuthorityVO) this.getObject("sysAuthority.getAuthority", authorityVO);
	}
	
	
	/**
	 * 添加权限信息
	 * @param authorityVO
	 * @return
	 */
	public boolean addAuthority(SysAuthorityVO authorityVO){
		boolean flag = false;
		try {
			this.insert("sysAuthority.addAuthority",authorityVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "addAuthority  添加权限失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改权限信息
	 * @param authorityVO
	 * @return
	 */
	public boolean updateAuthority(SysAuthorityVO authorityVO) {
		boolean flag = false;
		try {
			this.update("sysAuthority.updateAuthority",authorityVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "updateAuthority  修改权限失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除权限
	 * @param authorityVO
	 * @return
	 */
	public boolean delAuthority(SysAuthorityVO authorityVO) {
		boolean flag = false;
		try {
			this.delete("sysAuthority.delAuthority",authorityVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "delAuthority  删除权限失败,"+e);
		}
		return flag;
	}

	/**
	 * 查看权限拥有的资源
	 * @param roleVO
	 * @return
	 */
	public List<SysResourceVO> getSelfResource(SysAuthorityVO authorityVO) {
		return this.queryList("sysAuthority.getSelfResource", authorityVO);
	}

	/**
	 * 查看权限未拥有的资源
	 * @param roleVO
	 * @return
	 */
	public List<SysResourceVO> getNoSelfResource(SysAuthorityVO authorityVO) {
		return this.queryList("sysAuthority.getNoSelfAuth", authorityVO);
	}
	
	
	/**
	 * 添加权限对应的资源信息
	 * @param authorityVO
	 * @return
	 */
	public boolean addAuthorityAuth(SysAuthorityVO authorityVO){
		boolean flag = false;
		try {
			this.delete("sysAuthority.delAuthorityResource", authorityVO);
			List<SysResourceVO> resources = authorityVO.getResources();
			if(null != resources && resources.size() > 0){
				for (SysResourceVO sysResourceVO : resources) {
					sysResourceVO.setAuthorityId(authorityVO.getAuthorityId());
					this.insert("sysAuthority.addAuthorityResource", sysResourceVO);
				}
			}
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加权限资源关系数据失败",e);
		}
		return flag;
	
	}
}
