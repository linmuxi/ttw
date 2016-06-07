/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.sql.Timestamp;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysResourceDao;
import com.phly.common.base.model.SysResourceVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.RequestContextUtil;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月24日 下午2:58:04
 */

@Service
public class SysResourceService extends ServiceBase{

	@Resource
	private SysResourceDao resourceDao;
	
	


	
	public ModelMap queryResourceList(SysResourceVO resourceVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.resourceDao.getResourceCount(resourceVO);
		if(count > 0){
			model.put(ROWS, this.resourceDao.queryResourceList(resourceVO));
			model.put(TOTAL, count);
			model.put(CURRENT, resourceVO.getPageNo());
			model.put(ROWCOUNT, resourceVO.getPageSize());
		}
		return model;
	}
	
	
	/**
	 * 添加资源
	 * @param resourceVO
	 * @return
	 */
	public ModelMap addResource(SysResourceVO resourceVO){
		ModelMap model= new ModelMap();
		if(this.resourceDao.getResource(resourceVO) == null){
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			resourceVO.setCreator(userVO.getAccount());
			resourceVO.setCreateDate(new Timestamp(new Date().getTime()));
			resourceVO.setLastUpdater(userVO.getAccount());
			resourceVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
			model.put("result", this.resourceDao.addResource(resourceVO));
		}else{
			model.put("result", false);
			model.put("remark", "该角色已经存在。");
		}
		return model;
	}
	
	/**
	 * 根据资源ID查询资源信息
	 * @param resourceVO
	 * @return
	 */
	public ModelMap getResource(SysResourceVO resourceVO){
		ModelMap map = new ModelMap();
		SysResourceVO vo = this.resourceDao.getResource(resourceVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	
	
	}
	
	
	/**
	 * 修改资源
	 * @param roleVO
	 * @return
	 */
	public ModelMap updateResource(SysResourceVO resourceVO) {
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		resourceVO.setCreator(userVO.getAccount());
		resourceVO.setCreateDate(new Timestamp(new Date().getTime()));
		resourceVO.setLastUpdater(userVO.getAccount());
		resourceVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
		model.put("result", this.resourceDao.updateResource(resourceVO));
		return model;
	}
	
	/**
	 * 删除资源
	 * @param roleVO
	 * @return
	 */
	public ModelMap delResource(SysResourceVO resourceVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = resourceVO.getResourceId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					resourceVO = new SysResourceVO();
					resourceVO.setResourceId(id);
					flag = this.resourceDao.delResource(resourceVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
}
