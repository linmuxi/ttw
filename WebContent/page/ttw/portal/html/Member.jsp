<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
<link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/page/ttw/portal/build/template.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<!-- <script>
		document.body.innerHTML += template('header', {
			list : [ '首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例',
					'会员中心' ],
			Hlink : [ "../index.jsp", "Design.jsp", "Station.jsp",
					"Virtual.jsp", "Domain.jsp", "Mailbox.jsp",
					"Project.jsp", "${ctx}/page/ttw/portal/html/Member.jsp" ]
		});
	</script> -->
	<div class="wrap">
		<div class="container wid1000">
			<div class="fl sidebarleft">
				<ul>
					<ul>
						<li class=" active"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
						<li>账户中心</li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
						<li class="child "><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/goMemberInfoUpdate_portal">信息修改</a></li>
						<li class="child">账户注销</li>
						<li>订单管理</li>
						<!-- <li class="child"><a class="indexa" href="/shopcar.jsp">我的购物车</a></li> -->
						<li class="childActive"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order">订单信息</a></li>
						<li class="childActive"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order?m=nopay">待付款订单</a></li>
						<li class="childActive"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order?m=accept">未验收订单</a></li>
						<li>财务管理</li>
						<li class="childActive"><a class="indexa" href="fapiao.jsp">发票管理</a></li>
						<li class="childActive "><a class="indexa" href="daijin.jsp">代金卷</a></li>
					</ul>
				</ul>
			</div>
			<div class="mar10">
				<div class="date-before">
					上次登陆时间：<fmt:formatDate value="${SPRING_SECURITY_CONTEXT.authentication.principal.lastLoginDate}" type="both" dateStyle="full" timeStyle="full"/>
				</div>
				<div class="user-info">
					<div class="fl uf-img">
						<img src="${ctx}/page/ttw/portal/images/Member/i_pro/photo.png" />
					</div>
					<div class="fl uf-content">
						<h1>你好!${memberInfo.name}</h1>
						<!-- <div class="fl">
							<div>账户安全：邮件认证</div>
							<div>
								账户余额：<span>00</span>元
							</div>
							<div>
								优惠券：共计<span>0</span>个，价值<span>0.00</span>元
							</div>
							<div>
								<u><a href="#">查看</a></u>
							</div>
						</div>
						<div class="fl">
							<div></div>
							<div>
								待付款：<span>1</span>
							</div>
							<div>
								待评价：<span>1</span>
							</div>
							<div>
								<u><a href="#">智能客服</a></u>
							</div>
						</div> -->
					</div>
					<div class="fr uf-control">
						<a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
					</div>
				</div>
				<div class="user-order">
					<div class="uo-tit">最近订单</div>
					<div class="uo-content">
						<ul>
							<li class="uoc-tit">
								<div class="uoc-num">销售订单号</div>
								<div class="uco-name">商品名称</div>
								<div class="uco-xdate">下单日期</div>
								<div class="uco-moeny">金额</div>
								<div class="uco-state">状态</div>
								<div class="uco-control">操作</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">已付款</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span> <span>【<a href="#">确认收货</a>】
									</span>
								</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">已完成</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span>
								</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">
									<span>取消</span>
								</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span>
								</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">
									<span>取消</span>
								</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span>
								</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">
									<span>取消</span>
								</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span>
								</div>
							</li>
							<li>
								<div class="uoc-num">DDN100002</div>
								<div class="uco-name">连氏商务海报设计图片-无印刷</div>
								<div class="uco-xdate">2014-12-03</div>
								<div class="uco-moeny">400元</div>
								<div class="uco-state">
									<span>取消</span>
								</div>
								<div class="uco-control">
									<span>【<a href="#">查看</a>】
									</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="flip">
				<div class="fr">
					<div class="f-word">1/20</div>
					<div class="f-xl">
						<div class="x-ng">01</div>
						<div class="x-xl">
							<div class="xl-img"></div>
						</div>
					</div>
					<div class="f-jt">
						<a class="f-pre" href="#">
							<div class="pre-img"></div>
						</a><a class="f-next" href="#">
							<div class="next-img"></div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var html = template('footer', {});
		document.body.innerHTML += html;
	</script>
</body>
</html>

<script type="text/javascript">
	$(document).ready(
			function() {

				$(".dropdownDefault,.dropdownContainer .downArrow1").click(
						function(event) {
							if ($(this).siblings(".dropdrown-menu").is(
									":hidden")) {
								$(".dropdrown-menu").hide();
								$(this).siblings(".dropdrown-menu").show(10);
							} else {
								$(this).siblings(".dropdrown-menu").hide(10);
							}

							event.stopPropagation();
							$(document).click(function() {
								$(".dropdrown-menu").hide();
							});
						});
				$(".dropdrown-menu li").click(
						function() {
							$(this).parent().siblings(".dropdownDefault").html(
									$(this).html());
							$(this).parent().hide();
						});
			});
</script>