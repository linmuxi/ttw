/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysAuthorityDao;
import com.phly.common.base.model.AuthorizationKV;
import com.phly.common.base.model.SysAuthorityVO;
import com.phly.common.base.model.SysResourceVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.security.URLFilterInvocationSecurityMetadataSource;
import com.phly.common.util.ApplicationContextUtil;
import com.phly.common.util.RequestContextUtil;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月19日 下午2:58:04
 */

@Service
public class SysAuthorityService extends ServiceBase {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private SysAuthorityDao authorityDao;

	public ModelMap queryAuthorityList(SysAuthorityVO authorityVO) {
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.authorityDao.getAuthorityCount(authorityVO);
		if (count > 0) {
			model.put(ROWS, this.authorityDao.queryAuthorityList(authorityVO));
			model.put(TOTAL, count);
			model.put(CURRENT, authorityVO.getPageNo());
			model.put(ROWCOUNT, authorityVO.getPageSize());
		}
		return model;
	}

	/**
	 * 查询所有权限--下拉框
	 * 
	 * @return
	 */
	public List<SysAuthorityVO> queryAllAuthority(SysAuthorityVO authorityVO) {
		authorityVO.setPageSize(Integer.MAX_VALUE);
		List<SysAuthorityVO> childAuthoritys = this.authorityDao
				.queryAuthorityList(authorityVO);
		return childAuthoritys;
	}

	/**
	 * 添加权限
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap addAuthority(SysAuthorityVO authorityVO) {
		ModelMap model = new ModelMap();
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		authorityVO.setIsDel(0);
		authorityVO.setCreator(userVO.getAccount());
		authorityVO.setCreateDate(new Timestamp(new Date().getTime()));
		authorityVO.setLastUpdater(userVO.getAccount());
		authorityVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
		model.put("result", this.authorityDao.addAuthority(authorityVO));
		return model;
	}

	/**
	 * 修改权限
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap updateAuthority(SysAuthorityVO authorityVO) {
		ModelMap model = new ModelMap();
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		authorityVO.setLastUpdater(userVO.getAccount());
		authorityVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
		model.put("result", this.authorityDao.updateAuthority(authorityVO));

		return model;
	}

	/**
	 * 根据权限ID查询权限信息
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap getAuthority(SysAuthorityVO authorityVO) {
		ModelMap map = new ModelMap();
		SysAuthorityVO vo = this.authorityDao.getAuthority(authorityVO);
		if (vo != null) {
			map.put("sucflag", true);
			map.put("bean", vo);
		} else {
			map.put("sucflag", false);
		}
		return map;

	}

	/**
	 * 删除权限
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap delAuthority(SysAuthorityVO authorityVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = authorityVO.getAuthorityId();
		//
		if (StringUtils.isNotEmpty(ids)) {
			// 批量删除
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (StringUtils.isNotEmpty(id)) {
					authorityVO = new SysAuthorityVO();
					authorityVO.setAuthorityId(id);
					flag = this.authorityDao.delAuthority(authorityVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}

	/**
	 * 查看权限可以访问的资源
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap getAuthorityResourceInfo(SysAuthorityVO authorityVO) {
		ModelMap map = new ModelMap();
		map.put("selfAuth",
				transResourceKV(this.authorityDao.getSelfResource(authorityVO)));
		map.put("noSelfAuth", transResourceKV(this.authorityDao
				.getNoSelfResource(authorityVO)));
		return map;
	}

	/**
	 * 转换资源kv
	 * 
	 * @param sysAuths
	 * @return
	 */
	private List<AuthorizationKV> transResourceKV(
			List<SysResourceVO> sysResources) {
		List<AuthorizationKV> resources = new ArrayList<AuthorizationKV>();
		if (null != sysResources && sysResources.size() > 0) {
			for (SysResourceVO sysResource : sysResources) {
				resources.add(new AuthorizationKV(sysResource.getResourceId(),
						sysResource.getResourceName()));
			}
		}
		return resources;
	}

	/**
	 * 添加权限对应的资源信息
	 * 
	 * @param authorityVO
	 * @return
	 */
	public ModelMap addAuthorityAuth(SysAuthorityVO authorityVO) {
		ModelMap map = new ModelMap();
		map.put("result", this.authorityDao.addAuthorityAuth(authorityVO));
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
}
