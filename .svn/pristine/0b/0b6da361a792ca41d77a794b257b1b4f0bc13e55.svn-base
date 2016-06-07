package com.phly.ttw.manage.supplier.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.supplier.model.SupplierModel;
import com.phly.ttw.manage.supplier.model.SupplierVo;

/***
 * 供应商DAO
 * 
 * @author TH
 * 
 */
@Repository
public class SupplierDao extends MyBatisDao {

	private static final Logger logger = LoggerFactory
			.getLogger(SupplierDao.class);

	/**
	 * 查询供应商列表
	 * 
	 * @param supplierVo
	 * @return 供应商集合
	 */
	public List<SupplierVo> querySupplierList(SupplierVo supplierVo) {
		return this.queryList("supplier.querySupplierList", supplierVo,
				supplierVo.getPageNo(), supplierVo.getPageSize());
	}

	/**
	 * 查询供应商总数
	 * 
	 * @param supplierVo
	 * @return 供应商集合
	 */
	public int getSupplierCount(SupplierVo supplierVo) {
		return (Integer) this
				.getObject("supplier.getSupplierCount", supplierVo);
	}

	/**
	 * 添加供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean addSupplier(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.insert("supplier.addSupplier", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加供应商失败," + e);
		}
		return flag;
	}
	
	
	/**
	 * 添加供应商_审批修改
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean addSupplierForUpdate(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.insert("supplier.addSupplierForUpdate", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加供应商失败," + e);
		}
		return flag;
	}
	
	/**
	 * 查询供应商_审批修改
	 * 
	 * @param supplierVo
	 * @return
	 */
	public SupplierVo getSupplierForUpdate(SupplierVo supplierVo) {
		return (SupplierVo) this.getObject("supplier.getSupplierForUpdate", supplierVo);
	}

	/**
	 * 修改供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean updateSupplier_WS(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.update("supplier.updateSupplierBySupNo", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改供应商失败," + e);
		}
		return flag;
	}
	
	/**
	 * 修改供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean updateSupplier(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.update("supplier.updateSupplier", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("修改供应商失败," + e);
		}
		return flag;
	}

	
	/**
	 * 删除供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean delSupplierForUpdate(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.update("supplier.delSupplierForUpdate", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除供应商失败," + e);
		}
		return flag;
	}
	
	/**
	 * 删除供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public boolean delSupplier(SupplierVo supplierVo) {
		boolean flag = false;
		try {
			this.update("supplier.delSupplier", supplierVo);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除供应商失败," + e);
		}
		return flag;
	}

	/**
	 * 根据供应商id获取供应商
	 * 
	 * @param supplierVo
	 * @return
	 */
	public SupplierVo getSupplier(SupplierVo supplierVo) {
		return (SupplierVo) this.getObject("supplier.getSupplier", supplierVo);
	}

	/**
	 * 合同编码是否已经存在
	 * 
	 * @param contractCode
	 * @return true:存在，反之
	 */
	public boolean existContractCode(String contractCode) {
		String string = this.getObject("supplier.existContractCode",contractCode).toString();
		return Integer.parseInt(string) > 1;
	}

	/***
	 * 返回大于等于供应商最后更新的数据
	 * 
	 * @param date
	 *            YYYY-MM-DD
	 * @return
	 */
	public List<SupplierModel> findSupplierByDate(String date) {
		List<SupplierModel> supplierVos = this.queryList("supplierModel.findSupplierByDate", date);
		return supplierVos;
	}

	public SupplierVo findSupplierByUserId(SupplierVo supplierVo) {
		return (SupplierVo) this.getObject("supplier.getSupplierByUserId", supplierVo);
	}

	public SupplierVo getSupplierBySupNo(String supNo) {
		return (SupplierVo) this.getObject("supplier.getSupplierBySupNo", supNo);
	}

	public boolean existSupNo(String supNo) {
		return getSupplierBySupNo(supNo)!=null;
	}

}
