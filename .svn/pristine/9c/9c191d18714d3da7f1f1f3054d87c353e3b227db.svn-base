/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 自定义springmvc请求拦截器
 * 
 * @Description: 可以进行编码、安全控制、日志记录等操作
 * @author linyong
 * @since 2015年5月17日 下午12:12:54
 */
public class RequestInterceptor implements HandlerInterceptor {
	//private final Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 最后执行，释放资源 可以根据ex是否为null判断是否发生了异常，进行日志记录
	 */
	@Override
	public void afterCompletion(HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse, Object obj,
			Exception exception) throws Exception {
	}

	/**
	 * 生成视图之前执行 有机会修改ModelAndView
	 */
	@Override
	public void postHandle(HttpServletRequest httpservletrequest,
			HttpServletResponse httpservletresponse, Object obj,
			ModelAndView modelandview) throws Exception {
	}

	/**
	 * action之前执行 可以进行编码、安全控制等处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj)
			throws Exception {
		return true;
	}
}