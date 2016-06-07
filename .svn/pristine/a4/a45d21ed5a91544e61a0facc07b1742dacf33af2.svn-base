<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
	<title>淘桃网-会员忘记密码</title>
	<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
	<script src="${pageContext.request.contextPath}/dwr/util.js"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	<script src="${ctx}/dwr/interface/MemberAction.js"></script>
	<title>淘桃网-会员忘记密码</title>
	<style type="text/css">
		.member_submit_login{
			color: #FFF;
			width:120px !important;
			background-color:#0096db !important;
			cursor: pointer;
		}
		._tip{
			padding-left: 245px;
		    margin-top: 10px;
		}
		
		.accountInput{
			width: 200px !important;
		}
		.verifyCodeInput{
			width: 125px !important;
		}
	</style>
	
	<script type="text/javascript">
		// 重载验证码  
	    function reloadVerifyCode(){  
	        var timenow = new Date().getTime();
	        document.getElementById("safecode").src="<%=request.getContextPath()%>/forGetVerifyCode?d="+timenow;  
	    }
	</script>
	
</head>
<body>
	<jsp:include page="/page/ttw/front/header.jsp"></jsp:include>
	<main class="login-main">
		<form id ="myform">
		<div class="_tip"><font>温馨提示：请输入需要找回密码的帐号/邮箱</font></div>
		<section class="login-wrap">
			<div class="row">
				<div class="cell">您的账号:</div>
				<div class="cell">
					<input type="text" id ="account" required  placeholder="账号/邮箱" class="accountInput">
					<div id = "accountInput"></div>
				</div>
			</div>
			<div class="row">
				<div class="cell">验证码:</div>
				<div class="cell">
					<input type="text" id ="verifyCode" required  placeholder="验证码" class="verifyCodeInput">
					<img alt="验证码" id="safecode" src="${ctx}/forGetVerifyCode"/>
					<div id = "verifyCodeInput"></div>
					<a href="javascript:reloadVerifyCode();" style="text-decoration: none;"><br/>看不清楚,换一个</a>
				</div>
			</div>
			<div class="row">
				<div class="cell"></div>
				<div class="cell">
					<input type="button" value="确定" id="rsubmit" class="member_submit_login">
				</div>
			</div>
		</section>
		</form>
	</main>

	<jsp:include page="/page/ttw/front/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$(function(){
			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-40-30);
			
			//绑定回车事件
			$(document).keydown(function(event){
				if(event.keyCode==13){ 
					$("#rsubmit").click(); 
				}
			});
		});
		function isNotEmpty(str){
			if(str != null && str.trim() != '' && str.trim().toUpperCase() != 'UNDEFINED'){  
				return true;
			}
			return false;   
		}
		
		//账户是否已经存在
		function verifyAccount(account){
			var rst = false;
			$.ajax({
				type: "POST",
				async:false,//false同步  默认为true 异步
				url:webRoot+"/page/admin/user/getAccountExists",
				data: "account="+account,
				success: function(msg){
					if(msg && msg.valid){
						rst = true;
					}
				}
			});
			return rst;
		}
		
		
		//验证码是否正确
		function checkVerifyCode(verifyCode){
			var rst = false;
			$.ajax({
				type: "POST",
				async:false,//false同步  默认为true 异步
				url:webRoot+"/page/manage/member/forGetCheckverifyCode",
				data: "code="+verifyCode,
				success: function(msg){
					if(msg && msg.flag){
						rst = true;
					}
				}
			});
			return rst;
		}
		
		function checkValue(){
			var account = $("#account").val();
			var verifyCode = $("#verifyCode").val();
			if(!isNotEmpty(account)){
				$('#accountInput').text("账号/邮箱不能为空").css({'color':'red'});
				return false;
			}else if(account.length > 30){
				$('#accountInput').text("账号/邮箱长度不能超过30个字节").css({'color':'red'});
				return false;
			}else if(!verifyAccount(account)){
				$('#accountInput').text("账号/邮箱不存在").css({'color':'red'});
				return false;
			}else{
				$('#accountInput').text("");
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
	
	
		$("#rsubmit").click(function(){
			if(checkValue()){
				var account = $("#account").val();
				var _layer = layer.load(4);
				MemberAction.passWord_find(account,function(val){
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
				$("#account").val("");
				$('#verifyCode').val("");
			}
		});
	</script>
</body>
</html>