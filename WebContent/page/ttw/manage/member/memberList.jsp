<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="magi">
		<title>会员列表 &middot; 淘桃网</title>
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<script type="text/javascript">
			function enabledChange(userId,enabled){
				if(confirm("确定要变更此状态？")){
					window.location.href=webRoot + "page/business/manage/member/setEnabled?userId="+userId+"&enabled="+enabled;
				}
			}
		</script>
	</head>
	<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
		<!-- header 包含头部导航-->
		<%@include file="/page/platform/header.jsp"%>
		<!-- orders dwr -->
		<script src="<%=basePath%>dwr/interface/MemberAction.js?2=1"></script>
		<!-- end header -->
		<div class="navbar">
			<div class="navbar-innert">
				<a class="brand" href="#" style="color: #333333; width: 180px;"><img
					src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
					<a class="brand" href="#">会员管理</a> <a class="brand2">会员列表</a>
			</div>
		</div>
		<div class="container-fluid containerb">
			<div class="row-fluid">
				<div class="span2">
					<!-- 引入左侧导航 -->
					<%@include file="/page/platform/left.jsp"%>
				</div>
				<div class="span10">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明!</strong> 这里显示了订单信息
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
					<div id="flexmemberlist">
						<table id="memberlist" style="display: none;"></table>
					</div>
					<div class="line-dotted"></div>
					<!-- 提示框 -->
					<div id="memberdelModal" class="modal hide fade">
					  <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					    <h3>删除提示</h3>
					  </div>
					  <div  class="modal-body">
					    <p id="contentp">One fine body…</p>
					  </div>
					  <div class="modal-footer">
					    <a href="#" id="memberbtnclose" class="btn">关闭</a>
					    <a href="#" id="memberbtnok" class="btn btn-primary">确认删除</a>
					  </div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="<%=basePath%>page/ttw/js/member/memberList.js"></script>
		<%@include file="/page/platform/footer.jsp"%>
	</body>
</html>

