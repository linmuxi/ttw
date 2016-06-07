<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author linyong
   @since  2015年6月17日 下午10:57:29
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ include file="/page/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘桃网后台登录</title>
<link href="${pageContext.request.contextPath}/page/login/css/index.css" rel="stylesheet" />
</head>
<body onkeydown="keyDownLogin(event)">
	<div class="bodyAll">
        <!--header-->
        <div class="headerAll">
            <img class="main_ttw_img" src="${pageContext.request.contextPath}/page/platform/ui/assets/img/logo.png" style="width:49px; height:39.5px;"/>
            <span style="margin-left: 3px;"><font color="white">淘桃网</font></span>
            <div class="header">
                <a href="http://www.taotaool.com" class="a1">首  页   |</a>
                <!-- <a href="#" class="a1">注册   |</a>
                <a href="#" class="a1">客户端下载   |</a>
                <a href="#" class="a1">联系客服   |</a> -->
                <a href="${pageContext.request.contextPath}/page/ttw/portal/forgetpwd.jsp" class="a1">忘记密码   </a>
            </div>           
        </div>
        <!--middleSGI  让您的生活更简单-->
        <div class="middleAll">
            <img class="main_beijing_img" src="images/beijing.png" />
            <p class="middle_p">SGI  让您的生活更简单</p>
            <div class="middle_dl">
                <img class="main_dl_img" src="images/dl.png" />
                <div class="middle_xdl">
                    <img class="main_yh_img" src="images/yh.png" />
                    <input type="text" class="middle_sr" id="account" />
                </div>
                <div class="middle_xdl">
                    <img class="main_mima_img" src="images/mina.png" />
                    <input type="password" class="middle_sr" id="password"/>
                </div>
                <!-- <a href="#" class="middle_wjmm">忘记密码</a> -->
                <input type="hidden" id="ttw_redirect" value="${param.ttw_redirect}" />
                <img class="middle_xdann" src="images/ddll.png" id="btn_login" />
            </div>
        </div>
        <!--bottom-->
        <div class="bottomAll">
            <div class="bottom">
                <a href="#" class="a2">©2015 SGI</a>
                <a href="#" class="a2">服务协议   |</a>
                <a href="#" class="a2">权利声明   |</a>
                <a href="#" class="a2">帮助中心   |</a>
                <a href="#" class="a2">关于我们   |</a>
                <a href="#" class="a2">联系我们</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	(function($) {
		function login() {
			$("body").mask("登录中...");
			var account = $("#account").val();
			var password = $("#password").val();
			$.ajax({
				type : "post",
				url : "${ctx}/page/mylogin",
				success : function(data) {
					if (data) {
						var obj = $.parseJSON(data);
						if (obj.flag) {
							var redirect = $("#ttw_redirect").val();
							if(redirect != null && redirect != ''){
								window.location = redirect;
							}else{
								window.location = "${ctx}/page/manage/index";
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
							}
							if(msg != ''){ 
								lhgdialog.alert(msg);
							}
							$("body").unmask();
						}
					};
				},
				data : {
					account : account,
					password : password
				},
				error : function(data) {
					lhgdialog.alert("登录异常，请联系管理员");
					$("body").unmask();
				}
			});
		}

		$("#btn_login").click(login);
		
		$("#account").focus();
	})(jQuery);

	function keyDownLogin(event) {
		if (event.keyCode == 13) {
			event.returnValue = false;
			event.cancel = true;
			$("#btn_login").click();
		}
	}
    </script>
</body>
</html>