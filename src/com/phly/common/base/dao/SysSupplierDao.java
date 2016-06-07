/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.SysSupplierVO;

/**
 *
 * @Description: TODO
 * @author Administrator
 * @since 2015年6月9日 下午7:02:17
 */
@Repository
public class SysSupplierDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询供应商列表
	 * @param supplierVO
	 * @return
	 */
	public List<SysSupplierVO> querySupplierList(SysSupplierVO supplierVO){
		return this.queryList("sysSupplier.querySysSupplierList", supplierVO,supplierVO.getPageNo(),supplierVO.getPageSize());
	}
	
	
	
	/**
	 * 查询供应商总数
	 * @param supplierVO
	 * @return
	 */
	public int getSupplierCount (SysSupplierVO supplierVO){
		return (Integer) this.getObject("sysSupplier.getSupplierCount", supplierVO);
	}
	
	
	/**
	 * 根据供应商ID或者供应商名称查询供应商信息
	 * @param supplierVO
	 * @return
	 */
	public SysSupplierVO getSupplier(SysSupplierVO supplierVO){
		return (SysSupplierVO) this.getObject("sysSupplier.getSupplier", supplierVO);
	}
	
	
	/**
	 * 添加供应商信息
	 * @param supplierVO
	 * @return
	 */
	public boolean addSupplier(SysSupplierVO supplierVO){
		boolean flag = false;
		try {
			this.insert("sysSupplier.addSupplier",supplierVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "addSupplier  添加供应商失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 修改供应商信息
	 * @param supplierVO
	 * @return
	 */
	public boolean updateSupplier(SysSupplierVO supplierVO) {
		boolean flag = false;
		try {
			this.update("sysSupplier.updateSupplier",supplierVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "updateSupplier  修改供应商信息失败,"+e);
		}
		return flag;
	}
	
	/**
	 * 删除供应商
	 * @param supplierVO
	 * @return
	 */
	public boolean delSupplier(SysSupplierVO supplierVO) {
		boolean flag = false;
		try {
			this.delete("sysSupplier.delSupplier",supplierVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(this.getClass().getName() + "delSupplier  删除供应商信息失败,"+e);
		}
		return flag;
	}
}
