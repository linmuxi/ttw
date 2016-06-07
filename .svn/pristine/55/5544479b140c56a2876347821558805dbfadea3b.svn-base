package com.phly.ttw.manage.supplier.ws;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;

import com.phly.common.util.ApplicationContextUtil;
import com.phly.common.util.ObjectConvertToMap;
import com.phly.ttw.manage.supplier.facade.SupplierFacade;
import com.phly.ttw.manage.supplier.model.SupplierModel;
import com.phly.ttw.manage.supplier.model.SupplierVo;

@WebService(endpointInterface = "com.phly.ttw.manage.supplier.ws.ISupplierWS", serviceName = "SupplierWS")
public class SupplierWSImpl implements ISupplierWS{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	SupplierFacade facade =(SupplierFacade)ApplicationContextUtil.getApplicationContext().getBean(SupplierFacade.class);

	@Override
	public String insertSupplierToWwt(SupplierModel supplier) {
		logger.info("ws调用新增供应商开始");
		StringBuffer buffer = new StringBuffer();
		HashMap<String,Object> supplierMap =  ObjectConvertToMap.toMap(supplier);
		SupplierVo supplierVo= (SupplierVo) ObjectConvertToMap.toJavaBean(new SupplierVo(), supplierMap);
		ModelMap resultMap =  facade.addSupplier_WS(supplierVo);
		Boolean flag = (Boolean)resultMap.get("result");
		buffer.append(flag);
		buffer.append("&&");
		if(flag){
			buffer.append(resultMap.get("account"));
			buffer.append("&&");
			buffer.append(resultMap.get("password"));
		}else{
			buffer.append(resultMap.get("remark"));
		}
		logger.info("ws调用新增供应商结束");
		return buffer.toString();
		
		
	}

	@Override
	public boolean updateSupplierToWwt(SupplierModel supplier) {
		logger.info("ws调用更新供应商开始");
		HashMap<String,Object> supplierMap =  ObjectConvertToMap.toMap(supplier);
		SupplierVo supplierVo = (SupplierVo) ObjectConvertToMap.toJavaBean(new SupplierVo(), supplierMap);
		Boolean flag = (Boolean) facade.updateSupplier_WS(supplierVo).get("result");
		logger.info("ws调用更新供应商结束");
		return flag;
	}

	@Override
	public List<SupplierModel> getSupplierFromWwtByDate(String date) {
		logger.info("ws调用供应商查询开始");
		List<SupplierModel> maps = facade.findSupplierByDate(date);
		logger.info("ws调用供应商查询结束");
		return maps;
	}
	
	
	public static SupplierVo ConvertMapToSupplier(Map<String, String> map){
		if(map==null) return null;
		SupplierVo vo = new SupplierVo();
		vo.setSupplierId(map.get("supplierId"));
		vo.setSupAddress(map.get("supAddress"));
		vo.setSupEmail(map.get("supEmail"));
		vo.setSupFaxes(map.get("supFaxes"));
		vo.setSupName(map.get("supName"));
		vo.setSupNo(map.get("supNo"));
		vo.setSupPhone(map.get("supPhone"));
		String state = map.get("supState");
		if(state!=null){
			vo.setSupState(Integer.parseInt(state));	
		}
		String type = map.get("supType");
		if(type!=null){
			vo.setSupType(Integer.parseInt(type));
		}
		vo.setBusLicense(map.get("busLicense"));
		vo.setBankAccountName(map.get("bankAccountName"));
		vo.setBankAccountNo(map.get("bankAccountNo"));
		vo.setBankAddress(map.get("bankAddress"));
		
		vo.setLinkPeopleAddress(map.get("linkPeopleAddress"));
		vo.setLinkPeopleEmail(map.get("linkPeopleEmail"));
		vo.setLinkPeopleName(map.get("linkPeopleName"));
		vo.setLinkPeoplePhone(map.get("linkPeoplePhone"));
		vo.setLinkPeopleQQ(map.get("linkPeopleQQ"));
		
		vo.setCmbPeopleName(map.get("cmbPeopleName"));
		vo.setContractCode(map.get("contractCode"));
		String createDate = map.get("createDate");
		if(!StringUtils.isBlank(createDate)){
			vo.setCreateDate(null);
		}
		vo.setCreator(map.get("creator"));
		
		String isDel = map.get("isDel");
		if(!StringUtils.isBlank(isDel)){
			vo.setIsDel(Integer.parseInt(isDel));
		}
		String isLocked = map.get("isLocked");
		if(!StringUtils.isBlank(isLocked)){
			vo.setIsLocked(Integer.parseInt(isLocked));
		}
		vo.setRemark(map.get("remark"));
		vo.setUpdater(map.get("updater"));
		String updateTime = map.get("updateTime");
		if(!StringUtils.isBlank(updateTime)){
			vo.setUpdateTime(null);
		}
		return vo;
	}
	
	


}
