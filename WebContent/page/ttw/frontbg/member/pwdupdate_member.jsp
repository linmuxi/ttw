<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html language="en">
<head>
<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/jPaginate/css/style.css" media="screen"/>
<script type="text/javascript" src="${ctx}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script src="${ctx}/dwr/interface/SupplierAction.js"></script>
<script src="${ctx}/dwr/interface/MemberAction.js"></script>
<script type="text/javascript" src="${ctx}/page/ttw/js/member/member.js" ></script>
<title>淘桃网-会员中心</title>

<script type="text/javascript">
$(function(){
	$("#submit").click(function() {
		var account = $("#account").val();
		var oldpass = $("#oldpass").val();
		var pass = $("#pass").val();
		var repass = $("#repass").val();
		if('' == account || null == account){
			lhgdialog.alert('用户账号获取失败，请联系管理员。');
			return false;
		}
		if('' == oldpass || null == oldpass){
			lhgdialog.alert('原密码不能为空。');
			return false;
		}
		if('' == pass || null == pass){
			lhgdialog.alert('新密码不能为空。');
			return false;
		}
		if('' == repass || null == repass){
			lhgdialog.alert('确认新密码不能为空。');
			return false;
		}
		var _layer = layer.load(4);
		SupplierAction.updateSupplierUserPwd(account, pass, function(val) {
			if (val) {
				$("#oldpass").val("");
				$("#pass").val("");
				$("#repass").val("");
				layer.close(_layer);
				lhgdialog.tips('密码修改成功',5);
			}else{
				layer.close(_layer);
				lhgdialog.alert('密码修改失败');
			}
		});
	});
})

</script>

<style type="text/css">
.input_base {
	border:1px solid !important;
	border-color: #e6e6e6 !important;
	background-color:#FFF;
}

.member-base * {
	 margin-left: 5px !important;
	 padding:3px !important; 
	 font-size: 1.1em !important;
}

.member-content-header{
 	height: 60px !important;
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
				<p style="color: #0096DC;font-size: 1.2em;">修改密码</p>
				<hr>
				<span class="float-right">问题反馈</span>
				<span class="float-right">|</span>
				<span class="float-right">操作说明</span>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
			<form id="uppwd">
			<input type="hidden" value="${SPRING_SECURITY_CONTEXT.authentication.principal.account}" id ="account" >
				<!-- <input type="hidden" value="0000000000" id ="account" > -->
				<div class="member-base">
					<div>原&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码:<input type="password" id="oldpass" class="input_base"/></div>
					<div>新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码:<input type="password" id="pass" class="input_base"/></div>
					<div>确认新密码:<input type="password" id="repass" class="input_base"/></div>
					<div><input type="button" id="submit" value="提交" class="member_submit" class="input_base"/></div>
				</div>
			</form>
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