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
<title>权限&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- role dwr -->
	<script src="<%=basePath%>dwr/interface/SysRoleAction.js"></script>
	
	<!-- user dwr -->
	<script src="<%=basePath%>dwr/interface/SysUserAction.js"></script>
	
	<script src="<%=basePath%>dwr/interface/SysAuthorityAction.js"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">权限信息</a> <a class="brand2">编辑权限信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<form name="roleForm" id="roleForm">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明</strong> 请根据需要编辑权限信息
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
					<div style="padding-top:10px;">
						给【${other.objName}】
						<c:if test="${other.type == 1}">
							用户配置角色
						</c:if>
						<c:if test="${other.type == 2}">
							角色配置权限
						</c:if>
						<c:if test="${other.type == 3}">
							角色配置菜单
						</c:if>
						<c:if test="${other.type == 4}">
							权限配置资源
						</c:if>
					</div> 
					<!-- 开始显示用户form表单 -->
					<div class="form-actions">
						<div class="form-inline">
							<span class="label label-required">
								未拥有
								<c:choose>
									<c:when test="${other.type == 1}">
										角色
									</c:when>
									<c:when test="${other.type == 2}">
										权限
									</c:when>
									<c:when test="${other.type == 3}">
										模块
									</c:when>
								</c:choose>
								：
							</span>
							<select multiple class="form-control" style="height:300px;" id="noSelfAuth">
								<c:forEach items="${data.noSelfAuth}" var="noSelfAuth">
									<option value="${noSelfAuth.id}">${noSelfAuth.name}</option>
								</c:forEach>
							</select>
						
							<span class="label label-required">
								已拥有
								<c:choose>
									<c:when test="${other.type == 1}">
										角色
									</c:when>
									<c:when test="${other.type == 2}">
										权限
									</c:when>
									<c:when test="${other.type == 3}">
										模块
									</c:when>
								</c:choose>
								：
							</span>
							<select multiple class="form-control" style="height:300px;" id="selfAuth">
								<c:forEach items="${data.selfAuth}" var="selfAuth">
									<option value="${selfAuth.id}">${selfAuth.name}</option>
								</c:forEach>  
							</select>
						</div>
						<div class="form-inline">
							<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="authorization" name="authorization"
								value="提交" />
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		var other = ${other};
	</script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/authorization.js"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>