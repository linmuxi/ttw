<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>会员中心-信息修改</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
<link href="${ctx}/page/ttw/portal/css/index.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/page/ttw/portal/css/Vip.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/page/ttw/portal/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script src="${ctx}/page/ttw/portal/js/unslider.min.js"
	type="text/javascript"></script>
<link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet"
	type="text/css" />
<script src="${ctx}/page/ttw/portal/build/template.js"
	type="text/javascript"></script>
</head>
<body>
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<!-- <script>
		document.body.innerHTML += template('header', {
			list : [ '首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例',
					'会员中心' ],
			Hlink : [ "index.htm", "html/Design.html", "html/Station.htm",
					"html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html",
					"html/Project.html",
					"${ctx}/page/ttw/portal/html/Member.jsp" ]
		});
	</script> -->
	<div class="wrap">
		<div class="container wid1000">
			<div class="fl sidebarleft">
				<ul>
					<li class=" active"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
				    <li>账户中心</li>
					<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
					<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
					<li class="child "><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/goMemberInfoUpdate_portal">信息修改</a></li>
					<li class="child">账户注销</li>
					<li>订单管理</li>
					<li class="child"><a class="indexa" href="shopcar.html">我的购物车</a></li>
					<li class="childActive"><a class="indexa" href="order.html">订单信息</a></li>
					<li class="child"><a class="indexa" href="nopay.html">待付款订单</a></li>
					<li class="child"><a class="indexa" href="noyanshou.html">未验收订单</a></li>
					<li>财务管理</li>
					<li class="childActive"><a class="indexa" href="fapiao.html">发票管理</a></li>
					<li class="childActive "><a class="indexa" href="daijin.html">代金卷</a></li>
				</ul>
			</div>
			<div>
				<font style="size: 20em;"> ${msg} </font>
			</div>
		</div>
	</div>
	<div style="bottom: 0; width: 100%;" id="footer"></div>
	<script>
		var html = template('footer', {});
		document.getElementById('footer').innerHTML += html;
	</script>
</body>
</html>
