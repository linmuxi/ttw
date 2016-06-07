package com.phly.ttw.manage.supplier.ws;

import java.util.List;

import javax.jws.WebService;

import com.phly.ttw.manage.supplier.model.SupplierModel;


/***
 * TTW供应商对外接口  tips:主要用于数据同步（TTW与内部管理）
 * @author TH
 *
 */
@WebService
public interface ISupplierWS {
	
	/***
	 * 新增   实时推送数据到TTW
	 * @param map
	 * @return 成功：TRUE  失败：FALSE
	 */
	public String insertSupplierToWwt(SupplierModel supplier);
	
	
	/***
	 * 变更   实时推送数据到TTW
	 * @param map
	 * @return 成功：TRUE  失败：FALSE
	 */
	public boolean updateSupplierToWwt(SupplierModel supplier);
	
	
	/***
	 * 获取TTW大于等于最后更新时间的最新数据  
	 * tips：果参数为空则返回null
	 * @param date YYYY-MM-DD
	 * @return list
	 */
	public List<SupplierModel> getSupplierFromWwtByDate(String date);

}
