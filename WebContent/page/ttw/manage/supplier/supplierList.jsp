<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>供应商列表 &middot; 淘桃网</title>

<script type="text/javascript">
function detail(val) {
	window.location.href=webRoot + "page/ttw/manage/supplier/supplierDetail?supplierId="+val;
}
</script>

</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<%@include file="/page/platform/header.jsp"%>
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">供应商</a> 
				<a class="brand2">供应商列表</a>
		</div>
	</div>
	<div class="container-fluid containerb">
		<div class="row-fluid">
			<div class="span2">
				<%@include file="/page/platform/left.jsp"%>
			</div>
			<div class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明!</strong> 这里显示了供应商的信息
				</div>
				<div id="flexsupplierlist">
					<table id="flexsupplierlist" style="display: none;"></table>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript" src="<%=basePath%>page/ttw/js/supplier/supplierList.js"></script>
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>

