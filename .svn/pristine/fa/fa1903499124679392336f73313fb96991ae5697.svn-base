/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.util.Properties;

import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.exceptionhandler.exception.BaseException;

/**
 *webservice客户端调用工具类
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月30日 下午3:22:15
 */
public class WSUtils {

	private static final Logger logger = LoggerFactory.getLogger(WSUtils.class);
	
	
	public static JaxWsProxyFactoryBean getProxyFactory(String wsAddressKey,Class<?> serviceClass){
		JaxWsProxyFactoryBean  factory = null;
		try {
			Properties properties =  (Properties) ApplicationContextUtil.getApplicationContext().getBean("propertiesFactoryBean");
			String address = properties.getProperty(wsAddressKey);
			factory = new JaxWsProxyFactoryBean();
			factory.setServiceClass(serviceClass);
			factory.setAddress(address);
		} catch (Exception e) {
			logger.error(WSUtils.class + "  getProxyFactory 异常：" + e );
			throw new BaseException(WSUtils.class + " getProxyFactory  异常：" + e);
		}
		return factory;
	}
}
