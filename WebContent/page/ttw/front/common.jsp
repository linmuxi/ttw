<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String ctx = request.getContextPath();
	if ("/".equals(ctx)) {
		ctx = "";
	}
	request.setAttribute("ctx", ctx);
%>
<script>
	var webRoot = "${pageContext.request.contextPath}";
	
	//页面跳转,如果是http://开头，则跳转到外部,否则内部跳转
	function forward(url){
		if(/^(http:\/\/)/i.test(url)){
			window.location.href = url;
		}else{
			window.location.href= webRoot + url;
		}
	}
</script>
<meta charset="UTF-8">
<meta name="application-name" content="淘桃网"/>
<meta name="keywords" content="淘桃,淘桃网,购物,设计,优秀,taotaool,taotao,taotaool.com"/>
<meta name="description" content="淘桃网,让你的生活更简单"/>
<link rel="shortcut icon" type="text/css" href="${ctx}/page/ttw/front/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/css/style.css">
<script type="text/javascript" src="${ctx}/page/ttw/front/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/page/ttw/front/tpl/build/template.js"></script>
<!--[if IE]> 
<script src="/ttw/page/ttw/front/js/html5.js"></script>
<![endif]-->

<%--
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?56be09a24a539c6836c32cf1666c43a5";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
 --%>