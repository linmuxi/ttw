<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员中心-我的购物车</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
 	<link href="${ctx}/page/ttw/portal/css/index.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/Vip.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/build/template.js"></script>

    <link href="${ctx}/page/ttw/portal/css/jquery.spinner.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/jquery.spinner.js" type="text/javascript"></script>
</head>
<body>
    <jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
    <div class="wrap">
        <div class="container wid1000">
            <div class="fl sidebarleft">
                <ul>
						<li class=" active"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
						<li>账户中心</li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
						<li class="child "><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/gomemberInfoUpdate_portal">信息修改</a></li>
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
            </div>
            <div class="mar10">
                <div class="date-before">
                    上次登陆时间：2015-4-1 <span>13:00:47</span></div>
                <div class="user-info">
                    <div class="fl uf-control">
                        <div class="uo-tit">订单信息</div>
                    </div>
                    <div class="fr uf-control">
                        <a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
                    </div>
                </div>
                <div class="user-order">
                    <div class="uo-content">
                        <ul>
                            <li class="uoc-tit">
                                <div class="backc">
                                    <div class="order-num">销售单号</div>
                                    <div class="order-name">商品名称</div>
                                    <div class="order-xdate">下单时间</div>
                                    <div class="order-moeny">总金额</div>                              
                                    <div class="order-state">状态</div>
                                    <div class="order-control">操作</div>
                                </div>
                            </li>
                            <c:forEach items="${list}" var="order">
	                            <li class="uoc-tit">
	                                <div class="order-num">${order.orderSn}</div>
	                                <div class="order-name"></div>
	                                <div class="order-xdate">${order.createDate}</div>
	                                <div class="order-moeny">${order.amount}</div>
	                                <div class="order-state">${order.orderStatus}</div>
	                                <div class="order-control colora">【待支付】</div>
	                            </li>
                            </c:forEach>               
                        </ul>
                    </div>
                </div>
            </div>
            <div class="flip">
                <div class="fr">
                    <div class="f-word">
                        1/20</div>
                    <div class="f-xl">
                        <div class="x-ng">
                            01</div>
                        <div class="x-xl">
                            <div class="xl-img">
                            </div>
                        </div>
                    </div>
                    <div class="f-jt">
                        <a class="f-pre" href="#">
                            <div class="pre-img">
                            </div>
                        </a><a class="f-next" href="#">
                            <div class="next-img">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div style="bottom: 0; width: 100%;" id="footer">
    </div>
    <script>
        var html = template('footer', {});
        document.getElementById('footer').innerHTML += html;
    </script>
</body>
</html>
