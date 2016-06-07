/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.util;

import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 属性文件帮助类
 * 
 * @Description: 解析config.properties文件并提供获取值方法
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 * @deprecated 这个类不建议再使用，全局配置文件config.properties全部通过获取propertiesFactoryBean对象来获的Properties对象
 */
@Deprecated
public class PropertiesUtil {

	private static final Logger LOGGER = LoggerFactory
			.getLogger(PropertiesUtil.class);
	private static final Properties prop = new Properties();
	private static final PropertiesUtil util = new PropertiesUtil();

	private PropertiesUtil() {
		try {
			prop.load(PropertiesUtil.class.getClassLoader()
					.getResourceAsStream(
							"com/phly/common/resource/config.properties"));
		} catch (IOException e) {
			e.printStackTrace();
			LOGGER.error("加载properties资源失败");
		}
	}

	public static PropertiesUtil getInstance() {
		return util;
	}

	/**
	 * 根据指定key获取value
	 * 
	 * @param key
	 * @return
	 */
	public String getValue(String key) {
		return prop.getProperty(key);
	}
}
