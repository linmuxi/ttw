<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
%><%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" 
%><%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"
%><%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" 
%><%@ taglib uri="/WEB-INF/tld/sql.tld" prefix="sql" 
%><%
	//清除缓存
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	String ctx = request.getContextPath();
	if ("/".equals(ctx)) {
	    ctx = "";
	}
	request.setAttribute("ctx", ctx);
%>
<!-- jquery -->
<script src="${pageContext.request.contextPath}/page/common/js/jquery/jquery.min.js"></script>

<!-- 常用帮助js -->
<script src="${pageContext.request.contextPath}/page/common/js/utils/date.js"></script>
<script src="${pageContext.request.contextPath}/page/common/js/utils/stringutils.js"></script>
<script src="${pageContext.request.contextPath}/page/common/js/utils/jquery_extend.js"></script>

<!-- 公共js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/common.js"></script>
<!-- 引用公共css -->
<link href="${pageContext.request.contextPath}/page/common/css/base.css" rel="stylesheet">

<!-- dwr -->
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>

<!-- 表格 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/bootgrid/jquery.bootgrid.min.css">
<script src="${pageContext.request.contextPath}/page/common/js/bootgrid/jquery.bootgrid.js"></script>

<!-- 表单验证 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/validation/css/formValidation.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/validation/js/formValidation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/validation/js/framework/bootstrap.js"></script>

<!-- 下拉框 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/multiselect/css/bootstrap-multiselect.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/multiselect/js/bootstrap-multiselect.js"></script>

<!-- ztree -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/ztree/js/jquery.ztree.core-3.5.js"></script>

<!-- lhg -->
<script src="${pageContext.request.contextPath}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/loadmask/jquery.loadmask.css" type="text/css">
<script src="${pageContext.request.contextPath}/page/common/js/loadmask/jquery.loadmask.js"></script>

<script>
	var webRoot = "${pageContext.request.contextPath}";
</script>