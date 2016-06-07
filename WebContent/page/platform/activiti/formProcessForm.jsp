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
<title>业务表单流程编辑&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- FormProcessAction dwr -->
	<script src="<%=basePath%>/dwr/interface/FormProcessAction.js"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">业务表单流程管理</a> <a class="brand2">业务表单流程编辑 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<form name="formprocessForm" id="formprocessForm">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明</strong> 请根据需要编辑业务表单流程信息
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
					<input type="hidden" id="id" name="id" value="${param.id}"/>
					<div class="form-actions">
						<div class="form-inline">
							<span class="label label-required">业务表单名称:</span> 
							<input type="text" class="medium" id="formName" name="formName"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">流程定义名称: </span> 
							<select id="prodefId" name="prodefId"></select>
						</div>
						<div class="form-inline">
							<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="fpFormBtn" name="fpFormBtn"
								value="提交" /> <input class="btn btn-success" type="button"
								id="update" name="update" value="更新" style="display: none;" />
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>

	<script type="text/javascript" src="<%=basePath%>/page/platform/js/activiti/formProcessForm.js"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>