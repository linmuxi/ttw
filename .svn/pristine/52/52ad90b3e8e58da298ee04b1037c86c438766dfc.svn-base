/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.security;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextImpl;


/**
 * 登录过滤器
 * @Description TODO
 * @author linyong
 * @since 2015年5月23日 下午10:10:56
 */
public class LoginFilter implements Filter {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	//前台管理平台登录uri
	private static final String loginFrontUrl = "/page/ttw/front/login.jsp";
	//后台管理平台登录uri 524569728@qq.com
	private static final String loginBgUrl = "/page/login/login_bg.jsp";
	
	//访问不需要拦截的页面
	private static final String IGNORE_PARAM_NAME = "IGNORE_PAGES";
	//
	public final Set<String> IGNORE_PAGES = new HashSet<String>();
	/**
	 * 
	 * @see javax.servlet.Filter#destroy()
	 */
	@Override
	public void destroy() {
	}

	/** 
	 * 登录过滤器 过滤匿名登录
	 * @param arg0
	 * @param arg1
	 * @param arg2
	 * @throws IOException
	 * @throws ServletException
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String uri = request.getRequestURI();
		//判断是否是忽略页面
		if (!isCanVisit(uri)) {
			Object obj = request.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
			SecurityContextImpl context = obj == null ? null : (SecurityContextImpl)obj;
			if(context == null || context.getAuthentication() == null ||  StringUtils.equalsIgnoreCase(context.getAuthentication().getPrincipal().toString(), "anonymousUser")){
				anonymousLogin(request, response);
				return;
			}
		}
		
		chain.doFilter(arg0, arg1);
	}
	
	/**
	 * 处理匿名登录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void anonymousLogin(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String uri = request.getRequestURI().toUpperCase();
		String redirectUrl = request.getRequestURL().toString();
		logger.warn("匿名登录,请求地址："+uri+"  来自IP："+request.getRemoteHost()+"  "+request.getRemoteUser()+"  "+request.getRemoteAddr());
		if(uri.contains("/PAGE/PLATFORM") || uri.contains("/PAGE/MANAGE") || uri.contains("/PAGE/TTW/MANAGE")){//系统后台
			response.sendRedirect(request.getContextPath()+loginBgUrl+"?ttw_redirect="+redirectUrl);
		}else if(uri.contains("/PAGE/FRONTBG")||uri.contains("/PAGE/TTW/FRONTBG")){//前台会员登录
			response.sendRedirect(request.getContextPath()+loginFrontUrl+"?ttw_redirect="+redirectUrl);
		}else{
			//非匿名登陆的注销操作 1为前台管理注销、2为淘桃网后台管理注销
			if(request.getRequestURI().toUpperCase().contains("/PAGE/LOGOUT")){
				String type = request.getParameter("type");
				if(StringUtils.isNotEmpty(type) && Integer.valueOf(type) == 1){
					response.sendRedirect(request.getContextPath()+loginFrontUrl);
				}else if(StringUtils.isNotEmpty(type) && Integer.valueOf(type) == 2){
					response.sendRedirect(request.getContextPath()+loginBgUrl);
				}
			}
		}
	}

	/**
     * 判断拦截的页面是否运行访问
     * @return
     */
    protected boolean isCanVisit(String url){ 
        boolean flag = false;
        if(IGNORE_PAGES == null || IGNORE_PAGES.size() == 0){
        	return flag;
        }
        for (String reg : IGNORE_PAGES) {
			if(Pattern.compile(reg.trim(), Pattern.CASE_INSENSITIVE).matcher(url).matches()){
				flag = true;
				break;
			}
		};
        return flag;
    }
    
	/**
	 * @param arg0
	 * @throws ServletException
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		//初始化登陆忽略的页面
		String pageString = config.getInitParameter(IGNORE_PARAM_NAME);

        if (!StringUtils.isEmpty(pageString)) {
            String[] pages = pageString.split(",");
            if (pages != null) {
                for (String page : pages) {
                    IGNORE_PAGES.add(page);
                }
            }
        }
        StringBuilder b = new StringBuilder();
        for (String s : IGNORE_PAGES) {
            b.append(String.format("需要忽略的页面:[%1$s]\n", s));
        }
	}
}
