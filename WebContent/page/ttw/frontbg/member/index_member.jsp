<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html language="en">
<head>
<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/jPaginate/css/style.css" media="screen"/>
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${ctx}/page/ttw/js/member/member.js" ></script>
<script src="${ctx}/dwr/interface/MemberAction.js"></script>
<title>淘桃网-会员中心</title>
<script type="text/javascript">
// 文档就绪
$(function(){
	MemberAction.getMemberInfo_front(function(data){
		var _member = data.member;
		//上次登录时间
		$("#lastLoginDate").html((new Date(_member.lastLoginDate)).format("yyyy年MM月dd日  hh:mm:ss "));
		//当前用户
		$("#userName").html("你好:<b>"+_member.account+"</b>");
		//图像
		if("" !=_member.urlImg && _member.urlImg != null){
			$("#urlimg").attr("src", _member.urlImg);
		}
	});
});
</script>
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

		<div class="member-content">
			<div class="member-content-header">
				<p>上次登录时间：<span id="lastLoginDate"></span></p>
				<hr>
				<img class="float-left"  id="urlimg" src="${ctx}/upload/member/default.png" border="1" alt="你的头像" width="110" height="130">
				<span class="float-left" id="userName"></span>
				<span class="float-right">问题反馈</span>
				<span class="float-right">|</span>
				<span class="float-right">操作说明</span>
				<div class="clear">
				</div>
			</div>
			<div class="clear"></div>
			<span class="member-order-title">最近订单</span>
			<section class="table">
				<div class="row header">
					<div class="cell">销售订单号</div>
					<div class="cell">商品名称</div>
					<div class="cell">下单日期</div>
					<div class="cell">金额</div>
					<div class="cell">状态</div>
					<div class="cell">操作</div>
				</div>
				<c:forEach items="${modelMap.rows}" var="order">
				<div class="row">
					<div class="cell">${order.orderSn}</div>
					<div class="cell">${order.goodsName}</div>
					<div class="cell">${order.createDate}</div>
					<div class="cell">${order.amount}元</div>
					<div class="cell">
						<c:choose>
							<c:when test="${order.orderStatus=='0'}">未确认</c:when>
							<c:when test="${order.orderStatus=='1'}">待核实</c:when>
							<c:when test="${order.orderStatus=='2'}">待制作</c:when>
							<c:when test="${order.orderStatus=='3'}">制作中</c:when>
							<c:when test="${order.orderStatus=='4'}">待验收</c:when>
							<c:when test="${order.orderStatus=='5'}">待上传源文件</c:when>
							<c:when test="${order.orderStatus=='6'}">待支付尾款</c:when>
							<c:when test="${order.orderStatus=='7'}">已完成</c:when>
							<c:when test="${order.orderStatus=='10'}">审核退回</c:when>
						</c:choose>
					</div>
					<div class="cell">
						<a href="order/detail?id=${order.id}">[查看]</a>
						<%-- <c:if test="${order.orderStatus=='10'}">
							<a href="#">[编辑]</a>
						</c:if> --%>
						<c:if test="${order.orderStatus=='4'}">
							<a href="order/detail?id=${order.id}">[验收]</a>
						</c:if>
						<%-- <c:if test="${order.orderStatus=='6'}">
							<a href="#">[确认收货]</a>
						</c:if> --%>
					</div>
				</div>
				</c:forEach>
			</section>
			<hr />
			<div class="member-order-footer" style="padding-left: 280px; ">
                <div class="paginate-ui"></div>
			</div>
		</div>

		<div class="clear"></div>
	</main>

	<jsp:include page="/page/ttw/front/footer.jsp"></jsp:include>

	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/jPaginate/jquery.paginate.js"></script>
	<script type="text/javascript">
		$(function() {
			// 初始化事件
			function _initEvent(){
				$(".member-aside li").mouseover(function(){
					if(this.className != '' && this.className.match('child-wrap')){
						return;
					}
					$(this).addClass("selected");
				}).mouseleave(function(){
					$(this).removeClass("selected");
				});
			}
			
			// 清空会员导航背景色
			function _clearMemberNavBg(){
				$(".member-aside a").each(function(){
					$(this).parent().removeClass("selected");
				})
			};

			// 初始化分页
			function _initPaginate(){
				$(".paginate-ui").paginate({
					count 		: 1,
					start 		: 1,
					display     : 10,
					border					: true,
					border_color			: '#fff',
					text_color  			: '#fff',
					background_color    	: 'black',	
					border_hover_color		: '#ccc',
					text_hover_color  		: '#FFF',
					background_hover_color	: '#0096DC', 
					images					: false,
					mouse					: 'press',
					onChange: function(page){
						//alert(page);
					}
				});
				$(".jPag-first").html("首页");
				$(".jPag-last").html("尾页"); 
			}
		    
		    var member = function(opts){
				this.options = $.extend(true, {},opts);
				this._init.call(this);
		    }
		    
		    member.prototype = {
	    		constructor:member,
	    		_init:function(){
	    			//这里做初始化工作
	    			_initEvent();
	    			_initPaginate();
	    			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
	    			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-30-30);
	    		},
	    		_showBasicInfo:function(){
	    			//这里显示基本信息信息	
	    		},
	    		_passwordModify:function(){
	    			//这里密码修改
	    		},
	    		_infoModify:function(){
	    			//这里信息修改
	    		},
	    		_passwordModify:function(){
	    			//这里订单信息
	    		},
	    		_invoiceMgr:function(){
	    			//这里发票管理
	    		}
		    };
		    
		    new member();
		    
		});
	</script>
</body>
</html>