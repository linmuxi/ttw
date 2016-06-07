<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>首页 &middot; 淘桃网</title>
<meta http-equiv="expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />
</head>
<body>
	<!-- header 包含头部导航-->
	<%@include file="header.jsp"%>

	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> <a class="brand" href="#">欢迎登录后台管理系统</a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<a href="#" class="thumbnail"><img
					src="<%=basePath%>/page/platform/ui/assets/img/user.png" alt="" class="caption"> </a>
				<div class="well well-small smallt">
					<h4> ${SPRING_SECURITY_CONTEXT.authentication.principal.username}，你好！</h4>
					<p>
						欢迎您来到<br />淘桃网
					</p>
					<button class="btn btn-block btn-primary" type="button" id="myTaskList">我的工作</button>
				</div>


				<div class="line-dotted"></div>
				<!-- 引入左侧导航 -->
				<%@include file="left.jsp"%>

			</div>

			<div class="span7">
				<div class="row-fluid">
					<ul class="thumbnails">
					
						<sec:authorize ifAnyGranted="GOODS_ADD">
						<li class="span2"><a
							href="<%=basePath%>/page/ttw/manage/goods/goods.jsp?operate=add&folder=goods"
							class="thumbnail"><img
								src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-edit.png"
								alt="" class="caption">
								<h4>添加产品</h4> </a></li>
						</sec:authorize>
						
						<%-- <sec:authorize ifAnyGranted="GOODTYPE_LIST">
						<li class="span2"><a
							href="<%=basePath%>page/ttw/manage/goods/goodsCategoryList.jsp"
							class="thumbnail"><img
								src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-category.png"
								alt="" class="caption">
								<h4>分类管理</h4> </a></li>
						</sec:authorize> --%>
						<%-- 
						<li class="span2"><a href="<%=basePath%>admin/order/normalordersment.jsp?operate=find" class="thumbnail"><img
								src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-stats.png"
								alt="" class="caption">
								<h4>订单管理</h4> </a></li>
						<li class="span2"><a href="<%=basePath%>admin/member/membergroupment.jsp?operate=find" class="thumbnail"><img
								src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-user.png"
								alt="" class="caption">
								<h4>分组管理</h4> </a></li>
						<li class="span2"><a href="<%=basePath%>admin/setting/basicinfoment.jsp?operate=find" class="thumbnail"><img
								src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-config.png"
								alt="" class="caption">
								<h4>基本设置</h4> </a></li>
						--%>
					</ul>
				</div>
				<!-- 新的模块页面 -->
				<style type="text/css">
					.home,#Profile,#Messages{
						margin-left: 0;
					}
					.home .span2{
						margin-top:1.388%;
						text-align: center;
					}
					.tab-content{
						margin-bottom: 3.6%;
					}
				</style>
				<!-- tag -->
			<!-- 	 <ul id="mytab" class="nav nav-tabs" style="margin-bottom:0px;">
				 	<li class="active"><a href="#Home" data-toggle="tab">产品管理</a></li>
				 </ul> -->
				<!-- /tag -->
				<div  class="tab-content">
			        <div class="tab-pane fade in active home">
						<sec:authorize ifAnyGranted="GOODTYPE_LIST">
			        	<li class="span2">
							<a href="<%=basePath%>page/ttw/manage/goods/goodsCategoryList.jsp" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-banner.png"	alt="" class="caption">
								<h4>产品分类</h4>
							</a>
						</li>
						</sec:authorize>
						
						
						<sec:authorize ifAnyGranted="GOOD_ATTR_LIST">
						<li class="span2">
							<a href="<%=basePath%>page/ttw/manage/goods/goodsAttributeList.jsp" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-banner-categories.png"	alt="" class="caption">
								<h4>产品属性</h4>
							</a>
						</li>
						</sec:authorize>
						
						<sec:authorize ifAnyGranted="PPSX_ADD">
						<li class="span2">
							<a href="<%=basePath%>page/ttw/manage/goods/brandList.jsp" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-banner-client.png"	alt="" class="caption">
								<h4>品牌设置</h4>
							</a>
						</li>
						</sec:authorize>
						
						<sec:authorize ifAnyGranted="GOODS_LIST">
						<li class="span2">
							<a href="<%=basePath%>page/ttw/manage/goods/goodsList.jsp" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-stats.png"	alt="" class="caption">
								<h4>产品列表</h4>
							</a>
						</li>
						</sec:authorize>
						<%-- 
						<li class="span2">
							<a href="<%=basePath%>admin/goods/goodstypetnbrandsment.jsp?operate=find" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-banner-tracks.png"	alt="" class="caption">
								<h4>品牌类型</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>admin/products/productspecificationment.jsp?operate=find" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-media.png"	alt="" class="caption">
								<h4>商品规格</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>admin/goods/goodscommentment.jsp?operate=find" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-levels.png"	alt="" class="caption">
								<h4>商品评论</h4>
							</a>
						</li>
						--%>
			        </div>
				</div>
				<!-- tag -->
		<!-- 		<ul id="mytab" class="nav nav-tabs" style="margin-bottom:0px;">
				 	<li class="active"><a href="#Home" data-toggle="tab">订单管理</a></li>
				</ul> -->
				<!-- /tag -->
				<div class="tab-content">
			        <div class="tab-pane fade in active home">
			        	<%-- <li class="span2">
							<a href="<%=basePath%>page/business/manage/order/orderList.jsp?m=member" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-user.png" alt="" class="caption">
								<h4>会员订单</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>page/business/manage/order/orderList.jsp?m=supplier" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-groups.png" alt="" class="caption">
								<h4>供应商订单</h4>
							</a>
						</li> --%>
			        </div>
				</div>
				<%--
				<!-- tag -->
				 <ul id="mytab" class="nav nav-tabs">
				 	<li class="active"><a href="#Home" data-toggle="tab">会员管理</a></li>
				 </ul>
				<!-- /tag -->
				<div  class="tab-content">
			        <div class="tab-pane fade in active home">
			        	<li class="span2">
							<a href="<%=basePath%>admin/member/member.jsp?operate=add" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-user-add.png"	alt="" class="caption">
								<h4>添加会员</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>admin/member/membergroup.jsp?operate=add" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-groups-add.png"	alt="" class="caption">
								<h4>添加会员分组</h4>
							</a>
						</li>
			        </div>
				</div>
				<!-- tag -->
				 <ul id="mytab" class="nav nav-tabs">
				 	<li class="active"><a href="#Home" data-toggle="tab">内容管理</a></li>
				 </ul>
				<!-- /tag -->
				<div  class="tab-content">
			        <div class="tab-pane fade in active home">
			        	<li class="span2">
							<a href="<%=basePath%>admin/pagecontent/sitenavigationment.jsp?operate=find" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-links-cat.png"	alt="" class="caption">
								<h4>导航设置</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>admin/pagecontent/article.jsp?operate=add" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-article-add.png"	alt="" class="caption">
								<h4>添加文章</h4>
							</a>
						</li>
						<li class="span2">
							<a href="<%=basePath%>admin/pagecontent/articlecategoryment.jsp?operate=find" class="thumbnail">
								<img src="<%=basePath%>page/platform/ui/assets/img/header/icon-48-article-edit.png"	alt="" class="caption">
								<h4>文章分类</h4>
							</a>
						</li>
			        </div>
				</div>
				--%>
			</div>

			<div class="span3">
				<h4>最新需发货订单</h4>
				<ul class="nav nav-list bs-docs-sidenavh">
					<!-- <li><a href="#">2015-07-27  手机</a></li> -->
				</ul>
				<div class="line-dotted"></div>
				<%-- 
				<h4>销量 Top 5</h4>
				<ul class="nav nav-list bs-docs-sidenavh">
					<li><a href="#dropdowns"><span class="badge badge-success">1</span>
							西牧狼商务英伦复古牛皮</a></li>
					<li><a href="#buttonGroups"><span
							class="badge badge-warning">2</span> 限量300台送UV镜！特价尼康 D3200！</a></li>
					<li><a href="#buttonDropdowns"><span
							class="badge badge-important">3</span> 电子书刊畅读卡（季度卡）赠《攻心话术》！</a></li>
					<li><a href="#navs"><span class="badge badge-info">4</span>
							ayhke磨砂牛皮保暖棉鞋</a></li>
					<li><a href="#navbar"><span class="badge badge-inverse">5</span>
							E人E本T4 WIFI版</a></li>
				</ul>
				--%>

			</div>
		</div>

	</div>

	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>