<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html language="en">
<head>
    <jsp:include page="common.jsp"></jsp:include>
  	<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/gallery/jquery.ad-gallery.css">
	<title>淘桃网-我的订单</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<header class="location-search-header">
			<div class="location-info">
				<span>当前位置：</span>
				<span>支付完成</span>
			</div>
		</header>
		<div class="List">
        	<div class="ListTit" style="margin-top:10px; text-align:center;">
        		<a href="${ctx}/page/front/home">订单支付成功，继续淘桃网购物</a>
        	</div>
        </div>
	</main>
</body>
</html>

