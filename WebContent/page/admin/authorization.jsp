<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
       授权页面(用户-角色、角色-权限、权限-资源、角色-模块)
   @author linyong
   @since  2015年6月10日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户授权</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
</head>

<body> 
	<div class="container">
		<div class="row">
			<div class="col-xs-6"> 
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
				<select multiple class="form-control" style="height:300px;" id="noSelfAuth">
					<c:forEach items="${data.noSelfAuth}" var="noSelfAuth">
						<option value="${noSelfAuth.id}">${noSelfAuth.name}</option>
					</c:forEach>
				</select>
			</div>      
			<div class="col-xs-6">
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
				<select multiple class="form-control" style="height:300px;" id="selfAuth">
					<c:forEach items="${data.selfAuth}" var="selfAuth">
						<option value="${selfAuth.id}">${selfAuth.name}</option>
					</c:forEach>  
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 5px;">
			<div class="col-xs-12 text-right"> 
				<div class="btn btn-primary" id="authorization">保存</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//param:"objId,[type]";
		var other = ${other};
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/admin/js/authorization.js"></script>
</body>
</html>