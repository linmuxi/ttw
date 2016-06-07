<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link href="../css/08-1.css" rel="stylesheet" type="text/css" />
	<script src="../build/template.js" type="text/javascript"></script>
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
</head>
<body>
	<script>
	    document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["../index.htm", "Design.html", "Station.htm", "Virtual.htm", "Domain.htm", "Mailbox.html", "Project.html", "Member.htm"] });
    </script>
	<div class="main">
		<div class="banner-bar container">
			<div class="banner">
				<ul>
					<li>
						<img src="../images/Member/banner01.png" />
					</li>
					<li>
						<img src="../images/Member/banner01.png" />
					</li>
					<li>
						<img src="../images/Member/banner01.png" />
					</li>
				</ul>
			</div>
			<a href="#" class="unslider-arrow prev"></a><a href="#" class="unslider-arrow next">
			</a>
			<div class="windows">
				<div class="windowsbg">
				</div>
				<div class="usernum">
					<div class="userimg fl">
					</div>
					<div class="ipt fl">
						<input type="text" placeholder="835088658@qq.com" />
					</div>
				</div>
				<div class="passwrods">
					<div class="passwordimg fl">
					</div>
					<div class="ipt fl mar1">
						<input type="password" placeholder="********" />
					</div>
				</div>
				<div class="fogpasswords">
				<u>忘记密码</u>
				</div>
				<div class="signin">
				<div class="fl">登录</div>
				<div class="fl">注册</div>
				</div>
			</div>
		</div>
	</div>
	<!--页脚-->
    <div style="position: absolute; bottom: 0; width: 100%;" id="footer"></div>
    <script>
    	var html = template('footer', {});
    	document.getElementById('footer').innerHTML += html;
    	$('.banner').unslider({
    		speed: 500,
    		delay: 3000,
    		complete: function () { },
    		keys: true,
    		dots: true,
    		fluid: false
    	});
    	var unslider = $('.banner').unslider();

    	$('.unslider-arrow').click(function () {
    		var fn = this.className.split(' ')[1];

    		//  Either do unslider.data('unslider').next() or .prev() depending on the className
    		unslider.data('unslider')[fn]();
    	});
    </script>
</body>
</html>


<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
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

