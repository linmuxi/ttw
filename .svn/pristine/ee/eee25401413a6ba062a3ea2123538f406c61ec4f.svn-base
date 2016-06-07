<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="top-header">
	<section class="header-menu-wrap">
		<div class="top-menu-wrap">
			<nav class="top-menu">
				<ul>
					<!-- 从数据字典表获取 -->
					<%-- <c:forEach var="topMenu" items="${topMenuList}">
						<li><a href="${ctx}${topMenu.defaultValue}" title="${topMenu.defaultKey}">${topMenu.defaultKey}</a></li>
					</c:forEach> --%>
				</ul>
			</nav>
			<nav class="top-login">
				<ul>
					<c:choose>
							<c:when test="${memberInfo != null}">
								<li>欢迎您:${memberInfo.account}</li>
								<li><a href="${ctx}/page/logout?type=0" title="退出">退出</a></li>
							</c:when>
							<c:otherwise>
								<li>[<a href="${ctx}/page/ttw/front/login.jsp" title="登录">登录</a>|<a href="${ctx}/page/ttw/front/register.jsp" title="注册">免费注册</a>]</li>
							</c:otherwise>
					</c:choose>
					<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id" title="我的订单">我的订单</a></li>
				</ul>
			</nav>
		</div>
	</section>
	<section class="header-search-wrap">
		<a href="${ctx}/page/front/home" title="淘桃网首页logo"></a>
		<div class="global-search-wrap">
			<input type="hidden" id="defaultSearchKey" value="">
			<input type="text" id="globalSearchKey" class="search-key" value="${modelMap.search }" placeholder="">
			<input type="button" id="indexSearchBtn" value="搜索" class="search-btn">
			<div class="search-type-select-wrap">
				<select id="globalCategory">
					<option value="-1">分类</option>
					<%-- <c:forEach var="goodsTypeItem" items="${goodsTypeSelectList}">
						<option <c:if test="${goodsTypeItem.id == param.goodsCategoryId}">selected="selected"</c:if> value="${goodsTypeItem.id}">${goodsTypeItem.name}</option>
					</c:forEach> --%>
				</select>
			</div>
		</div>
	</section>
	<div class="clear"></div>
	<section class="header-nav-wrap">
	</section>
</header>

<script type="text/javascript">
	var goodsCategoryId = "${param.goodsCategoryId}";//产品类别id
	var homeUrl = "${param.homeUrl}";//回到当前产品类别首页URL
	var search = "${param.search}";//查询条件
</script>

<script type="text/javascript" src="${ctx}/page/ttw/js/header.js"></script>
