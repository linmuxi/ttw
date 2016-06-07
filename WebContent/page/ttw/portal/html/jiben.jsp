<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author Administrator
   @since  2015年8月23日 下午4:05:57
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>会员管理－基本信息</title>
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
     <link href="${ctx}/page/ttw/portal/css/index.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/Vip.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
	<link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/page/ttw/portal/build/template.js" type="text/javascript"></script>
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
					<li><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
					<li>账户中心</li>
					<li class="child active"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
					<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
					<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/goMemberInfoUpdate_portal">信息修改</a></li>
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
						<div class="uo-tit">基本信息</div>
					</div>
					<div class="fr uf-control">
						<a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
					</div>
				</div>
				<div class="user-order">
					<div>
						<ul>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">姓名</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.name}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">出生日期</div>
								<div class="xinxi-tit-text fleft xinxisee"><fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd" /></div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">性别</div>
								<div class="xinxi-tit-text fleft">
									<input type="radio" value="2" name="myrad">保密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" value="1" name="myrad" ${(member.gender==1)?'checked' : ''}>男&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" value="0" name="myrad" ${(member.gender==0)?'checked' : ''}>女
								</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">电子邮件地址</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.email}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">MSN</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.msn_code}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">QQ</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.qq_code}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">办公电话</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.office_phone}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">家庭电话</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.home_phone}</div>
							</li>
							<li class="xinxi-tit">
								<div class="xinxi-tit-title fleft">手机</div>
								<div class="xinxi-tit-text fleft xinxisee">${member.mobile}</div>
							</li>
						</ul>
					</div>
				</div>
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
