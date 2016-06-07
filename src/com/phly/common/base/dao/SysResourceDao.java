/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.SysResourceVO;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年5月24日 下午2:51:09
 */

@Repository
public class SysResourceDao extends MyBatisDao{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询资源列表
	 * @param resourceVO
	 * @return
	 */
	public List<SysResourceVO> queryResourceList(SysResourceVO resourceVO){
		return this.queryList("sysResource.queryResourceList", resourceVO,resourceVO.getPageNo(),resourceVO.getPageSize());
	}
	
	
	/**
	 * 查询资源总数
	 * @param resourceVO
	 * @return
	 */
	public int getResourceCount (SysResourceVO resourceVO){
		return (Integer) this.getObject("sysResource.getResoureCount", resourceVO);
	}
	
	
	/**
	 * 根据资源ID或者资源名称查询资源信息
	 * @param resourceVO
	 * @return
	 */
	public SysResourceVO getResource(SysResourceVO resourceVO){
		return (SysResourceVO) this.getObject("sysResource.getResource", resourceVO);
	}
	
	
	/**
	 * 
	 * @param resourceVO
	 * @return
	 */
	public boolean addResource(SysResourceVO resourceVO){
		boolean flag = false;
		try {
			this.insert("sysResource.addResource",resourceVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加资源失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改资源
	 * @param resourceVO
	 * @return
	 */
	public boolean updateResource(SysResourceVO resourceVO) {
		boolean flag = false;
		try {
			this.update("sysResource.updateResource",resourceVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改资源失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除资源
	 * @param resourceVO
	 * @return
	 */
	public boolean delResource(SysResourceVO resourceVO) {
		boolean flag = false;
		try {
			this.delete("sysResource.delResource",resourceVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除资源失败,"+e);
		}
		return flag;
	}
	
}
