/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.exceptionhandler.exception.BaseException;

/**
 *供应商定时任务同步数据
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月23日 下午12:12:43
 */
public class SynSupplierTaskService implements SynTaskService {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private SysSupplierService sysSupplierService;

	@Override
	public void createTask() {
		try {
			logger.info(this.getClass().getName() + " createTask  同步供应商信息定时任务Start.........");
			//Date now = new Date();
			//String dayBefore = DateUtil.getDayBefore(now);//获取当前时间的前一天
			//JaxWsProxyFactoryBean  factory = WSUtils.getProxyFactory(AppKeys.SUPPLIER_WS_ADDRESS, ISupplierWS.class);
			// supplierWS = (ISupplierWS) factory.create();
	
			//ArrayList<HashMap<String, Object>> resultList = supplierWS.getSupplierFromWwtByDate(dayBefore);
			//int resultCount = null != resultList && resultList.size() > 0 ? resultList.size() : 0;

			//List<HashMap<String, Object>> resultList = supplierWS.getSupplierFromWwtByDate(dayBefore);
			//int resultCount = null != resultList && resultList.size() > 0 ? resultList.size() : 0;

			/*for (int i = 0; i < resultCount; i++) {
				HashMap supplierMap = resultList.get(i);
				SupplierVO supplierVO = ObjectConvertToMap.toJavaBean(supplierVO, supplierMap);
				sysSupplierService.updateSupplier(supplierVO);
			}*/
			logger.info(this.getClass().getName() + " createTask  同步供应商信息定时任务end.........");
		} catch (Exception e) {//同步异常
			logger.error(this.getClass().getName() + " createTask  异常：" + e);
			throw new BaseException(this.getClass().getName() + " createTask  异常：" + e);
		}
	}

}
