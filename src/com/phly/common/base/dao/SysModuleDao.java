/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.SysModuleVO;

/**
 * 系统模块dao类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午4:51:46
 */
@Repository
public class SysModuleDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 获取指定用户下的模块信息
	 * 
	 * @param moduleVO
	 * @return 模块集合
	 */
	public List<SysModuleVO> getSysModuleByAccount(SysModuleVO moduleVO) {
		return this.queryList("sysModule.getSysModuleByAccount", moduleVO);
	}

	/**
	 * 查询所有系统模块
	 * @param moduleVO
	 * @return
	 */
	public List<SysModuleVO> querySysModules(SysModuleVO moduleVO) {
		return this.queryList("sysModule.querySysModules", moduleVO,moduleVO.getPageNo(),moduleVO.getPageSize());
	}
	
	/**
	 * 查询所有系统模块不分页
	 * @param moduleVO
	 * @return
	 */
	public List<SysModuleVO> querySysModulesNoPage(SysModuleVO moduleVO) {
		return this.queryList("sysModule.querySysModules", moduleVO);
	}

	/**
	 * 根据id获取模块
	 * @param moduleVO
	 * @return
	 */
	public SysModuleVO getModule(SysModuleVO moduleVO) {
		return (SysModuleVO) this.getObject("sysModule.getModule", moduleVO);
	}
	
	/**
	 * 获取模块总数
	 * @param moduleVO
	 * @return
	 */
	public int getSysModuleCount(SysModuleVO moduleVO) {
		return (Integer) this.getObject("sysModule.getSysModuleCount", moduleVO);
	}

	/**
	 * 添加模块
	 * @param moduleVO
	 * @return
	 */
	public boolean addModule(SysModuleVO moduleVO) {
		boolean flag = false;
		try {
			this.insert("sysModule.addModule",moduleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加模块失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 修改模块
	 * @param moduleVO
	 * @return
	 */
	public boolean updateModule(SysModuleVO moduleVO) {
		boolean flag = false;
		try {
			this.update("sysModule.updateModule",moduleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改模块失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除模块
	 * @param moduleVO
	 * @return
	 */
	public boolean delModule(SysModuleVO moduleVO) {
		boolean flag = false;
		try {
			this.update("sysModule.delModule",moduleVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除模块失败,"+e);
		}
		return flag;
	}
}
