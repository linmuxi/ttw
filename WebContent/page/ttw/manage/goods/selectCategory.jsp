<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String pathb = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ pathb + "/";
	request.setAttribute("basePath", basePath);
%>


<!-- flexigrid -->
<div id="flexSelectCategoryList">
	<table id="selectCategorylist" style="display: none;"></table>
</div>
				
<script type="text/javascript" src="<%=basePath%>page/ttw/js/goods/selectCategory.js"></script>
