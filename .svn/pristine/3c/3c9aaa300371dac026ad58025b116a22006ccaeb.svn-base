<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp"></jsp:include>
	<script src="${ctx}/page/common/js/My97DatePicker/WdatePicker.js"></script>
	<script src="${ctx}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
	<script src="${ctx}/dwr/engine.js"></script>
	<script src="${ctx}/dwr/util.js"></script>
	<script src="${ctx}/page/common/js/utils/jquery_extend.js"></script>
	<script src="${ctx}/page/common/js/utils/stringutils.js"></script>
	<script type="text/javascript" src="${ctx}/page/common/js/layer/layer.js"></script>
	<script src="${ctx}/dwr/interface/MemberAction.js"></script>
	<title>淘桃网-会员注册</title>
	
	<style type="text/css">
		._input{
			width: 245px !important;
		}
	</style>
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main class="register-main">
		<form id = "regForm"  method="post">
			<section class="register-wrap register-step-1 ">
				
				<div class="row">
					<div class="cell">邮箱</div>
					<div class="cell">
						<input type="text" id="email" name="email" required placeholder="邮箱" class="_input">
						<div id = "emailInput"></div>
					</div>
				</div>
				
				<div class="row">
					<div class="cell">密码</div>
					<div class="cell">
						<input type="password" id = "pwd" name='pwd' required placeholder="密码" class="_input">
						<div id = "pwdInput"></div>
					</div>
				</div>
				<div class="row">
					<div class="cell">确认密码</div>
					<div class="cell">
						<input type="password" id = "surePwd"  name='surePwd' required placeholder="确认密码" class="_input">
						<div id = "surePwdInput"></div>
					</div>
				</div>
				
				<div class="row">
					<div class="cell"></div>
					<div class="cell">
						<input type="checkbox" id="protocol_agree_id"><label for="protocol_agree_id">同意</label>
						<a class="register-protocol-a" href="#">淘桃网协议</a>
						<div id = "agreeInput"></div>
					</div>
				</div>
				
				
				<div class="row">
					<div class="cell"></div>
					<div class="cell">
						<input type="button" value="注册" id="reg_submit_btn">
					</div>
				</div>
			</section>	
			
			<section class="register-wrap register-step-3 hidden">
				<img src="images/face_icon.png" alt="注册成功">
				<span>恭喜您，注册成功!</span>
				<div class="clear"></div>
				<p>系统<strong id ="time">3</strong>秒后跳转到<a href="${ctx}/page/ttw/front/login.jsp">登录</a>页面!</p>
			</section>
		</form>

		<div class="register-protocol-content hidden">
			<p>淘桃网服务协议</p>
			<p>
				1、这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述
			</p>
			<p>
				2、这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述
				这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述
			</p>
			<p>
				3、这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述
				这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述这里是协议内容描述
			</p>
		</div>
	</main>
	
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	
<script type="text/javascript">
	function isNotEmpty(str){
		if(str != null && str.trim() != '' && str.trim().toUpperCase() != 'UNDEFINED'){  
			return true;
		}
		return false;   
	}
	
	//验证基本信息
	function valideBasic(){
		var email= $("#email").val();
		var pwd = $("#pwd").val();
		var surePwd = $("#surePwd").val();
		var protocol_agree_id = $("#protocol_agree_id").prop("checked");
		var msg  = validateAccount(email);
		if(isNotEmpty(msg)){
			$('#emailInput').text(msg).css({'color':'red'});
			return false;
		}else{
			$('#emailInput').text("");
		}
		if(!isNotEmpty(email)){
			$('#emailInput').text("邮箱不能为空！").css({'color':'red'});
			return false;
		}else if(email.length > 30){
			$('#emailInput').text("邮箱过长").css({'color':'red'});
			return false;
		}else{
			$('#emailInput').text("");
		}
		if(!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email))){
			$('#emailInput').text("邮箱格式不合法！").css({'color':'red'});
			return false;
		}else{
			$('#emailInput').text("");
		}
		if(!isNotEmpty(pwd)){
			$('#pwdInput').text("密码不能为空！").css({'color':'red'});
			return false;
		}else if(pwd.length < 6){
			$('#pwdInput').text("密码长度不得少于6位！").css({'color':'red'});
			return false;
		}else if(pwd.length >20){
			$('#pwdInput').text("密码长度不得超过20位！").css({'color':'red'});
			return false;
		}else{
			$('#pwdInput').text("");
		}
		if(!isNotEmpty(surePwd)){
			$('#surePwdInput').text("确认密码不能为空！").css({'color':'red'});
			return false;
		}else if(pwd != surePwd){
		 	$('#surePwdInput').text("确认密码和密码不一致！").css({'color':'red'});
		 	return false;
		}else{
			$('#surePwdInput').text("");
		}
		if(!protocol_agree_id){
			$('#agreeInput').text("请勾选同意淘桃网协议").css({'color':'red'});
			return false;
		}else{
			$('#agreeInput').text("");
		}
		return true;
	}
	
	//账户是否已经存在
	function validateAccount(account){
		var rst = "";
		$.ajax({
			type: "POST",
			async:false,//false同步  默认为true 异步
			url:webRoot+"/page/admin/user/getAccountExists",
			data: "account="+account,
			success: function(msg){
				if(msg && msg.valid){
					rst = "该邮箱已经被使用";
				}
			}
		});
		return rst;
	}
	
	
	var n = 3;
	function redirector(){
	      if(n>0){
	            //页面提示
	            document.getElementById('time').innerHTML= + n;
	            n--;
	            setTimeout("redirector()",1000);
	      } else {
	    	  window.location =webRoot+'/page/ttw/front/login.jsp';
	      }
	}

	$(function() {
		// 初始化事件
		function _initEvent(){
			// 注册按钮事件
			$("#reg_submit_btn").click(function(){
				var _id = this.id;
				if(_id == "reg_submit_btn"){
					if(valideBasic()){
						var reg_layer = layer.load(4);
						var regForm = $("#regForm").serializeObject();
						regForm.name = "";//姓名默认为空
						MemberAction.register(regForm,function(data){
							if(data.result){
								$(".register-step-1").addClass("hidden");
								$(".register-step-3").removeClass("hidden");
								/*3s后跳转到登陆页面**/
								redirector();
							}else{
								layer.close(reg_layer);
								lhgdialog.alert("注册失败,请联系管理员");
							}
							layer.close(reg_layer);
						});
					}
				}
			});

			// 查看协议内容
			$(".register-protocol-a").click(_showProtocolContent);
		}

		

	    function _showProtocolContent(){
	    	reg_layer_idx = layer.open({
			    type: 1,
			    title:"温馨提示",
			    area: ['650px', '400px'], //宽高
			    shift: 1,
			    shadeClose: false, //开启遮罩关闭
			    content: $(".register-protocol-content"),
			    btn:["同意"],
			    yes:function(){
			    	$("#protocol_agree_id").attr("checked","checked");
			    	layer.close(reg_layer_idx);
			    }
			});
	    }

		var userRegister = function(opts){
			this.options = $.extend(true, {},opts);
			this._init.call(this);
	    };
	    
		userRegister.prototype = {
    		constructor:userRegister,
    		_init:function(){
    			//这里做初始化工作
    			_initEvent();
    			// 头部高度+尾部高度+尾部margin_top+login_wrap_margin_top
    			$("main").height($(document).height()-($(".top-header").height()+$(".home-footer").height())-40-30);
    		}
	    };
	    new userRegister();
	});
</script>
</body>
</html>