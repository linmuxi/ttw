<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author Administrator
   @since  2015年5月18日 下午8:48:46
--%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Map map = (Map)request.getAttribute("modelMap");
	JSONArray json = JSONArray.fromObject(map.get("productList"));
	System.out.println(json.toString());
	out.write(json.toString());
%>
