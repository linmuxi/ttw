<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
    <link href="../css/picture.css" rel="stylesheet" type="text/css" />
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
	<script src="../build/template.js" type="text/javascript"></script>
	
</head>
<body>
	<script>
	    document.body.innerHTML += template('header', { list: ['画册设计首页', '企业画册设计首页', '刊物设计', '在线客服'], Hlink: ['Picture.jsp', 'NewPro/P_Picture.jsp', 'NewPro/P_Picture.jsp'] });
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
		<div class="column wid1000 container">
			<div class="container middlecontent">
				<div class="contentone">
					<h1>
						企业画册设计</h1>
					<div class="ct-icon">
						<img src="../images/Design/grade/Picture1.png" />
					</div>
					<div class="ct-text">
						<p>
							文字说明文字说明文字说明文字说明文字说明
						</p>
						<p>
							文字说明文字说明文字说明文字说
						</p>
						<p>
							文字说明文字说明文字说明文字说文字说
						</p>
					</div>
					<a href="NewPro/P_Picture.jsp?t=企业画册设计首页"><div class="ct-more container">
					</div></a>
				</div>
				<div class="contenttwo">
					<h1>
						刊物设计</h1>
					<div class="ct-icon">
						<img src="../images/Design/grade/Picture2.png" />
					</div>
					<div class="ct-text">
						<p>
							文字说明文字说明文字说明文字说明文字说明
						</p>
						<p>
							文字说明文字说明文字说明文字说
						</p>
						<p>
							文字说明文字说明文字说明文字说文字说
						</p>
					</div>
					<a href="NewPro/P_Picture.jsp?t=刊物设计"><div class="ct-more container">
					</div></a>
				</div>
			</div>
		</div>
		<div class="case wid1000 container">
			<div class="c-title container">
				<div class="hr">
				</div>
				<div class="c-word">
					案例演示</div>
				<div class="hr">
				</div>
			</div>
			<div class="cass-content container">
				<div class="fl mar52">
					<img src="../images/Design/grade/pro/case_pho_1.png" />
					<img src="../images/Design/grade/pro/case_pho_6.png" />
					<img src="../images/Design/grade/pro/case_pho_2.png" />
				</div>
				<div class="fl">
					<img src="../images/Design/grade/pro/case_pho_3.png" />
					<img src="../images/Design/grade/pro/case_pho_4.png" />
					<img src="../images/Design/grade/pro/case_pho_5.png" />
				</div>
			</div>
		</div>
	</div>
	<script>
		var html = template('footer', {});
		document.body.innerHTML += html;
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


