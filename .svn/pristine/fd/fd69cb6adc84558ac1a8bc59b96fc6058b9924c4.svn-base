<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试</title>
</head>
<body>
	欢迎你：
	<sec:authentication property="name" />
	<br />
	<a href="${pageContext.request.contextPath}/demo/hello1?name=jack1">MVC请求返回JSP</a>
	<a href="${pageContext.request.contextPath}/demo/hello2?name=jack2">MVC请求重定向到JSP</a>
	<a href="${pageContext.request.contextPath}/demo/hello3?name=jack3">MVC请求返回JSON数据</a>
	<a href="${pageContext.request.contextPath}/demo/index.html">MVC请求返回ftl模版页面</a>
	<a href="javascript:dwrRequest()">dwr请求</a>
</body>

<!-- 使用dwr需要引入以下js文件 -->
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script
	src="${pageContext.request.contextPath}/dwr/interface/DemoAction.js"></script>
<script type="text/javascript">
	function dwrRequest() {
		//异步调用
		DemoAction.queryUsers({
			"name" : "jack",
			"date" : new Date()
		}, function(data) {
			alert(data);
		});

		//支持同步调用
		dwr.engine.setAsync(false);
		//dwr调用
		dwr.engine.setAsync(true);
	}
</script>
</html>