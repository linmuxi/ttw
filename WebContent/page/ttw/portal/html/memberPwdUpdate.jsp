﻿<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author Administrator
   @since  2015年8月23日 下午4:05:57
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>会员中心－密码修改</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
<link href="${ctx}/page/ttw/portal/css/08-3.css" rel="stylesheet">
<link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/page/ttw/portal/build/template.js" type="text/javascript"></script>
<script src="${ctx}/dwr/interface/SupplierAction.js"></script>
</head>
<body>
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<!-- <script>
		document.body.innerHTML += template('header', {
			list : [ '首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例',
					'会员中心' ],
			Hlink : [ "../index.htm", "Design.html", "Station.htm",
					"Virtual.htm", "Domain.htm", "Mailbox.html",
					"Project.html", "${ctx}/page/ttw/portal/html/Member.jsp" ]
		});
	</script> -->
	<script type="text/javascript"></script>
	<div class="wrap">
		<div class="container wid1000">
			<div class="fl sidebarleft">
				<ul>
					<li><a class="indexa"
						href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
					<li>账户中心</li>
					<li class="child"><a class="indexa"
						href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
					<li class="child active"><a class="indexa"
						href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
					<li class="child"><a class="indexa"
						href="${pageContext.request.contextPath}/page/business/manage/member/goMemberInfoUpdate_portal">信息修改</a></li>
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
			<div class="mar10">
				<div class="date-before">
					上次登陆时间：2015-4-1 <span>13:00:47</span>
				</div>
				<div class="">
					<div class="fl uf-control">
						<div class="uo-tit">密码修改</div>
					</div>
					<div class="fr uf-control">
						<a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
					</div>
				</div>
				<div class="user-order">
					<input type="hidden"
						value="${SPRING_SECURITY_CONTEXT.authentication.principal.account}"
						id="account">
					<div class="ipt">
						请输入旧密码<input type="password" name="oldpass" id="oldpass" />
					</div>
					<div class="ipt">
						请输入新密码<input type="password" name="pass" id="pass" />
					</div>
					<div class="ipt">
						再输入新密码<input type="password" name="repass" id="repass" />
					</div>
					<input class="ibtn" type="button" id="submit" name="submit"
						value="提交" />
				</div>
			</div>
		</div>
	</div>
	<div style="bottom: 0; width: 100%;" id="footer"></div>
	<script>
		var html = template('footer', {});
		document.getElementById('footer').innerHTML += html;
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/page/ttw/js/supplier/supplierUpdatePwd.js"></script>
</body>
</html>


