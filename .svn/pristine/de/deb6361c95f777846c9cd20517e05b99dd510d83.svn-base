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

import com.phly.common.base.dao.SysSupplierDao;
import com.phly.common.base.model.SysSupplierVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.RequestContextUtil;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月9日 下午7:31:33
 */
@Service
public class SysSupplierService extends ServiceBase {

	@Resource
	private SysSupplierDao sysSupplierDao;
	
	/**
	 * 查询供应商列表
	 * @param supplierVO
	 * @return
	 */
	public ModelMap querySupplierList(SysSupplierVO supplierVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.sysSupplierDao.getSupplierCount(supplierVO);
		if(count > 0){
			model.put(ROWS, this.sysSupplierDao.querySupplierList(supplierVO));
			model.put(TOTAL, count);
			model.put(CURRENT, supplierVO.getPageNo());
			model.put(ROWCOUNT, supplierVO.getPageSize());
		}
		return model;
	}
	
	
	
	/**
	 * 根据供应商ID查询供应商
	 * @param supplierVO
	 * @return
	 */
	public ModelMap getSupplier(SysSupplierVO supplierVO){
		ModelMap map = new ModelMap();
		SysSupplierVO vo = this.sysSupplierDao.getSupplier(supplierVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}
	
	
	/**
	 * 添加供应商信息
	 * @param supplierVO
	 * @return
	 */
	public ModelMap addSupplier(SysSupplierVO supplierVO){
		ModelMap model= new ModelMap();
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		supplierVO.setIsDel(1);
		supplierVO.setCreator(userVO.getAccount());
		supplierVO.setCreateDate(new Timestamp(new Date().getTime()));
		supplierVO.setLastUpdater(userVO.getAccount());
		supplierVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
		boolean isSuccess = this.sysSupplierDao.addSupplier(supplierVO);
		if(isSuccess){
			
		}
		model.put("result", isSuccess);
		return model;
	}
	
	
	/**
	 * 修改部门
	 * @param supplierVO
	 * @return
	 */
	public ModelMap updateSupplier(SysSupplierVO supplierVO) {
		ModelMap model = new ModelMap();
		SysSupplierVO paramVO = new SysSupplierVO();
		paramVO.setSupNo(supplierVO.getSupNo());//供应商编号
		SysSupplierVO vo = this.sysSupplierDao.getSupplier(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getSupplierId(), supplierVO.getSupplierId())){
			model.put("result", false);
			model.put("remark", "该供应商已经存在");
		}else{
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			supplierVO.setCreator(userVO.getAccount());
			supplierVO.setCreateDate(new Timestamp(new Date().getTime()));
			supplierVO.setLastUpdater(userVO.getAccount());
			supplierVO.setLastUpdateDate(new Timestamp(new Date().getTime()));
			model.put("result", this.sysSupplierDao.updateSupplier(supplierVO));
		}
		return model;
	}
	
	/**
	 * 删除供应商
	 * @param supplierVO
	 * @return
	 */
	public ModelMap delSupplier(SysSupplierVO supplierVO) {
		ModelMap model = new ModelMap();
		model.put("result", this.sysSupplierDao.delSupplier(supplierVO));
		return model;
	}
	
	
}
