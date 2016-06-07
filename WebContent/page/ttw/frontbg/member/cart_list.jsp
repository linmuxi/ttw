<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html language="en">
<head>
<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/jPaginate/css/style.css" media="screen"/>
<title>淘桃网-会员中心</title>
<style type="text/css">
.member-base * {
	 margin-left: 5px !important;
	 padding:4px !important; 
	 font-size: 1.1em !important;
}

.input_base {
  width: 220px;
}

.member_radio{
	  width: 15px !important;
	  height: 20px !important;
}
.member-content-header{
 	height: 60px !important;
}
</style>
</head>
<body>
	<jsp:include page="/page/ttw/front/header.jsp"></jsp:include>
	<main class="member-main">
		<aside class="member-aside">
			<ul>
				<li class="title"><a href="${ctx}/page/ttw/frontbg/member/center?goodsCategoryId=member_id">会员中心</a></li>
				<li class="child-wrap">账户中心
					<ul>
						<li><a href="${ctx}/page/ttw/frontbg/member/base_member.jsp?goodsCategoryId=member_id">基本信息</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/pwdupdate_member.jsp?goodsCategoryId=member_id">密码修改</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/updateinfo_member.jsp?goodsCategoryId=member_id">信息修改</a></li>
					</ul>
				</li>
				<li class="child-wrap">订单管理
					<ul>
						<li><a href="${ctx}/page/ttw/frontbg/cart?goodsCategoryId=member_id">我的购物车</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id">订单信息</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id&status=6">待付款订单</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id&status=4">未验收订单</a></li>
					</ul>
				</li>
				<li class="child-wrap">财务管理
					<ul>
						<li><a href="#">发票管理</a></li>
					</ul>
				</li>
			</ul>
		</aside>
		
		<div class="member-content" style="margin-top:-25px;">
			<div class="member-content-header">
				<p><span id="lastLoginDate"></span></p>
				<span class="float-right">问题反馈</span>
				<span class="float-right">|</span>
				<span class="float-right">操作说明</span>
				<div class="clear"></div>
			</div>
			<span class="member-order-title" style="margin-top:-12px;">购物车信息</span>
			<div class="clear"></div>
			<section class="table">
				<div class="row header">
					<div class="cell">&nbsp;</div>
					<div class="cell">商品名称</div>
					<div class="cell">金额</div>
					<div class="cell">操作</div>
				</div>
				<c:forEach items="${carts}" var="cart">
				<div class="row">
					<div class="cell" style="width:60px; padding-top:10px;">
						<c:choose>
	                		<c:when test="${empty cart.pictureUrl}">
	                			<img src="${ctx}/page/ttw/portal/images/Submit/none.jpg" width="50px" height="50px"/>
	                		</c:when>
	                		<c:otherwise>
	                			<img src="${ctx}${cart.pictureUrl}" width="50px" height="50px"/>
	                		</c:otherwise>
	                	</c:choose>
					</div>
					<div class="cell" style="vertical-align:middle;">${cart.goodsName}</div>
					<div class="cell" style="vertical-align:middle;">${cart.price}</div>
					<div class="cell" style="vertical-align:middle;">
						<a href="${ctx}/page/ttw/frontbg/cart/delCart?id=${cart.id}">删除</a>
					</div>
				</div>
				</c:forEach>
			</section>
			<div class="member-order-footer">
                <div class="paginate-ui"></div>
			</div>
		</div>
		<div class="clear"></div>
	</main>
	<jsp:include page="/page/ttw/front/footer.jsp"></jsp:include>
</body>
</html>