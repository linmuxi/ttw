<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>会员注册</title>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
	<link href="${ctx}/page/ttw/portal/css/Ef.css" rel="stylesheet" type="text/css" />
	<script src="${ctx}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
	<script src="${ctx}/page/ttw/portal/build/template.js" type="text/javascript"></script>
	<script src="${ctx}/page/ttw/portal/js/Pop.js" type="text/javascript"></script>
</head>
<body>
	
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<!-- <script>
		document.body.innerHTML += template('header', {
			list : [ '首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例',
					'会员中心' ],
			Hlink : [ "../index.htm", "Design.html", "Station.htm",
					"Virtual.htm", "Domain.htm", "Mailbox.html",
					"Project.html", "Member.htm" ]
		});
	</script> -->
	<!--08-4中间-->
	<div id="EtAll" class="EtAll-">
		<div id="acc-nav" class="acc-nav-">
			<div id="acc-zcyh" class="acc-zcyh-">
				<i id="ad">注册用户:</i>
			</div>
			<div id="Div1" class="acc-zcyh-">
				<i class="acc-zcyh-active">1.填写资料</i>
			</div>
			<div id="Div2" class="acc-zcyh-">
				<i>2.填写密码</i>
			</div>
			<div id="Div3" class="acc-zcyh-">
				<i>3.完成</i>
			</div>
		</div>
		<form id="regForm">
		<div id="Ef-conten" class="Ef-conten-" style="display: block;">
			<div id="Ef-name" class="Ef-password-">
				<div class="account-">姓名</div>
				<input id="name" name="name" type="text" class="password-ip-" />
			</div>
			<div id="Ef-account" class="Ef-password-">
				<div class="account-">账号</div>
				<input id="account" name="account" type="text" class="account-ip-">
			</div>
			<!-- <div id="Ef-password" class="Ef-password-">
				<div id="password" class="account-">密码</div>
				<input id="password" class="password-ip-">
			</div> -->
			<div id="Div4" class="Ef-password-">
				<div id="Div5" class="account-">出生日期</div>
				<input id="birth" name="birth" type="text" class="Wdate password-ip-" onClick="WdatePicker()"> 				
			</div>
			<div id="Div6" class="Ef-password-">
				<div id="Div7" class="account-">手机号码</div>
				<input id="mobile" name="mobile" type="text" class="password-ip-">
			</div>
			<div id="Div8" class="Ef-password-">
				<div id="Div9" class="account-">性别</div>
				<input type="radio" name="sex" id="sex_1" value="1"
					style="margin-left: 10px;" /> 男 <input type="radio" name="sex"
					id="sex_0" value="0" /> 女
			</div>
			<div id="Div10" class="Ef-password-">
				<div id="Div11" class="account-">邮箱</div>
				<input id="email" name="email" type="text" class="password-ip-">
			</div>
			<div id="Ef-idcode" class="Ef-password-">
				<div class="account-">联系地址</div>
				<input id="address" name="address" class="idcode-ip-">
			</div>
			<div id="Div12" class="Ef-xy-">
				<input type="checkbox" class="checkbox-" id="protocol_agree_id">
					<div id="ty" class="ty-">同意</div>
					<div id="ttwxy" class="ttwxy-">
						<a href="#" class="ttwxy-a" onclick="PopBody('Agreement');">
							&lt;淘桃网协议&gt; </a>
					</div>
			</div>
			<div id="Ef-true" class="Ef-true-">下一步</div>
		</div>
		<div id="Div14" class="Ef-conten-" style="display: none;">
			<!--注册导航-->
			<div id="Div20" class="Ef-password-">
				<div id="Div21" class="account-">请输入密码</div>
				<input id="pwd" type="password" name="pwd" class="password-ip-">
			</div>
			<div id="Div22" class="Ef-password-">
				<div id="Div23" class="account-">再次输入密码</div>
				<input id="surePwd" type="password" name="surePwd" class="password-ip-">
			</div>
			<!-- <div id="Div24" class="Ef-password-">
				<div id="Div25" class="account-">验证码</div>
				<input id="Text7" class="password-ip-" style="width: 88px;">
					<div id="idcode-pic" class="idcode-pic"></div>
					<div id="idcode-change" class="idcode-change-">换下一张</div>
			</div> -->
			<div id="register_btn_id" class="Ef-true-">注册</div>
		</div>
		</form>
		<div id="Div31" class="Ef-conten-" style="display: none;">
			<!--注册导航-->
			<div style="text-align: center; padding-top: 88px;">
				<img src="../images/Login/face_icon.png"
					style="position: absolute; margin-top: -4px;"><span
					class="Ef-conten-p">恭喜您注册成功！！</span>
			</div>
		</div>
	</div>
	<!--页脚-->
	<div class="Efa" style="width: 100%;" id="footer"></div>
	<script>
		var html = template('footer', {});
		document.getElementById('footer').innerHTML += html;
	</script>
	<script>
		$('.Ef-conten-').hide();
		$('#Div1 i').addClass("acc-zcyh-active");
		$('.Ef-conten-:first').show();

		$('#Ef-true').click(function() {
			var rst = valideBasic();
			if(isNotEmpty(rst)){
				lhgdialog.alert(rst);
				return false;
			}
			rst = validateAccount($("#account").val());
			if(isNotEmpty(rst)){
				lhgdialog.alert(rst);
				return false;
			}
			
			$('#Div1 i').removeClass("acc-zcyh-active");
			$('#Div2 i').addClass("acc-zcyh-active");
			$('.Ef-conten-').hide();
			$('#Div14').show();
		});
		
		function finish(){
			$('#Div2 i').removeClass("acc-zcyh-active");
			$('#Div3 i').addClass("acc-zcyh-aflish");
			$('.Ef-conten-').hide();
			$('#Div31').show();
		};
		
		$("#register_btn_id").click(function(){
			var rst = validePassword();
			if(isNotEmpty(rst)){
				lhgdialog.alert(rst);
				return false;
			}

			var regForm = $("#regForm").serializeObject();
			regForm.birth = parseDate(regForm.birth);
			MemberAction.register(regForm,function(data){
				if(data.result){
					finish();					
				}else{
					lhgdialog.alert("注册失败,请联系管理员");
				}
			});
		});
		
		$("#account").bind("blur",function(){
			var rst = validateAccount($("#account").val());
			if(isNotEmpty(rst)){
				lhgdialog.alert(rst);
			}
		})
		
		var a = $(window).height();
		if (a < 762) {
			$(".Efa").css({
				"position" : "relative",
				"width" : "100%"
			});
		}
		
		function protocolCallback(){
			$("#protocol_agree_id").attr("checked",true);
		}
		
		//验证基本信息
		function valideBasic(){
			var rst = "";
			var name = $("#name").val();
			var account = $("#account").val();
			var birth = $("#birth").val();
			var mobile = $("#mobile").val();
			var sex = $("input:radio[name='sex']:checked").val();
			var email= $("#email").val();
			var address = $("#address").val();
			var protocol_agree_id = $("#protocol_agree_id").prop("checked");
			if(!isNotEmpty(name)){
				rst += "姓名不能为空<br/>";
			}if(!isNotEmpty(account)){
				rst += "账户不能为空<br/>";
			}if(!isNotEmpty(birth)){
				rst += "出生日期不能为空<br/>";
			}if(!isNotEmpty(mobile)){
				rst += "手机号码不能为空<br/>";
			}
			if(!(/^(\+86)(1((3\d)|(5(0|1|3|5|6|7|8|9))|(8(0|5|6|7|8|9)))\d{8})|((0?\d{2,3})?\d{8})$/.test(mobile))){
				rst += "手机号格式有误<br/>";
			}
			if(!isNotEmpty(sex)){
				rst += "性别不能为空<br/>";
			}if(!isNotEmpty(email)){
				rst += "邮箱不能为空<br/>";
			}
			if(!(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email))){
				rst += "邮箱格式不合法<br/>";
			}
			if(!isNotEmpty(address)){
				rst += "联系地址不能为空<br/>";
			}if(!protocol_agree_id){
				rst += "请勾选同意淘桃网协议<br/>";
			}
			return rst;
		}

		//验证密码
		function validePassword(){
			var rst = "";
			var pwd = $("#pwd").val();
			var surePwd = $("#surePwd").val();
			if(!isNotEmpty(pwd)){
				rst += "密码不能为空<br/>";
			}if(!isNotEmpty(surePwd)){
				rst += "确认密码不能为空<br/>";
			}else if(pwd != surePwd){
				rst += "密码不一致<br/>";
			}
			return rst;
		}
		
		function validateAccount(account){
			var rst = "";
			$.ajax({
				type: "POST",
				async:false,
				url:webRoot+"/page/admin/user/getAccountExists",
				data: "account="+account,
				success: function(msg){
					if(msg && !msg.valid){
						rst = "该账户已经存在";
					}
				}
			});
			return rst;
		}
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
			});
</script>

<script src="${ctx}/dwr/interface/MemberAction.js"></script>