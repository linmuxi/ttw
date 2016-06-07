<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>评价页面</title>
    <link href="../../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Comment.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../js/unslider.min.js" type="text/javascript"></script>
    <script src="../../build/template.js"></script>
</head>
<body>
    <script>
        document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["index.htm", "html/Design.html", "html/Station.htm", "html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html", "html/Project.html", "html/Member.htm"] });
    </script>
    <div class="main">
        <div class="score">
            <div class="bg">
                <div class="bgLeft">给本次服务评分</div>
                <div class="bgRight">拖动分值条，可为设计师本次的服务进行评分</div>
            </div>
            <div class="sCon">
                <ul>
                    <li>
                        <div class="ConTit">工作进度：</div>
                        <input type="range"/>
                    </li>
                    <li>
                        <div class="ConTit">服务态度：</div>
                        <input type="range" />
                    </li>
                    <li>
                        <div class="ConTit">完成质量：</div>
                        <input type="range" />
                    </li>
                </ul>
            </div>
        </div>
        <div class="send">
            <div class="bg">
                <div class="bgLeft">给本次服务发表评价</div>
            </div>
            <textarea placeholder="您可以对设计师本次的服务结出评价"></textarea>
        </div>
        <div class="btn">提交评论</div>
    </div>
    <script>
        var html = template('footer', {});
        document.body.innerHTML += html;
    </script>
</body>
</html>

<script src="../../js/jquery-1.9.1.min.js" type="text/javascript"></script>
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


