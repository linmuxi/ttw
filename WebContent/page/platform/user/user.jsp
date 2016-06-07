<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String introData = request.getParameter("intro") != null ? request
			.getParameter("intro") : "";
			
	String id = UUID.randomUUID().toString();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>用户&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/SysUserAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">用户信息管理</a> <a class="brand2">编辑用户信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<form name="userForm" id="userForm">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明</strong> 请根据需要编辑用户信息
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
					<input type="hidden" id="userId" name="userId" value="${param.userId}"/>
					<div class="form-actions">
						<div class="form-inline">
							<span class="label label-required">所属部门:</span> 
							<select id="orgId" name="orgId">
							</select>
						</div>
						<div class="form-inline">
							<span class="label label-required">真实姓名: </span> 
							<input type="text" class="medium" id="userName" name="userName"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">登录帐号: </span> 
							<input type="text" class="medium" id="account" name="account"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">密码: </span> 
							<input type="password" class="medium" id="password" name="password"/>
						</div>
						<div class="form-inline">
							<span class="label label-required">是否可用: </span> 
							<input type="radio"
								id="enabled" name="enabled" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="enabled"
								name="enabled" value="0" /> <label for="radio-2">否 </label>
						</div>
						<div class="form-inline">
							<span class="label label-required">是否未过期: </span> 
							<input type="radio"
								id="accountNonExpired" name="accountNonExpired" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="accountNonExpired"
								name="accountNonExpired" value="0" /> <label for="radio-2">否 </label>
						</div>
						<div class="form-inline">
							<span class="label label-required">是否未锁定: </span> 
							<input type="radio"
								id="accountNonLocked" name="accountNonLocked" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="accountNonLocked"
								name="accountNonLocked" value="0" /> <label for="radio-2">否 </label>
						</div>
						<div class="form-inline">
							<span class="label label-required">是否未失效: </span> 
							<input type="radio"
								id="credentialsNonExpired" name="credentialsNonExpired" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="credentialsNonExpired"
								name="credentialsNonExpired" value="0" /> <label for="radio-2">否 </label>
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
		src="<%=basePath%>page/platform/js/user/user.js"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>


<%!
private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
}
%>
