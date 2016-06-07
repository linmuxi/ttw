<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
	<script src="${ctx}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	<title>淘桃网-会员忘记密码</title>
	<script src="${ctx}/dwr/engine.js"></script>
	<script src="${ctx}dwr/util.js"></script>
	<script src="${ctx}/dwr/interface/MemberAction.js"></script>
	<title>淘桃网-会员重置密码</title>
	<style type="text/css">
		.member_submit_login{
			color: #FFF;
			width:120px !important;
			background-color:#0096db !important;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<jsp:include page="/page/ttw/front/header.jsp"></jsp:include>
	<main class="login-main">
		<form id ="myform">
		<section class="login-wrap">
			<input type="hidden" value="${email}" id="email" />
			<div class="row">
				<div class="cell">新密码：</div>
				<div class="cell">
					<input type="password" id = "pwd" required  placeholder="新密码">
					<div id = "pwdInput"></div>
				</div>
			</div>
			<div class="row">
				<div class="cell">确认新密码：</div>
				<div class="cell">
					<input type="password" id = "repwd" required  placeholder="确认新密码">
					<div id = "repwdInput"></div>
				</div>
			</div>
			<div class="row">
				<div class="cell"></div>
				<div class="cell">
					<input type="button" value="确定" id="pwdsubmit" class="member_submit_login">
				</div>
			</div>
		</section>
		</form>
	</main>

	<jsp:include page="/page/ttw/front/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(function() {
			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-40-30);
			
			$(document).keydown(function(event){ 
				if(event.keyCode==13){ 
					$("#pwdsubmit").click(); 
				}
			});
		});	
		function isNotEmpty(str){
			if(str != null && str.trim() != '' && str.trim().toUpperCase() != 'UNDEFINED'){  
				return true;
			}
			return false;   
		}
		
		function checkValue(){
			var pwd = $("#pwd").val();
			var repwd = $("#repwd").val();
			if(!isNotEmpty(pwd)){
				$('#pwdInput').text("新密码不能为空").css({'color':'red'});
				return false;
			}else if(pwd.length > 30){
				$('#pwdInput').text("新密码长度不能超过20个字节").css({'color':'red'});
				return false;
			}else{
				$('#pwdInput').text("");
			}
			if(!isNotEmpty(repwd)){
				$('#repwdInput').text("确认新密码不能为空").css({'color':'red'});
				return false;
			}else if(repwd.length > 30){
				$('#repwdInput').text("确认新密码长度不能超过20个字节").css({'color':'red'});
				return false;
			}else{
				$('#repwdInput').text("");
			}
			if(pwd!=repwd){
				$('#repwdInput').text("两次输入新密码不一致").css({'color':'red'});
				return false;
			}else{
				$('#repwdInput').text("");
			}
			return true;
		}	
			
	
		$("#pwdsubmit").click(function(){
			if(checkValue()){
				var pwd = $("#pwd").val();
				var email = $("#email").val();
				var _layer = layer.load(4);
				MemberAction.updatepwd(email,pwd,function(val){
					if(val){
						layer.close(_layer);
						if(val.flag){
							lhgdialog.tips(val.msg,4);
						}else if(!val.flag){
							lhgdialog.alert(val.msg);
						}else{
							lhgdialog.alert("密码重置失败，请联系管理员。");
						}
					}
				});
				$("#pwd").val("");
				$("#repwd").val("");
			}
		});
	</script>
</body>
</html>