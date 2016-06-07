<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/admin/ui/css/login.css">
<title>登陆页面</title>
<script type="text/javascript">

</script>


</head>
<body>
	<div id="reg">
		<div>
			<img
				src="${pageContext.request.contextPath}/page/admin/ui/images/header1.png">
		</div>
		<form id="log_form" action="${pageContext.request.contextPath}/page/admin/inner/index_inner.jsp" method="post">
			<div id="dian">
				<br> <img
					src="${pageContext.request.contextPath}/page/admin/ui/images/header2.png">
				<div id="user">
					<input id="u_name" name="u_name" type="text" value="请输入用户名" onfocus="if(this.value==defaultValue) {this.value=''}" onblur="if(!value) {value=defaultValue; this.type='text';}" style="color:#CCC;">
				</div>
				<div id="pass">
					<input id="u_password" name="u_password" type="password" value="请输入密码" onfocus="if(this.value==defaultValue) {this.value=''}" onblur="if(!value) {value=defaultValue; this.type='password';}" style="color:#CCC;">
				</div>
			</div>
			<div id="sub">
				<input id="u_submit" name="u_submit" type="submit" value="安全登陆">
			</div>
		</form>
	</div>
</body>
</html>