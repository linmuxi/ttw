package com.phly.ttw.manage.supplier.facade;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.SysUserService;
import com.phly.ttw.manage.supplier.model.SupplierModel;
import com.phly.ttw.manage.supplier.model.SupplierVo;
import com.phly.ttw.manage.supplier.service.SupplierService;


/***
 * 供应商代理类
 * @author TH
 */
@Component
public class SupplierFacade {
	
	@Resource
	private SupplierService supplierService;
	
	@Resource
	private SysUserService sysUserService;
	
	public SupplierVo getSupplierForUpdate(SupplierVo supplierVo){
		return supplierService.getSupplierForUpdate(supplierVo);
	}

	public ModelMap querySupplierList(SupplierVo supplierVo) {
		return supplierService.querySupplierList(supplierVo);
	}
	
	public SupplierVo findSupplierBySupplierId(String supplierId) {
		return supplierService.findSupplierBySupplierId(supplierId);
	}

	public ModelMap addSupplier(SupplierVo supplierVo) {
		return supplierService.addSupplier(supplierVo);
	}

	public ModelMap updateSupplier(SupplierVo supplierVo) {
		return supplierService.updateSupplier(supplierVo,true);
	}

	public ModelMap delSupplier(SupplierVo supplierVo) {
		return supplierService.delSupplier(supplierVo);
	}
	
	public ModelMap updateSupplierState(SupplierVo supplierVo) {
		SupplierVo vo = supplierService.findSupplierBySupplierId(supplierVo.getSupplierId());
		vo.setSupState(supplierVo.getSupState());
		return supplierService.updateSupplier(vo,false);
	}

	public SupplierVo findSupplierByUserId(SupplierVo supplierVo) {
		return supplierService.findSupplierByUserId(supplierVo);
	}

	public boolean updateSupplierUserPwd(SysUserVO sysUserVO) {
		return sysUserService.updateSupplierUserPwd(sysUserVO);
	}

	public ModelMap resertPwd(String supNo, String supEmail) {
		return supplierService.resertPwd(supNo,supEmail);
	}
	
	public ModelMap addSupplier_WS(SupplierVo supplierVo){
		return supplierService.addSupplier_WS(supplierVo);
	}
	
	public List<SupplierModel> findSupplierByDate(String date){
		return supplierService.findSupplierByDate(date);
	}
	
	public ModelMap updateSupplier_WS(SupplierVo supplierVo){
		return supplierService.updateSupplier_WS(supplierVo);
	}
	
	

}
