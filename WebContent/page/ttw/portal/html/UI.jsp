<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
    <link href="../css/ui.css" rel="stylesheet" type="text/css" />
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
	<script src="../build/template.js" type="text/javascript"></script>
</head>
<body>
    <script>
        document.body.innerHTML += template('header', { list: ['UI设计首页', '网站UI', '手机UI', '在线客服'], Hlink: ['UI.htm', 'NewPro/P_UI.htm', 'NewPro/P_UI.htm'] });
    </script>
	<div class="main">
		<div class="banner-bar container">
			<div class="banner">
				<ul>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<a href="#" class="unslider-arrow prev"></a><a href="#" class="unslider-arrow next">
			</a>
		</div>
		<div class="column">
			<div class="container wid1000">
				<div class="contentone">
					<img src="../images/Design/grade/UI1.png" />
					<h1>网站UI</h1>
					<p class="dp">网站UI文字网站UI文字网站UI文字</p>
					<p>网站UI文字网站UI文字</p>
					<p>网站UI文字网站UI文字网站UI文字网站UI文字</p>
					<p>网站UI文字网站</p>
				</div>
				<div class="contenttwo">
									<img src="../images/Design/grade/UI2.png" />
					<h1>手机UI</h1>
					<p class="dp">手机UI文字手机UI文字手机UI文字</p>
					<p>手机UI文字手机UI文字</p>
					<p>手机UI文字手机UI文字手机UI文字手机UI文字</p>
					<p>手机UI文字手机</p>
				</div>
			</div>
		</div>
		<div class="hr container "></div>
		<div class="show">
		<div class=" container wid1000">
		<h1>UI展示</h1>
		<h2>UI SHOW</h2>
		<div class="showwindows container">
			<img class="uimg1"src="../images/Design/grade/pro/case_ui_1.png" />
			<img class="uimg2"src="../images/Design/grade/pro/case_ui_2.png" />
			<img class="uimg3"src="../images/Design/grade/pro/case_ui_3.png" />
			<img class="uimg4"src="../images/Design/grade/pro/case_ui_4.png" />
			<img class="uimg5"src="../images/Design/grade/pro/case_ui_5.png" />
			<img class="uimg6"src="../images/Design/grade/pro/case_ui_6.png" />
			<img class="uimg7"src="../images/Design/grade/pro/case_ui_7.png" />
			<img class="uimg8"src="../images/Design/grade/pro/case_ui_9.png" />
			<img class="uimg9"src="../images/Design/grade/pro/case_ui_10.png" />
		</div>
		</div>
		</div>
	</div>
	    <script>
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

