<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
	<link href="${ctx}/page/ttw/portal/css/08-3.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/page/ttw/portal/build/template.js" type="text/javascript"></script>
	

	
</head>
<body>
	<script>
	    document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["../index.htm", "Design.html", "Station.htm", "Virtual.htm", "Domain.htm", "Mailbox.html", "Project.html", "Member.htm"] });
	    </script>
	<div class="wrap">
		<div class="container wid1000">
			<div class="fl sidebarleft">
				<ul>
					<li class="active">快速通道</li>
					<li class="selected"><span class="xg"></span>修改密码 </li>
					<li><span class="jy"></span>交易记录<i class="gt">3</i></li>
				</ul>
			</div>
			<div class="fr mar10">
				<div class="date-before">
					<div class="fl data-word">
						你好!欧阳</div>
					<div class="fr">
						上次登陆时间：2015-4-1 <span>13:00:47</span></div>
				</div>
				<div class="updatepasswore">
					<form action="${pageContext.request.contextPath}/page/business/manage/member/changePassword">
					<div class="ipt">
						请输入旧密码<input type="password" id = "pwd" name = "pwd"/><div id = "oldPwd"></div></div>
					<div class="ipt">
						请输入新密码<input type="password" id = "newPwd" name = "newPwd"/></div>
					<div class="ipt">
						再输入新密码<input type="password" id = "surePwd" name = "surePwd"/><div id = "surePwdDiv"></div></div>
						<div class="ibtn" id = "submitPwd" >确定</div>
						<!-- <input  type="button" id = "submitPwd" class="ibtn" value="确定"/> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		var html = template('footer', {});
		document.body.innerHTML += html;
	</script>
</body>
</html>



<script src="${ctx}/page/ttw/portal/js/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script type="text/javascript">

                $(document).ready(function () {


                    $(".dropdownDefault,.dropdownContainer .downArrow1").click(function (event) {
                        if ($(this).siblings(".dropdrown-menu").is(":hidden")) {
                            $(".dropdrown-menu").hide();
                            $(this).siblings(".dropdrown-menu").show(10);
                        } else {
                            $(this).siblings(".dropdrown-menu").hide(10);
                        }


                        event.stopPropagation();
                        $(document).click(function () {
                            $(".dropdrown-menu").hide();
                        });
                    });
                    $(".dropdrown-menu li").click(function () {
                        $(this).parent().siblings(".dropdownDefault").html($(this).html());
                        $(this).parent().hide();
                    });
                }); 
    </script>

<script type="text/javascript">

$('#pwd').blur(function(){
	var pwd = $('#pwd').val();
	if(pwd == ""){
		$('#oldPwd').text("原始密码不能为空！").css({'color':'red'});
	}
});

$('#surePwd').blur(function(){
	var newPwd = $('#newPwd').val();
	var surePwd = $('#surePwd').val();
	if(newPwd != surePwd){
		$('#surePwdDiv').text("两次密码输入的不一致，请重新输入！").css({'color':'red'});
	}
});



$('#submitPwd').click(function(){
	var pwd = $('#pwd').val();
	var newPwd = $('#newPwd').val();
	var surePwd = $('#surePwd').val();
	if(pwd != "" && newPwd == surePwd ){
		$.post("${pageContext.request.contextPath}/page/business/manage/member/changePassword", { "pwd": pwd, "surePwd": surePwd},
				function (data, textStatus){
					if(data.result == true){
						alert(data.message);
					}else{
						alert(data.message);
					}
				}, "json");
	}
});
</script>