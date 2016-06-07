<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
    <style>html,body{ width:100%; height:100%;}</style>
    <jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
    
    <link href="../css/station.css" rel="stylesheet" type="text/css" />
	<script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="../js/unslider.min.js" type="text/javascript"></script>
	<script src="../build/template.js" type="text/javascript"></script>
    <script src="../js/Pop.js" type="text/javascript"></script>
	
</head>
<body>
	<%-- 头部    orc_lh  start --%>
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<%-- 头部    orc_lh  start --%>
	
	
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
		<div class="column container">
			<div class="columnone">
				<div class="container wid1000 zindex99">
					<div class="column-tit">
						<img src="../images/Station/Show.png" />
					</div>
					<div class="column-content">
						<img src="../images/Station/i_pro/pro1.png" /><img src="../images/Station/i_pro/pro2.png" /><img
							src="../images/Station/i_pro/pro3.png" /><img src="../images/Station/i_pro/pro4.png" />
					</div>
					<div class="column-more">
						<div class="column-more-img">
						</div>
					</div>
				</div>
				<div class="columnbg">
				</div>
			</div>
			<div class="columntwo">
				<div class="container wid1000 zindex99">
					<div class="column-tit">
						<img src="../images/Station/Trade.png" />
					</div>
					<div class="column-content">
						<img src="../images/Station/i_pro/pro1.png" /><img src="../images/Station/i_pro/pro2.png" /><img
							src="../images/Station/i_pro/pro3.png" /><img src="../images/Station/i_pro/pro4.png" />
					</div>
					<div class="column-more">
						<div class="column-more-img">
						</div>
					</div>
				</div>
				<div class="columnbg1">
				</div>
			</div>
			<div class="columnthree">
				<div class="container wid1000 zindex99">
					<div class="column-tit">
						<img src="../images/Station/Online.png" />
					</div>
					<div class="column-content">
						<img src="../images/Station/i_pro/pro1.png" /><img src="../images/Station/i_pro/pro2.png" /><img
							src="../images/Station/i_pro/pro3.png" /><img src="../images/Station/i_pro/pro4.png" />
					</div>
					<div class="column-more">
						<div class="column-more-img">
						</div>
					</div>
				</div>
				<div class="columnbg2">
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
			unslider.data('unslider')[fn]();

});

$(".leftsidebar2 a:last-child").click(function () {
    PopBody('CusSer');
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
 
