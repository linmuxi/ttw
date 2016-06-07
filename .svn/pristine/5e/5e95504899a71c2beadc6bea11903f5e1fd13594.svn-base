<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>资源&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- role dwr -->
	<script src="<%=basePath%>dwr/interface/SysResourceAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">资源信息管理</a> <a class="brand2">编辑资源信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<form name="resourceForm" id="resourceForm">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明</strong> 请根据需要编辑资源信息
					</div>
					<div id="alerterror" style="display: none;"
						class="alert alert-error">
						<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
					</div>
					<div id="alertinfo" style="display: none;" class="alert alert-info">
						<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
					</div>
					<div class="line-dotted"></div>
					<div class="btn-group">
						<button id="btnback" type="button" class="btn btn-success">返回</button>
					</div>
					<!-- 开始显示用户form表单 -->
					<input type="hidden" id="resourceId" name="resourceId" value="${param.resourceId}"/>
					<div class="form-actions">
						<div class="form-inline">
							<span class="label label-required">所属模块: </span> 
							<select id="parent" name="parent"></select>
						</div>
						<div class="form-inline">
							<span class="label label-required">资源名称: </span> 
							<input type="text" class="medium" id="resourceName" name="resourceName"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">资源类型:</span> 
							<input type="radio"
								id="resourceType" name="resourceType" value="1" checked="checked" /> <label
								for="radio-1">URL </label> 
							<input type="radio" id="resourceType"
								name="resourceType" value="2" /> <label for="radio-2">METHOD </label>
						</div>
						<div class="form-inline">
							<span class="label label-required">资源路径: </span> 
							<input type="text" class="medium" id="resourcePath" name="resourcePath"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">资源描述: </span> 
							<textarea rows="5" cols="200" class="medium" id="resourceDesc" name="resourceDesc"></textarea>
						</div>
						<div class="form-inline">
							<span class="label label-required">优先级: </span> 
							<input type="text" class="medium" id="priority" name="priority"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">是否可用: </span> 
							<input type="radio"
								id="enable" name="enable" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="enable"
								name="enable" value="0" /> <label for="radio-2">否 </label>
						</div>
						<div class="form-inline">
							<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="submit" name="submit"
								value="提交" /> <input class="btn btn-success" type="button"
								id="update" name="update" value="更新" style="display: none;" />
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>

	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/resource/resource.js"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>