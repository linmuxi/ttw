﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <link href="../css/active.css" rel="stylesheet" type="text/css" />
    <script src="../build/template.js" type="text/javascript"></script>
</head>
<body>
        <!--页头-->
    <script>
        document.body.innerHTML += template('header', { list: ['虚拟主机', '在线客服'], Hlink: ['index.html'] });
    </script>
    <!--内容-->
    <div id="Content" class="Content-">
        <div id="Content-All" class="Content-All-">
            <!--中间头部-->
            <div id="Content-head" class="Content-head-">
                <div id="Content-head-logo" class="Content-head-logo-">
                </div>
                <div id="Content-head-navts" class="Content-head-navts-">
                    当前位置：</div>
                <div id="Content-head-navwz" class="Content-head-navwz-">
                    虚拟主机</div>
            </div>
            <!--中左-->
            <div id="Content-left" class="Content-left-">
                <div id="Content-leftAll" class="Content-leftAll">
                    <div class="Content-BlueFrame">
                <div class="title">
                    虚拟主机</div>
                <div class="List">
                    <ul>
                        <li>平面设计</li>
                        <li>建站营销</li>
                        <li>虚拟主机</li>
                        <li>域名注册</li>
                        <li>企业邮箱</li>
                        <li>项目案例</li>
                    </ul>
                </div>
            </div>
             <div style="width:100%; height:20px;"></div>
             <div class="Content-AccosFrame">
                <div class="List">
                    <ul>
                        <li>如何选择域名</li>
                        <li>如何注册域名</li>
                        <li>如何续费注册域名</li>
                        <li>如何解析注册域名</li>
                        <li>注册域名功能和含义</li>
                        <li>只注册域名要备案吗？</li>
                    </ul>
                </div>
            </div>
             <div style="width:100%; height:20px;"></div>
            <div class="Content-GrayFrame">
                <div class="title">
                    SGI注册域名优势</div>
                <div class="List">
                    <ul>
                        <li>支持多线路解析</li>
                        <li>提供WHOIS保护功能</li>
                        <li>拥有全部域名管理权</li>
                        <li>免费支持泛域名功能</li>
                        <li>任意50个子域名解析</li>
                        <li>任意50个别名指向</li>
                        <li>八组DNS解析服务器，提供DNS负载均衡</li>
                        <li>中文域名解析不需转码</li>
                    </ul>
                </div>
            </div>
                </div>
            </div>
            <!--中右-->
            <div id="Content-right" class="Content-right-">
                <div id="Content-right-banner" class="Content-right-banner-">
                    banner
                    <div id="Content-right-banner-change" class="Content-right-banner-change-">
                        <ul class="change-ul-">
                            <li id="change-circle-one" class="change-circle"></li>
                            <li id="change-circle-two" class="change-circle"></li>
                            <li id="change-circle-three" class="change-circle"></li>
                        </ul>
                    </div>
                </div>
                <div id="Content-right-product"style="margin-left:10px;font-family:微软雅黑; color:#31333e;">
                    <p style="text-align:center; color:#0096dc; font-size:18px; font-weight:bold; padding:10px 0;">企业如何选择域名-企业注册域名十大技巧</p>
                    <p style="text-align:center; padding-bottom:15px;">时间:2010-08-15 14:16</p>
                    <div style="background:#eeeeee; padding:25px 10px; font-size:12px; line-height:20px;"><span style="color:#0096dc">淘桃网</span>-基于云计算领先的互联网服务提供商,8年老品牌、业内领先。专业提供云主机、虚拟主机、域名注册、VPS主机、云服务器等，数十万企业用户的共同选择！云主机56元起，花10个月钱享14个月服务！网站10分钟拥有一个精美且利于SEO优化的企业网站，仅480元！</div>
                    <p style="padding:20px 0 30px 0">域名是企业互联网上的一个标志，就像商标一样，一个好的域名能帮助消费者轻易的找到你。如何选择域名成了很多企业进入互联网初期的难题，在这里和大家分享一下注册域名的十大技巧！</p>
                    <p>域名注册的原则：</p>
                    <p style="line-height:24px;">在注册域名的时候，首先要遵循两个基本原则。<br/>
1．用企业名称的汉语拼音作为域名<br/>
</p>
                </div>
            </div>
        </div>
    </div>
    <!--页脚-->
    <div style="bottom: 0; width: 100%;" id="footer">
    </div>
    <script>
        var html = template('footer', {});
        document.getElementById('footer').innerHTML += html;
    </script>
</body>
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

