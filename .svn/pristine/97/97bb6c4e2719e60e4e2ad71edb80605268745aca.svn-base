<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp"></jsp:include>
	<title>淘桃网-会员登录</title>
	<script src="${pageContext.request.contextPath}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	<style type="text/css">
		.member_submit_login{
			color: #FFF;
			width:120px !important;
			background-color:#0096db !important;
			cursor: pointer;
		}
		._input{
			width: 245px !important;
		}
		
		.verifyCodeInput{
			width: 125px !important;
		}
	
	</style>
	<script type="text/javascript">
		$(function(){
			$(document).keydown(function(event){ 
				if(event.keyCode==13){ 
					$("#loginSubmit").click(); 
				}
			});
		});
		
		// 重载验证码  
	    function reloadVerifyCode(){  
	        var timenow = new Date().getTime();
	        document.getElementById("safecode").src="<%=request.getContextPath()%>/loginVerifyCode?d="+timenow;  
	    }
	</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main class="login-main">
		<form id ="myform">
		<section class="login-wrap">
			<div class="row">
				<div class="cell">账号</div>
				<div class="cell">
					<input type="text" id = "account" required  placeholder="账号/邮箱" class="_input">
					<div id = "accountInput"></div>
				</div>
			</div>
			<div class="row">
				<div class="cell">密码</div>
				<div class="cell">
					<input type="password" id = "password" required placeholder="密码" class="_input">
					<div id = "passwordInput"></div>
				</div>
			</div>
			<div class="row">
				<div class="cell">验证码:</div>
				<div class="cell">
					<input type="text" id ="verifyCode" required  placeholder="验证码" class="verifyCodeInput">
					<img alt="验证码" id="safecode" src="${ctx}/loginVerifyCode"/>
					<div id = "verifyCodeInput"></div>
					<a href="javascript:reloadVerifyCode();" style="text-decoration: none;"><br/>看不清楚,换一个</a>
				</div>
			</div>
			<div class="row">
				<div class="cell"></div>
				<div class="cell">
					<input type="button" value="登录" id="loginSubmit" class="member_submit_login">
					<a class="register-protocol-a" href="${ctx}/page/ttw/front/member/password_find_member.jsp">忘记密码?</a>
					<a class="register-protocol-a" href="${ctx}/page/ttw/front/register.jsp">立即注册</a>
				</div>
			</div>
		</section>
		</form>
	</main>

	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(function() {
			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-40-30);
		});
	</script>
	
	<script type="text/javascript">
	function isNotEmpty(str){
		if(str != null && str.trim() != '' && str.trim().toUpperCase() != 'UNDEFINED'){  
			return true;
		}
		return false;   
	}
	
	function checkValue(){
		var account = $("#account").val();
		var password = $("#password").val();
		var verifyCode = $("#verifyCode").val();
		if(!isNotEmpty(account)){
			$('#accountInput').text("账号不能为空").css({'color':'red'});
			return false;
		}else if(account.length > 30){
			$('#accountInput').text("账号长度不能超过30个字节").css({'color':'red'});
			return false;
		}else{
			$('#accountInput').text("");
		}
		if(!isNotEmpty(password)){
			$('#passwordInput').text("密码不能为空").css({'color':'red'});
			return false;
		}else if(password.length > 25){
			$('#passwordInput').text("密码长度不能超过25个字节").css({'color':'red'});
			return false;
		}else{
			$('#passwordInput').text("");
		}
		if(!isNotEmpty(verifyCode)){
			$('#verifyCodeInput').text("验证码不能为空").css({'color':'red'});
			return false;
		}else if(verifyCode.length > 4){
			$('#verifyCodeInput').text("验证码长度不能超过4个字节").css({'color':'red'});
			return false;
		}else if(!checkVerifyCode(verifyCode)){
			$('#verifyCodeInput').text("验证码不正确，请重新输入。").css({'color':'red'});
			return false;
		}else{
			$('#verifyCodeInput').text("");
		}
		return true;
	}
	
	
	//验证码是否正确
	function checkVerifyCode(verifyCode){
		var rst = false;
		$.ajax({
			type: "POST",
			async:false,//false同步  默认为true 异步
			url:webRoot+"/page/admin/user/loginCheckVerifyCode",
			data: "code="+verifyCode,
			success: function(msg){
				if(msg && msg.flag){
					rst = true;
				}
			}
		});
		return rst;
	}
	
	
	$("#loginSubmit").click(function(){
		if(checkValue()){
			var login_layer = layer.load(4);
			var account = $("#account").val();
			var password = $("#password").val();
			var actionUrl = getActionUrl();
			$.ajax({
				type : "post",
				async:false,
				dataType:"json",
				url : webRoot + "/page/mylogin?type=1",
				success : function(data) {
					if (data) {
						if(data != null){
							if (data.flag) {
								if(actionUrl != ''){
									window.location = webRoot + actionUrl;
								}else{
									window.location = webRoot + "/page/ttw/frontbg/member/center";
								}
							} else {
								var msg = "";
								switch(data.data.code){
								case "1":
									msg = "用户不存在";
									break;
								case "2":
									msg = "密码错误";
									break; 
								case "3":
									msg = "账户被锁";
									break;
								case "4":
									msg = "用户失效";
									break;
								case "5":
									msg = "用户过期";
									break;
								case "6":
									msg = "密码过期";
									break;
								case "-1":
									msg = "会员信息为空,请联系管理员";
									break;
								}
								layer.close(login_layer);
								lhgdialog.alert(msg);
							}
						}else{
							layer.close(login_layer);
							lhgdialog.alert("登录异常，请联系管理员");
						}
					}
					layer.close(login_layer);
				},
				data : {
					account : account,
					password : password,
					type:1
				},
				error : function(data) {
					layer.close(login_layer);
					lhgdialog.alert("登录异常，请联系管理员");
				}
			});
		}
	});
	
	function getActionUrl(){
		if("${param.actionType}" == 'productDetail'){
			return "/page/portal/product?productId=${param.productId}";
		}
		return "";
	}
	</script>
</body>
</html>