/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.SysModuleDao;
import com.phly.common.base.model.SysModuleVO;
import com.phly.common.base.model.SysUserVO;

/**
 * 系统模块服务类
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年5月21日 下午11:43:26
 */
@Service
public class SysModuleService extends ServiceBase{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private SysModuleDao moduleDao;
	
	/**
	 * 所有模块根节点id
	 */
	private final static String moduleRootId = "-1";

	/**
	 * 获取指定用户下的模块信息
	 * 
	 * @param moduleVO
	 * @return 模块集合
	 */
	@SuppressWarnings("unchecked")
	public List<SysModuleVO> getSysModuleByAccount() {
		//根据登录帐号查询
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication == null || StringUtils.equalsIgnoreCase(authentication.getPrincipal().toString(), 
				"anonymousUser")){
			logger.error("无法获取系统模块菜单，用户未登录!");
			return Collections.EMPTY_LIST;
		}
		//设置根节点模块id
		SysModuleVO moduleVO = new SysModuleVO();
		moduleVO.setAccount(((SysUserVO)authentication.getPrincipal()).getAccount());
		moduleVO.setModuleId(moduleRootId);
		return createSysModule(moduleVO);
	}

	/**
	 * 生成模块菜单数据
	 * @param moduleVO
	 * @return
	 */
	private List<SysModuleVO> createSysModule(SysModuleVO moduleVO){
		List<SysModuleVO> moduleList = this.moduleDao.getSysModuleByAccount(moduleVO);
		if(moduleList != null && moduleList.size() > 0){
			for (SysModuleVO module : moduleList) {
				module.setAccount(moduleVO.getAccount());
				module.setChildModuleList(createSysModule(module));
			}
		}
		return moduleList;
	}
	
	/**
	 * 获取模块树，目前只支持二级菜单
	 * @param moduleVO
	 * @return
	 */
	public ModelMap getModuleTree(SysModuleVO moduleVO){
		ModelMap map = new ModelMap();
		map.put("moduleTree", this.moduleDao.querySysModulesNoPage(moduleVO));
		return map;
	}
	
	/**
	 * 查询模块列表
	 * @param moduleVO
	 * @return 模块集合
	 */
	public ModelMap querySysModules(SysModuleVO moduleVO){
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = this.moduleDao.getSysModuleCount(moduleVO);
		if(count > 0){
			map.put(ROWS, this.moduleDao.querySysModules(moduleVO));
			map.put(TOTAL, count);
			map.put(CURRENT, moduleVO.getPageNo());
			map.put(ROWCOUNT, moduleVO.getPageSize());
		}
		return map;
	}
	
	/**
	 * 添加模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap addModule(SysModuleVO moduleVO) {
		ModelMap map = new ModelMap();
		map.put("result", this.moduleDao.addModule(moduleVO));
		return map;
	}

	/**
	 * 修改模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap updateModule(SysModuleVO moduleVO) {
		ModelMap map = new ModelMap();
		map.put("result", this.moduleDao.updateModule(moduleVO));
		return map;
	}

	/**
	 * 删除模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap delModule(SysModuleVO moduleVO) {
		ModelMap map = new ModelMap();
		boolean flag = false;
		String ids = moduleVO.getModuleId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					moduleVO = new SysModuleVO();
					moduleVO.setModuleId(id);
					flag = this.moduleDao.delModule(moduleVO);
				}
			}
		}
		map.put("result", flag);
		return map;
	}
	
	/**
	 * 编辑模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap formModule(SysModuleVO moduleVO) {
		ModelMap map = new ModelMap();
		
		if(null == moduleVO){
			map.put("result", false);
			map.put("remark", "对象为null");
			return map;
		}
		
		if(StringUtils.isNotEmpty(moduleVO.getModuleId())){
			//修改
			return this.updateModule(moduleVO);
		}else{
			//新增
			return this.addModule(moduleVO);
		}
	}
	
	/**
	 * 根据模块ID获取模块
	 * @param moduleVO
	 * @return
	 */
	public ModelMap getModule(SysModuleVO moduleVO) {
		ModelMap map = new ModelMap();
		SysModuleVO vo = this.moduleDao.getModule(moduleVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}
}
