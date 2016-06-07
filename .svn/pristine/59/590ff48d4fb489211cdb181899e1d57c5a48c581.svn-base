<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>平面设计</title>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
    <link href="../css/design.css" rel="stylesheet" type="text/css" />
    <script src="../js/unslider.min.js" type="text/javascript"></script>
    <script src="../build/template.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
    <!-- <script>
        document.body.innerHTML += template('header', { list: ['平面设计', '海报设计', '展架设计', '易拉宝设计', '包装设计', '画册设计', 'DM单设计', '卡片设计', '日历设计', 'VI设计', 'UI设计'], 
        	Hlink: ['Design.jsp', 'NewPro/Product.jsp', 'NewPro/Product.jsp', 'NewPro/Product.jsp', 'NewPro/Product.jsp', 'Picture.jsp', 'DM.jsp', 'Card.jsp', 'NewPro/Product.jsp', 'NewPro/Product.jsp', 'UI.jsp'] });
    </script> -->
    <div class="main">
        <script>
            document.querySelectorAll('.main')[0].innerHTML += template('banner', {});
        </script>
        <div class="container">
            <div class="large_run container wid1000">
                <img src="../images/Design/large_run.png" usemap="#planetmap" alt="大图" border="0" width="949" height="767" />
                <map name="planetmap" id="planetmap"  border="0" >
                   
                    <area shape="circle" coords="465,80,50" title="圆" href='NewPro/Product.jsp?t=海报设计' target="_blank"
                        alt="圆形"onFocus="this.blur()"  />
                   <area shape="circle" coords="273,135,50" title="圆" href="UI.jsp?t=UI设计" target="_blank"
                        alt="圆形"onFocus="this.blur()" />
                        <area shape="circle" coords="170,292,50" title="圆" href="NewPro/Product.jsp?=VI设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                         <area shape="circle" coords="175,473,50" title="圆" href="NewPro/Product.jsp?=日历设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                        <area shape="circle" coords="290,623,50" title="圆" href="Card.jsp?t=卡片设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                        <area shape="circle" coords="470,671,50" title="圆" href="DM.jsp?t=DM单设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                         <area shape="circle" coords="650,627,50" title="圆" href="Picture.jsp?t=画册设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                        <area shape="circle" coords="770,471,50" title="圆" href="NewPro/Product.jsp?t=包装设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                         <area shape="circle" coords="773,290,50" title="圆" href="NewPro/Product.jsp?t=易拉宝设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>
                          <area shape="circle" coords="675,132,50" title="圆" href="NewPro/Product.jsp?t=展架设计" target="_blank"
                        alt="圆形" onFocus="this.blur()"/>

                </map>
            </div>
            <div class="container wid1200">
                <div class="des_bg ">
                    <p class="des_p">
                        案例欣赏</p>
                    <div style="width: 250px; padding-bottom: 30px;" class="container">
                        <hr class="des_hr" />
                        <i class="des_love"></i>
                        <hr class="des_hr" />
                    </div>
                    <div class="container wid1000 des_img" style="clear: both;">
                        <img src="../images/Design/i_pro/des_1.png" />
                        <img src="../images/Design/i_pro/des_2.png" />
                        <img src="../images/Design/i_pro/des_3.png" />
                        <img src="../images/Design/i_pro/des_4.png" />
                        <img src="../images/Design/i_pro/des_5.png" />
                        <img src="../images/Design/i_pro/des_6.png" />
                        <img src="../images/Design/i_pro/des_7.png" />
                        <img src="../images/Design/i_pro/des_8.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var html = template('footer', {});
        document.body.innerHTML += html;
    </script>
    <script>
        $('.h-menu ul li').each(function () {

            $(this).addClass("des_nav");
        });
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

