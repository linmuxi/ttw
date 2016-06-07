/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.interceptor;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import net.sf.ehcache.Element;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.context.ServletContextAware;

import com.phly.common.base.facade.DictFacade;
import com.phly.common.util.AppKeys;
import com.phly.common.util.DictUtil;

/**
 *
 * @Description: TODO
 * @author wanglong
 * @since 2015年10月18日 下午8:25:32
 */

public class InitDataListener implements InitializingBean, ServletContextAware{
	
	@Resource
	private DictFacade dictFacade;

	@Override
	public void setServletContext(ServletContext context) {
		List<Map<String, Object>> dictLst = this.dictFacade.queryDictList();
		Element element = new Element(AppKeys.TTW_CACHEKEY,dictLst);
		DictUtil.put(element);
	}

	@Override
	public void afterPropertiesSet() throws Exception {}

}
