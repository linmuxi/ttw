<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
		//姓名
		$("#name").val(_member.name);
		//性别
		var gender = _member.gender;
		if(gender == 1){
			$("input[type=radio][value=1]").attr("checked",'checked');
		}else if(gender == 0){
			$("input[type=radio][value=0]").attr("checked",'checked');
		}else{
			
		}
		//出生日期
		if("" !=_member.birth && _member.birth != null){
			$("#birth").val((new Date(_member.birth)).format("yyyy-MM-dd"));
		}
		//登录账号
		$("#account").val(_member.account);
		//邮件地址
		$("#email").val(_member.email);
		//地址
		$("#address").val(_member.address);
		//手机号码
		$("#mobile").val(_member.mobile);
		//QQ
		$("#qq_code").val(_member.qq_code);
		//办公电话
		$("#office_phone").val(_member.office_phone);
		//图像
		if("" !=_member.urlImg && _member.urlImg != null){
			$("#urlimg").attr("src", _member.urlImg);
		}
	});
	
});

</script>
<style type="text/css">
.member-content-header{
 	height: 60px !important;
}

.member-base * {
 margin-left: 5px !important;
 padding:3px !important; 
 font-size: 1.0em !important;
}

.input_base {
width: 220px;
border:0px solid !important;
border-color: #e6e6e6 !important;
background-color:#FFF;
}

.member_radio{
  width: 15px !important;
  height: 20px !important;
}

.member_submit{
  width: 120px !important;
  height: 40px !important;
  background-color: #0096DB !important;
  color:#FFF;
  font-size:14px !important;
  margin-left:89px !important;
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

		<div class="member-content">
			<div class="member-content-header">
				<p style="color: #0096DC;font-size: 1.2em;">基本信息</p>
				<hr>
				<span class="float-right">问题反馈</span>
				<span class="float-right">|</span>
				<span class="float-right">操作说明</span>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<div class="member-base">
				<table>
					<tr>
						<td><div>登录账号:<input type="text" name="account" id="account" readonly="readonly" class="input_base"/></div></td>
						<td rowspan="4"><div>&nbsp;&nbsp;会员图像</div><div><img id="urlimg" class="float-left" src="${ctx}/upload/member/default.png" border="1" alt="你的头像" width="110" height="130"></div></td>
					</tr>
					<tr>
						<td><div>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:<input type="text" name="name" id="name" readonly="readonly" class="input_base"/></div></td>
					</tr>
					<tr>
						<td>
							<div>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:
							<input class="member_radio" type="radio" value="1" name="gender" id ="ngender" disabled="disabled"><label for="ngender">男</label>
							<input class="member_radio" type="radio" value="0" name="gender" id ="vgender" disabled="disabled"><label for="vgender">女</label></div>
						</td>
					</tr>
					<tr>
						<td><div>Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Q:<input type="text" name="qq_code" id="qq_code" class="input_base" readonly="readonly"/></div></td>
					</tr>
					<tr>
						<td><div>出生日期:<input name="birth" id="birth" readonly="readonly" class="input_base"/></div></td>
					</tr>
					<tr>
						<td><div>手机号码:<input type="text" name="mobile" id="mobile" class="input_base" readonly="readonly"/></div></td>
					</tr>
					<tr>
						<td><div>办公电话:<input type="text" name="office_phone" id="office_phone" class="input_base" readonly="readonly"/></div></td>
					</tr>
					<tr>
						<td><div>邮件地址:<input type="text" name="email" id="email" class="input_base" readonly="readonly"/></div></td>
					</tr>
					<tr>
						<td><div>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	址:<input type="text" name="address" id="address" readonly="readonly" class="input_base"/></div></td>
					</tr>
				</table>
			</div>
		</div>	
		<div class="clear"></div>
	</main>
	<jsp:include page="/page/ttw/front/footer.jsp"></jsp:include>
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

				$(".member-content .row").mouseover(function(){
					if(this.className != '' && this.className.match('header')){
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
	    			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
	    			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-30-30);
	    		},
	    		_showBasicInfo:function(){
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