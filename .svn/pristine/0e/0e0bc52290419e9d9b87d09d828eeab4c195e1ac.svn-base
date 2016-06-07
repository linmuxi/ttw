<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author linyong
   @since  2015年5月23日 下午10:57:29
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
<meta name="keywords" content="忘记密码" />
<meta name="description" content="忘记密码" />
<script src="${ctx}/dwr/interface/SupplierAction.js"></script>
</head>
<style>
html,body{
	font-size:14px;
}
#ForgottenPassword{
	margin:0 auto!important;
	border:1px solid #DED8D8;
}
#ForgottenPassword div, #ForgottenPassword ul, #ForgottenPassword li,
	#ForgottenPassword p, #ForgottenPassword h3 {
	margin: 0;
	padding: 0;
}

#ForgottenPassword {
	width: 750px;
	overflow: hidden;
	_position: relative;
	background: #FAF9F5;
	margin: 0;
}

#ForgottenPassword_Wrong {
	background-color:#165185;
	border: 1px solid #FFF;
	color:#FFF;
	display: none;
}

#ForgottenPassword_Wrong h3 {
	margin-left: 84px;
	margin-top: 15px;
	color: #fff;
	border-bottom: 1px solid #fff;
	padding-bottom: 3px;
	margin-right: 35px;
}

#ForgottenPassword_Wrong ul {
	margin: 10px auto 15px 100px;
}

#ForgottenPassword_Wrong ul li {
	margin-top: 5px;
}

#ForgottenPassword p, #ForgottenPassword label {
	color: #3A3E47;
}

#ForgottenPassword p {
	line-height: 20px;
 	margin: 10px 0;
	font-size:1.2em;
	padding-left:20px;
}

#ForgottenPassword_Form {
	border-top: 1px solid #D3E4F2;
	width: 100%;
}

#ForgottenPassword_Form div {
	width: 100%;
	overflow: hidden;
	_zoom: 1;
	clear: both;
	border-bottom: 1px solid #D3E4F2;
	padding: 5px;
}

#ForgottenPassword_Form div input{
	background-color:#FFF;
	height:30px;
	width:200px;
	padding:0px 10px; 
}

#ForgottenPassword_Form div label, #ForgottenPassword_Form div input#nickname,
	#ForgottenPassword_Form div input#email {
	float: left;
	display: inline;
}

#ForgottenPassword_Form div label {
	width: 160px;
	text-align: right;
	margin-right: 10px;
	line-height: 35px;   
}

#ForgottenPassword_Form div input#submit {
	cursor: pointer;
	background-color:#0060CC;
	color:#FFF;
	width: 110px;
	height: 40px;   
	border-radius:8px;	
	margin-left:166px;        
	font-size:14px;
	padding:5px 8px;
	border:0px;   
}

#ForgottenPassword_Form div input#submit:hover {
}

#ForgottenPassword_Form input.wronginput {
	background: #FFCEC7;
}
 
#ForgottenPassword_link {
	margin: 10px auto 15px 100px !important;
}

#ForgottenPassword_link li {
	margin-top: 5px !important;
}

#ForgottenPassword_link li a {
	text-decoration: underline;
	color: #EB8600;
}

.forgetpwd-back{
	cursor: pointer;
	background-color:#0060CC !important;
	color:#FFF;
	width: 110px !important;  
	height: 40px !important;
	border-radius:8px;	
	font-size:14px;
	padding:5px 8px;   
	border:0px;
}


#ForgottenPassword_link li a:hover {
	text-decoration: none;
}

</style>
<body>
	<div id="ForgottenPassword">
		<div id="ForgottenPassword_Wrong">
			<h3>错误信息!</h3>
			<ul>
			</ul>
		</div>
		<p>
			请输入正确的供应商编码和联系邮箱，我们会将新密码发送至您联系邮箱中，注意查收！谢谢~
		</p>
		<div id="ForgottenPassword_Form">
			<div>
				<label for="nickname">供应商编码</label> <input
					style="border: 1px solid #AAA;" type="text" id="nickname"
					name="nickname" />
			</div>
			<div>
				<label for="email">联系邮箱</label> <input
					style="border: 1px solid #AAA;" type="text" id="email" name="email" />
			</div>
			<div>
				<input type="submit" id="submit" value="提交" />
				<input class="forgetpwd-back" type="submit" id="back" value="返回" onclick="location.href='javascript:history.go(-1)'"/>
			</div>
		</div>   
	</div>
	<script>
		$(function() {
			$("#submit").click(
					function() {
						function isEmail(str) {
							var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
							return reg.test(str);
						}
						if ($("#nickname").val() == "") {
							$("#nickname").addClass("wronginput");
							$("#ForgottenPassword_Wrong").show().children("ul").html("").append("<li>请输入供应商编码</li>");
							return false;
						} else if ($("#email").val() == "") {
							$("#email").addClass("wronginput");
							$("#ForgottenPassword_Wrong").show().children("ul").html("").append("<li>请输入联系邮箱地址地址</li>");
							return false;
						} else if (!isEmail($("#email").val())) {
							$("#email").addClass("wronginput");
							$("#ForgottenPassword_Wrong").show().children("ul").html("").append("<li>联系邮箱地址格式不正确!</li>");
							return false;
						}
						$("body").mask("密码重置中....请稍后....");
						SupplierAction.resertPwd($("#nickname").val(), $("#email").val(), function(val) {
							if (val && val.result) {
								$("body").unmask();
								lhgdialog.tips(val.remark, 8);
							} else {
								$("body").unmask();
								lhgdialog.alert(val.remark);
							}
							$("#nickname").val("");
							$("#email").val("");
						});
					});
		});
	</script>
</body>
</html>
