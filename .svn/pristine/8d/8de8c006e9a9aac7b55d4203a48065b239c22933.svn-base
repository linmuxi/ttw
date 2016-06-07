<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
    <link href="../css/card.css" rel="stylesheet" type="text/css" />
	<script src="../build/template.js" type="text/javascript"></script>
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
</head>
<body>
	<script>
	    document.body.innerHTML += template('header', { list: ['卡片设计首页', '名片设计', '工牌设计', '会员卡设计', '在线客服'], Hlink: ['../html/Card.jsp', '../html/MCard.jsp', '../../html/NewPro/P_Card.jsp', '../../html/NewPro/P_Card.jsp'] });
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
			<div class="container wid1000 columnContent">
				<div class="contentone">
					<img src="../images/Design/grade/card1.png" />
					<h1 class="h1one">
						名片设计</h1>
					<p class="pd">
						文字文字文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字</p>
					<div class="column-more">
						<a href="MCard.jsp?t=名片设计"><div class="more-img">
						</div></a>
					</div>
				</div>
				<div class="contenttwo">
					<img src="../images/Design/grade/card2.png" />
					<h1 class="h1two">
						工牌设计</h1>
					<p class="pd">
						文字文字文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字</p>
					<div class="column-more">
						<a href="NewPro/P_Card.jsp?t=工牌设计"><div class="more-img">
						</div></a>
					</div>
				</div>
				<div class="contentthree">
					<img src="../images/Design/grade/card3.png" />
					<h1 class="h1thtee">
						会员卡设计</h1>
					<p class="pd">
						文字文字文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字文字文字文字文字文字</p>
					<p>
						文字文字文字文字文字</p>
					<div class="column-more">
						<a href="NewPro/P_Card.jsp?t=会员卡设计"><div class="more-img">
						</div></a>
					</div>
				</div>
			</div>
		</div>
		<div class="case">
			<div class="container wid1000 caseContent">
				<div class="case-tit">
					卡片设计欣赏</div>
				<div class="case-img" style="margin: 0 auto;">
					<img src="../images/Design/grade/pro/case_c_1.png" style="float:left" />
					<img src="../images/Design/grade/pro/case_c_4.png" style="float:right" />
					<img src="../images/Design/grade/pro/case_c_2.png"/>
					<img src="../images/Design/grade/pro/case_c_3.png" style="margin-left:63px;"/>
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

