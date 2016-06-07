<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tld/menu.tld" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" 
%><%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"
%><%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" 
%><%
	String pathb = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ pathb + "/";
	request.setAttribute("basePath", basePath);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>首页 &middot; 淘桃网</title>
<!-- Le styles -->
<link href="<%=basePath%>page/platform/ui/assets/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=basePath%>page/platform/ui/assets/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="<%=basePath%>page/platform/ui/assets/css/docs.css" rel="stylesheet">
<link
	href="<%=basePath%>page/platform/ui/assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<link href="<%=basePath%>page/platform/ui/assets/css/base.css" rel="stylesheet">
<link
	href="<%=basePath%>page/platform/js/plugins/icheckmaster/skins/square/blue.css"
	rel="stylesheet">

<!-- import flexigrid css -->
<link
	href="<%=basePath%>page/platform/js/plugins/flexigrid/css/flexigrid/flexigrid_blue.css"
	rel="stylesheet" type="text/css">
<!-- import uploader css -->
<link href="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.css"
	rel="stylesheet">
<!-- import  farbtastic css-->
<link href="<%=basePath%>page/platform/js/plugins/farbtastic/farbtastic.css"
	rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="shortcut icon"
	href="<%=basePath%>page/platform/ui/assets/ico/favicon.ico">
</head>
<body>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>page/platform/ui/assets/js/jquery.js"></script>
	<script
		src="<%=basePath%>page/platform/ui/assets/js/google-code-prettify/prettify.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-transition.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-alert.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-modal.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-dropdown.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-scrollspy.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-tab.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-tooltip.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-popover.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-button.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-collapse.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-carousel.js"></script>
	<script src="<%=basePath%>page/platform/ui/assets/js/bootstrap-typeahead.js"></script>

	<script
		src="<%=basePath%>page/platform/js/plugins/icheckmaster/jquery.icheck.min.js"></script>

	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/flexigrid/myflexigrid.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/jquery.query.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/validatorjs/validator.js"></script>
	
	<!-- 常用帮助js -->
	<script src="<%=basePath%>page/common/js/utils/date.js"></script>
	<script src="<%=basePath%>page/common/js/utils/stringutils.js"></script>
	<script src="<%=basePath%>page/common/js/utils/jquery_extend.js"></script>
	
	
	<!-- ztree -->
	<link rel="stylesheet" href="<%=basePath%>page/common/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="<%=basePath%>page/common/js/ztree/js/jquery.ztree.core-3.5.js"></script>
	
	<!-- 公共js -->
	<script type="text/javascript" src="<%=basePath%>page/common/js/common.js"></script>

	<!-- dwr -->
	<script src="<%=basePath%>dwr/engine.js"></script>
	<script src="<%=basePath%>dwr/util.js"></script>
	
	<!-- 下拉框 -->
	<link rel="stylesheet" href="<%=basePath%>page/common/js/multiselect/css/bootstrap-multiselect.css" type="text/css">
	<script type="text/javascript" src="<%=basePath%>page/common/js/multiselect/js/bootstrap-multiselect.js"></script>

</body>
</html>
