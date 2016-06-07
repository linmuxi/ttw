<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员中心-发票管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <link href="../css/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/member.css" rel="stylesheet" type="text/css" />
    <link href="../css/Vip.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../js/unslider.min.js" type="text/javascript"></script>
    <script src="../build/template.js"></script>
</head>
<body>
    <script>
        document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["index.htm", "html/Design.html", "html/Station.htm", "html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html", "html/Project.html", "html/Member.htm"] });
    </script>
    <div class="wrap">
        <div class="container wid1000">
            <div class="fl sidebarleft">
                <ul>
                    <li><a  class="indexa" href="Member.htm">会员中心</a></li>
                    <li>账户中心 </li>
                    <li class="child"><a  class="indexa" href="jiben.html">基本信息</a></li>
                    <li class="child">密码修改</li>
                    <li class="child"><a  class="indexa" href="xinxi.html">信息修改</a></li>
                    <li class="child">账户注销</li>
                    <li>订单管理</li>
                    <li class="child"><a  class="indexa" href="shopcar.html">我的购物车</a></li>
                    <li class="childActive"><a class="indexa" href="order.html">订单信息</a></li>
                    <li class="child"><a  class="indexa" href="nopay.html">待付款订单</a></li>
                    <li class="child"><a  class="indexa" href="noyanshou.html">未验收订单</a></li>
                    <li>财务管理</li>
                    <li class="childActive active"><a  class="indexa" href="fapiao.html">发票管理</a></li>
                    <li class="childActive "><a  class="indexa" href="daijin.html">代金卷</a></li>
                </ul>
            </div>
            <div class="mar10">
                <div class="date-before">
                    上次登陆时间：2015-4-1 <span>13:00:47</span></div>
                <div class="user-info">
                    <div class="fl uf-control">
                        <div class="uo-tit">
                            发票管理</div>
                    </div>
                    <div class="fr uf-control">
                        <a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
                    </div>
                </div>
                <div class="user-order">
                    <div class="uo-content">
                        <ul>
                            <li class="uoc-tit">
                                <div class="backc">
                                    <div class="nopay-num">
                                        销售单号</div>
                                    <div class="nopay-name">
                                        商品名称</div>
                                    <div class="nopay-xdate">
                                        下单时间</div>
                                    <div class="nopay-moeny">
                                        总金额</div>
                                    <div class="nopay-state">
                                        发票类型</div>
                                </div>
                            </li>
                            <li class="uoc-tit">
                                <div class="nopay-num">
                                    5676576576</div>
                                <div class="nopay-name">
                                    周周企业名片设计-版式1</div>
                                <div class="nopay-xdate">
                                    2014-5-10</div>
                                <div class="nopay-moeny">
                                    500元</div>
                                <div class="nopay-state colora">
                                    普通发票</div>
                            </li>
                                                        <li class="uoc-tit">
                                <div class="nopay-num">
                                    5676576576</div>
                                <div class="nopay-name">
                                    周周企业名片设计-版式1</div>
                                <div class="nopay-xdate">
                                    2014-5-10</div>
                                <div class="nopay-moeny">
                                    500元</div>
                                <div class="nopay-state colora">
                                    普通发票</div>
                            </li>
                                 <li class="uoc-tit">
                                <div class="nopay-num">
                                    5676576576</div>
                                <div class="nopay-name">
                                    周周企业名片设计-版式1</div>
                                <div class="nopay-xdate">
                                    2014-5-10</div>
                                <div class="nopay-moeny">
                                    500元</div>
                                <div class="nopay-state colora">
                                    普通发票</div>
                            </li>
                                                        <li class="uoc-tit">
                                <div class="nopay-num">
                                    5676576576</div>
                                <div class="nopay-name">
                                    周周企业名片设计-版式1</div>
                                <div class="nopay-xdate">
                                    2014-5-10</div>
                                <div class="nopay-moeny">
                                    500元</div>
                                <div class="nopay-state colora">
                                    普通发票</div>
                            </li>
                                                        <li class="uoc-tit">
                                <div class="nopay-num">
                                    5676576576</div>
                                <div class="nopay-name">
                                    周周企业名片设计-版式1</div>
                                <div class="nopay-xdate">
                                    2014-5-10</div>
                                <div class="nopay-moeny">
                                    500元</div>
                                <div class="nopay-state colora">
                                    普通发票</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="flip">
                <div class="fr">
                    <div class="f-word">
                        1/20</div>
                    <div class="f-xl">
                        <div class="x-ng">
                            01</div>
                        <div class="x-xl">
                            <div class="xl-img">
                            </div>
                        </div>
                    </div>
                    <div class="f-jt">
                        <a class="f-pre" href="#">
                            <div class="pre-img">
                            </div>
                        </a><a class="f-next" href="#">
                            <div class="next-img">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <div style="bottom: 0; width: 100%;" id="footer">
    </div>
    <script>
        var html = template('footer', {});
        document.getElementById('footer').innerHTML += html;
    </script>
</body>
</html>
