<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi"> -->
<title>首页 </title>
<!-- Le styles -->
<link href="${pageContext.request.contextPath}/page/admin/ui/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/ui/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/ui/css/docs.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/ui/js/google-code-prettify/prettify.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/ui/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/js/plugins/icheckmaster/skins/square/blue.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/js/plugins/flexigrid/css/flexigrid/flexigrid_blue.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/page/admin/js/plugins/uploader/fileuploader.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/js/plugins/farbtastic/farbtastic.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/page/admin/ui/ico/favicon.ico" rel="shortcut icon" >
<script>
	var webRoot = "${pageContext.request.contextPath}";
</script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".navbar-inverse-collapse"> <span class="icon-bar"></span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="nav-collapse collapse navbar-inverse-collapse">
					<ul class="nav">
						<li class="active"><a href="${pageContext.request.contextPath}/page/admin/main">主页</a></li>
						<%--
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">实验室 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="http://www.ostocy.com" target="_blank"><i class="icon-tags"></i> 电子点餐系统</a></li>
								<li><a href="#"><i class="icon-shopping-cart"></i>B2O线下电商</a></li>
								<li class="divider"></li>
								<li class="nav-header">未上市产品</li>
								<li><a href="#"><i class="icon-globe"></i>微信OA</a></li>
							</ul>
						</li>
						--%>
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">管理 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon-star"></i> 授权</a></li>
								<li><a href="#"><i class="icon-wrench"></i> 技术支持</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon-user"></i> 账号（管理员）</a></li>
								<li><a href="${pageContext.request.contextPath}/page/admin/user/userment.jsp?operate=find"><i class="icon-user"></i>系统用户列表</a></li>
								<li><a href="#"><i class="icon-user"></i>添加微信账号</a></li>
								<li><a href="#"><i class="icon-user"></i>微信账号设置</a></li>
								<li><a href="#"><i class="icon-envelope"></i> 信息中心 (0)</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav pull-right">
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 商品管理 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">商品类型参数设置</a></li>
								<li><a href="#">商品属性设置</a></li>
								<li><a href="#">品牌设置</a></li>
								<li><a href="#">品牌类型设置</a></li>
								<li><a href="#">商品规格设置</a></li>
								<li><a href="#">商品分类设置</a></li>
								<li class="divider"></li>
								<li><a href="#">添加新商品</a></li>
								<li><a href="#">所有商品</a></li>
								<li class="divider"></li>
								<li><a href="#">添加关联销售商品</a></li>
								<li><a href="#">关联销售商品设置</a></li>
								<li class="divider"></li>
								<li><a href="#">购物卡商品设置</a>
								</li><li class="divider"></li>
								<li><a href="#">添加团购商品</a></li>
								<li><a href="#">团购商品列表 </a></li>
								<li><a href="#">团购订单管理 </a></li>
								<li class="divider"></li>
								<li><a href="#">添加商品评论</a></li>
								<li><a href="#">商品评论</a></li>
							</ul>
						</li>
						<li class="dropdown">
						 	<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 订单管理 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li class="dropdown-submenu">
								<a tabindex="-1"href="#">普通订单</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">未付款——货到付款订单</a></li>
										<li><a tabindex="-1" href="#">已付款——需发货订单</a></li>
									</ul>
								</li>
								<li class="dropdown-submenu">
								<a tabindex="-1" href="#">团购订单</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">已付款——需发货团购订单</a></li>
									</ul>
								</li>
								<li class="dropdown-submenu">
								<a tabindex="-1" href="#">拍卖订单</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">已付款——需发货拍卖订单</a></li>
									</ul>
								</li>
								<li class="dropdown-submenu">
								<a tabindex="-1" href="#">手机订单</a>
									<ul class="dropdown-menu">
										<li><a tabindex="-1" href="#">未付款——货到付款手机订单</a></li>
										<li><a tabindex="-1" href="#">已付款——需发货手机订单</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">会员管理 <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">添加会员分组</a></li>
								<li><a href="#">会员分组列表</a></li>
								<li><a href="#">添加会员</a></li>
								<li><a href="#">会员列表</a></li>
								<li><a href="#">会员等级设置</a></li>
								<li><a href="#">会员充值中心</a></li>
							</ul></li>
						<li class="dropdown">
						    <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 内容管理 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">导航设置</a></li>
								<li><a href="#">文章分类设置</a></li>
								<li><a href="#">添加文章</a></li>
								<li><a href="#">所有文章</a></li>
								<li><a href="#">静态化内容</a></li>
							</ul>
					    </li>
						<li class="dropdown">
						     <a class="dropdown-toggle" data-toggle="dropdown" href="#"> 素材管理 <b class="caret"></b></a>
						     <ul class="dropdown-menu">
								<li><a
									href="#">图片素材列表</a></li>
						     </ul>
						</li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> 系统设置 <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">商户信息设置</a></li>
								<li><a href="#">商户信息列表</a></li>
								<li><a href="#">邮箱设置</a></li>
								<li><a href="#">全局参数设置</a></li>
								<li><a href="#">支付方式设置</a></li>
								<li><a href="#">物流及配送设置</a></li>
								<li><a href="#">模板主题设置</a></li>
								<li><a href="#">模板文件设置</a></li>
								<li><a href="#">模板文件和系统内容设置</a></li>
								<li><a href="#">系统模块设置</a></li>
								<li><a href="#">模块功能设置</a></li>
								<li><a href="#">角色权限设置</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

		</div>
	</div>


	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
 	<script src="${pageContext.request.contextPath}/page/admin/ui/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/google-code-prettify/prettify.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-transition.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-alert.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-modal.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-dropdown.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-scrollspy.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-tab.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-tooltip.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-popover.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-button.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-collapse.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-carousel.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/ui/js/bootstrap-typeahead.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/plugins/icheckmaster/jquery.icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/plugins/flexigrid/myflexigrid.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/jquery.query.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/plugins/validatorjs/validator.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/indexjs.js"></script>
	<script src="${pageContext.request.contextPath}/page/admin/js/base.js"></script>
</body>
</html>
