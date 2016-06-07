<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>供应商信息变更 &middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<%@include file="/page/platform/header.jsp"%>
	<script src="<%=basePath%>dwr/interface/SupplierAction.js"></script>
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt=""
				style="height: 30px;">淘桃网</a> <a class="brand" href="#">供应商信息管理</a>
			<a class="brand2">编辑供应商信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">
			<div class="span2">
				<a href="#" class="thumbnail"><img
					src="<%=basePath%>/page/platform/ui/assets/img/user.png" alt=""
					class="caption"> </a>
				<div class="well well-small smallt">
					<h4>
						${SPRING_SECURITY_CONTEXT.authentication.principal.username}，你好！</h4>
					<p>
						欢迎您来到<br />淘桃网
					</p>
					<button class="btn btn-block btn-primary" type="button"
						id="myTaskList">我的工作</button>
				</div>
				<div class="line-dotted"></div>
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明</strong> 请根据需要编辑供应商信息
				</div>
				<!-- <div id="alerterror" style="display: none;"
					class="alert alert-error">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div> -->
				<!-- <div class="line-dotted"></div> -->
				<!-- <div class="btn-group">
					<button id="btnback" type="button" class="btn btn-success">返回</button>
				</div> -->
				<div class="line-dotted"></div>
				<!-- 开始显示商品类型form表单 -->
				<form class="form-horizontal" role="form" id="supplierForm">
					<input type="hidden" name="supplierId" id="supplierId"> <input
						type="hidden" name="userId" id="userId">
					<div class="form-inline">
						<span class="label label-required">供应商编号:</span> <input
							type="text" class="form-control" id="supNo" name="supNo"
							readonly="readonly" /> <span class="label label-required">合同编码:
						</span> <input type="text" class="form-control" id="contractCode"
							name="contractCode" /> <span class="label label-required">招商人姓名:
						</span> <input type="text" class="form-control" id="cmbPeopleName"
							name="cmbPeopleName" />
					</div>
					<div class="form-inline">
						<span class="label label-required">供应商名称: </span> <input
							type="text" class="form-control" id="supName" name="supName" />
						<span class="label label-required">供应商邮箱: </span> <input
							type="text" class="form-control" id="supEmail" name="supEmail" />
						<span class="label label-required">供应商电话:</span> <input
							type="text" class="form-control" id=supPhone name="supPhone" />
					</div>
					<div class="form-inline">
						<span class="label label-required">供应商传真: </span> <input
							type="text" class="form-control" id="supFaxes" name="supFaxes" />
						<span class="label label-required">供应商地址: </span> <input
							type="text" class="form-control" id="supAddress"
							name="supAddress" /> <span class="label label-required">银行账户名称:
						</span> <input type="text" class="form-control" id="bankAccountName"
							name="bankAccountName" />
					</div>
					<div class="form-inline">
						<span class="label label-required">银行账号: </span> <input
							type="text" class="form-control" id="bankAccountNo"
							name="bankAccountNo" /> <span class="label label-required">银行账户地址:</span>
						<input type="text" class="form-control" id=bankAddress
							name="bankAddress" /> <span class="label label-required">联系人姓名:
						</span> <input type="text" class="form-control" id="linkPeopleName"
							name="linkPeopleName" />
					</div>
					<div class="form-inline">
						<span class="label label-required">联系人电话: </span> <input
							type="text" class="form-control" id="linkPeoplePhone"
							name="linkPeoplePhone" /> <span class="label label-required">联系人QQ:
						</span> <input type="text" class="form-control" id="linkPeopleQQ"
							name="linkPeopleQQ" /> <span class="label label-required">联系人邮箱:
						</span> <input type="text" class="form-control" id="linkPeopleEmail"
							name="linkPeopleEmail" />
					</div>
					<div class="form-inline">
						<span class="label label-required">负责人身份证号: </span> <input
							type="text" class="form-control" id="headPeopleCardNo"
							name="headPeopleCardNo" /> <span class="label label-required">负责人姓名:
						</span> <input type="text" class="form-control" id="headPeopleName"
							name="headPeopleName" /> <span class="label label-required">负责人电话:
						</span> <input type="text" class="form-control" id="headPeoplePhone"
							name="headPeoplePhone" />
					</div>
					<div class="form-inline">
						<span class="label label-required">负责人QQ: </span> <input
							type="text" class="form-control" id="headPeopleQQ"
							name="headPeopleQQ" /> <span class="label label-required">负责人邮箱:</span>
						<input type="text" class="form-control" id=headPeopleEmail
							name="headPeopleEmail" /> <span class="label label-required">备注信息:
						</span> <input type="text" class="form-control" id="remark" name="remark" />
					</div>
					<div class="form-inline">
						<div class="form-group text-right">
							<button class="btn btn-primary" type="button"
								id="supplierFormBtn" onclick="return submitForm()">更新</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="line-dotted"></div>
	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/supplier/supplierUpdate.js"></script>
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>
