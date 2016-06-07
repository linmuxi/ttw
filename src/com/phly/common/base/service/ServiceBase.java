package com.phly.common.base.service;

import org.springframework.ui.ModelMap;

public class ServiceBase {
	public static final String ROWS = "rows";

	public static final String TOTAL = "total";

	public static final String CURRENT = "current";

	public static final String ROWCOUNT = "rowCount";
	
	public ModelMap wrapDatatableResult(int iCount,Object list){
		ModelMap map = new ModelMap();
		map.put("recordsTotal", iCount);
		map.put("recordsFiltered", iCount);
		map.put("data", list);
		return map;
	}
	
}
