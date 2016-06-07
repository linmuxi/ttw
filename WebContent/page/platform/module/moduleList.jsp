<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>模块列表 &middot; 淘桃网</title>

</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- role dwr -->
	<script src="<%=basePath%>dwr/interface/SysModuleAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">模块</a> <a class="brand2">模块列表</a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">
			
			<div class="well span2">
				<div class="col-xs-2">
					<ul id="manageModuleTree" class="ztree"></ul>
				</div>
			</div>

			<div class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明!</strong> 这里显示了模块列表信息
				</div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div id="alerterror" style="display: none;"
					class="alert alert-error">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div class="line-dotted"></div>
				<!-- flexigrid -->
				<div id="flexmodulelist">
					<table id="modulelist" style="display: none;"></table>
				</div>
				<div class="line-dotted"></div>
				<!-- 提示框 -->
				<div id="moduledelModal" class="modal hide fade">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    <h3>删除提示</h3>
				  </div>
				  <div  class="modal-body">
				    <p id="contentp">One fine body…</p>
				  </div>
				  <div class="modal-footer">
				    <a href="#" id="modulebtnclose" class="btn">关闭</a>
				    <a href="#" id="modulebtnok" class="btn btn-primary">确认删除</a>
				  </div>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/module/moduleList.js"></script>
	<%@include file="/page/platform/footer.jsp"%>

</body>
</html>