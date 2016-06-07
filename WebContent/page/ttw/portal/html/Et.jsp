<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   @author Administrator
   @since  2015年8月23日 下午3:50:19
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>淘桃网-会员登录</title>
<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
<link href="../css/Et.css" rel="stylesheet" type="text/css" />
<script src="../js/unslider.min.js" type="text/javascript"></script>
<script src="../build/template.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	
<!-- 	<script>
		document.body.innerHTML += template('header',
				{
					list : [ '首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱',
							'项目案例', '会员中心' ],
					Hlink : [ "index.htm", "Design.html", "Station.htm",
							"Virtual.htm", "Domain.htm", "Mailbox.html",
							"Project.html", "Member.htm" ]
				});
	</script> -->
	<!--08-2中间-->
	<div id="EtAll" class="EtAll-">
		<div id="Et-conten" class="Et-conten-">
			<!--帐号-->
			<div id="Et-account" class="Et-account-">
				<div class="account-">帐号</div>
				<input id="account" class="account-ip-" />
			</div>
			<!--新密码-->
			<div id="Et-password" class="Et-password-">
				<div class="account-">密码</div>
				<input id="password" class="password-ip-" type="password" />
			</div>
			<!--验证码-->
			<!-- <div id="Et-idcode" class="Et-password-">
				<div id="idcode" class="account-">验证码</div>
				<input id="idcode-ip" class="idcode-ip-" />
				<div id="idcode-pic" class="idcode-pic"></div>
				<div id="idcode-change" class="idcode-change-">换下一张</div>
			</div> -->
			<!--确定按钮-->
			<div id="Et-true" class="Et-true-" style="cursor: pointer;">确定</div>
		</div>
	</div>
	<!--页脚-->
	<div style="position: absolute; bottom: 0; width: 100%;" id="footer"></div>
	<script>
		var html = template('footer', {});
		document.getElementById('footer').innerHTML += html;
	</script>
</body>
</html>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(".dropdownDefault,.dropdownContainer .downArrow1").click(
						function(event) {
							if ($(this).siblings(".dropdrown-menu").is(
									":hidden")) {
								$(".dropdrown-menu").hide();
								$(this).siblings(".dropdrown-menu").show(10);
							} else {
								$(this).siblings(".dropdrown-menu").hide(10);
							}

							event.stopPropagation();
							$(document).click(function() {
								$(".dropdrown-menu").hide();
							});
						});
				$(".dropdrown-menu li").click(
						function() {
							$(this).parent().siblings(".dropdownDefault").html(
									$(this).html());
							$(this).parent().hide();
						});
				
				$("#Et-true").click(function(){
					var account = $("#account").val();
					var password = $("#password").val();
					var actionUrl = getActionUrl();
					$.ajax({
						type : "post",
						url : webRoot + "/page/mylogin?type=1",
						success : function(data) {
							if (data) {
								var obj = $.parseJSON(data);
								if (obj.flag) {
									if(actionUrl != ''){
										window.location = webRoot + actionUrl;
									}else{
										window.location = webRoot + "/page/business/manage/member/memberHome";
									}
								} else {
									var msg = "";
									switch(obj.data.code){
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
									lhgdialog.alert(msg);
								}
							}
						},
						data : {
							account : account,
							password : password,
							type:1
						},
						error : function(data) {
							alert("登录异常，请联系管理员");
						}
					});
				});
				
				function getActionUrl(){
					if("${param.actionType}" == 'productDetail'){
						return "/page/portal/product?productId=${param.productId}";
					}
					return "";
				}
			});
</script>

