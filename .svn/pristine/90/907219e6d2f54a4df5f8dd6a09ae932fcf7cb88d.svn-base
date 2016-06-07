<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
    <link href="../css/mcard.css" rel="stylesheet" type="text/css" />
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
	<script src="../build/template.js" type="text/javascript"></script>
	
</head>
<body>
	<script>
	    document.body.innerHTML += template('header', { list: ['名片首页', '尊贵类设计', '商务类设计', '标准类设计', '优惠区', '在线客服'], Hlink: ['../html/MCard.htm', '../../html/NewPro/P_MCard.htm', '../../html/NewPro/P_MCard.htm', '../../html/NewPro/P_MCard.htm'] });
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
		<div class="column container wid1000">
			<div class="contentone">
				<div class="c-title container">
					<div class="tit-chinese">
						尊贵类设计</div>
					<div class="tit-english">
						Honorable</div>
				</div>
				<div class="c-icon">
					<img src="../images/Design/grade/Bcard1.png" />
				</div>
				<div class="c-text">
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明尊贵型名片文字</p>
					<p>
						说明尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
				</div>
				<div class="c-btn">
					<div class="btn-btn container">
						详&nbsp&nbsp&nbsp细
					</div>
				</div>
			</div>
			<div class="contenttwo">
				<div class="c-title container">
					<div class="tit-chinese">
						商务类设计</div>
					<div class="tit-english">
						Honorable</div>
				</div>
				<div class="c-icon">
					<img src="../images/Design/grade/Bcard2.png" />
				</div>
				<div class="c-text">
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明尊贵型名片文字</p>
					<p>
						说明尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
				</div>
				<div class="c-btn">
					<div class="btn-btn container">
						详&nbsp&nbsp&nbsp细
					</div>
				</div>
			</div>
			<div class="contentthree">
				<div class="c-title container">
					<div class="tit-chinese">
						标准类设计</div>
					<div class="tit-english">
						Honorable</div>
				</div>
				<div class="c-icon">
					<img src="../images/Design/grade/Bcard3.png" />
				</div>
				<div class="c-text">
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明尊贵型名片文字</p>
					<p>
						说明尊贵型名片文字说明尊贵型名片文字说明</p>
					<p>
						尊贵型名片文字说明尊贵型名片文字说明</p>
				</div>
				<div class="c-btn">
					<div class="btn-btn container">
						详&nbsp&nbsp&nbsp细
					</div>
				</div>
			</div>
		</div>
		<div class="showwindow container wid1200">
			<div class="container wid1000">
				<div class="show-title">
					名片展示<span>Our Works</span>
				</div>
				<div class="show-content">
					<div class="showbg">
					<div></div>
					</div>
					<div class="showbg1">
					<div style="display:none;"></div>
					</div>
					<div class="showbg2">
					<div></div>
					</div>
					<div class="showbg3">
					<div></div>
					</div>
					<div class="showbg4">
					<div></div>
					</div>
					<div class="showbg5">
					<div></div>
					</div>
					<div class="showbg6">
					<div></div>
					</div>
					<div class="showbg7">
					<div></div>
					</div>

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

