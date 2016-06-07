/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.filter;

import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.blocking.LockTimeoutException;
import net.sf.ehcache.constructs.web.AlreadyCommittedException;
import net.sf.ehcache.constructs.web.AlreadyGzippedException;
import net.sf.ehcache.constructs.web.filter.FilterNonReentrantException;
import net.sf.ehcache.constructs.web.filter.SimplePageCachingFilter;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.util.ApplicationContextUtil;

/**
 * 自定义页面缓存过滤器
 * 
 * @Description: 根据请求路径和get参数进行页面缓存，要缓存的页面需要在xml中进行配置
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
public class PageEhCacheFilter extends SimplePageCachingFilter {

	private final static Logger LOGGER = LoggerFactory
			.getLogger(PageEhCacheFilter.class);
	// ehcache配置路径
	private final static String CACHE_FILE_PATH = "ehCacheFilePath";
	private String ehCacheFilePath;

	// 需要缓存的文件路径key
	private final static String FILTER_URL_PATTERNS = "patterns";
	//所有需要缓存的url集合
	private static String[] cacheURLs;
	
	/**
	 * 初始化ehcache文件路径、需要缓存页面地址
	 */
	private void init() {
		ehCacheFilePath = ((Properties) ApplicationContextUtil
				.getBean("propertiesFactoryBean")).getProperty(CACHE_FILE_PATH);
		if (StringUtils.isEmpty(ehCacheFilePath)) {
			LOGGER.info("未配置ehcache文件路径，使用默认文件");
		}

		String patterns = filterConfig.getInitParameter(FILTER_URL_PATTERNS);
		if (StringUtils.isEmpty(patterns)) {
			LOGGER.info("未配置需要缓存的页面，对所有请求不缓存");
		} else {
			cacheURLs = StringUtils.split(patterns, ",");
		}
	}
	
	/**
	 * 初始化操作
	 * @param filterConfig
	 * @throws CacheException
	 * @see net.sf.ehcache.constructs.web.filter.CachingFilter#doInit(javax.servlet.FilterConfig)
	 */
	@Override
	public void doInit(FilterConfig filterConfig) throws CacheException {
		init();
		super.doInit(filterConfig);
	}

	/**
	 * 使用自定义ehcache文件路径构建缓存管理器
	 */
	@Override
	protected CacheManager getCacheManager() {
		if (StringUtils.isEmpty(this.ehCacheFilePath)) {
			return super.getCacheManager();
		} else {
			return CacheManager.create(this.getClass().getClassLoader()
					.getResourceAsStream(ehCacheFilePath));
		}
	}

	@Override
	protected void doFilter(final HttpServletRequest request,
			final HttpServletResponse response, final FilterChain chain)
			throws AlreadyGzippedException, AlreadyCommittedException,
			FilterNonReentrantException, LockTimeoutException, Exception {
		// 获取请求的uri，(/framework/xx/xx.jsp)
		String url = request.getRequestURI();
		boolean flag = false;
		if (cacheURLs != null && cacheURLs.length > 0) {
			for (String cacheURL : cacheURLs) {
				if (url.equalsIgnoreCase(cacheURL.trim())) {
					flag = true;
					break;
				}
			}
		}
		// 如果包含我们要缓存的url 就缓存该页面，否则执行正常的页面转向
		if (flag) {
			String query = request.getQueryString();
			if (StringUtils.isNotEmpty(query)) {
				query = "?" + query;
			}
			LOGGER.info("当前请求被缓存：" + url + query);
			super.doFilter(request, response, chain);
		} else {
			chain.doFilter(request, response);
		}
	}

	private boolean headerContains(final HttpServletRequest request,
			final String header, final String value) {
		logRequestHeaders(request);
		final Enumeration<String> accepted = request.getHeaders(header);
		while (accepted.hasMoreElements()) {
			final String headerValue = (String) accepted.nextElement();
			if (headerValue.indexOf(value) != -1) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 兼容ie6/7 gzip压缩
	 */
	@Override
	protected boolean acceptsGzipEncoding(HttpServletRequest request) {
		boolean ie6 = headerContains(request, "User-Agent", "MSIE 6.0");
		boolean ie7 = headerContains(request, "User-Agent", "MSIE 7.0");
		return acceptsEncoding(request, "gzip") || ie6 || ie7;
	}
}