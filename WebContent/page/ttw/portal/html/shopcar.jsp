<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>会员中心-我的购物车</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
 	 <link href="${ctx}/page/ttw/portal/css/index.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/member.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/Vip.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/build/template.js"></script>

    <link href="${ctx}/page/ttw/portal/css/jquery.spinner.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/jquery.spinner.js" type="text/javascript"></script>
</head>
<body>
    <script type="text/javascript">
        document.body.innerHTML += template('header', { list: ['首页', '平面设计', '建站营销', '虚拟主机', '域名注册', '企业邮箱', '项目案例', '会员中心'], Hlink: ["index.htm", "html/Design.html", "html/Station.htm", "html/Virtual.htm", "html/Domain.htm", "html/Mailbox.html", "html/Project.html", "html/Member.htm"] });
    </script>
    <div class="wrap">
        <div class="container wid1000">
            <div class="fl sidebarleft">
                <ul>
                    <li class=" active"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberHome">会员中心</a></li>
						<li>账户中心</li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/memberDetail_portal">基本信息</a></li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/changePasswordView">密码修改</a></li>
						<li class="child "><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/gomemberInfoUpdate_portal">信息修改</a></li>
						<li class="child">账户注销</li>
						<li>订单管理</li>
						<!-- <li class="child"><a class="indexa" href="/shopcar.jsp">我的购物车</a></li> -->
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/shopcar">我的购物车</a></li>
						<li class="childActive"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order">订单信息</a></li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order?m=nopay">待付款订单</a></li>
						<li class="child"><a class="indexa" href="${pageContext.request.contextPath}/page/business/manage/member/order?m=accept">未验收订单</a></li>
						<li>财务管理</li>
						<li class="childActive"><a class="indexa" href="fapiao.jsp">发票管理</a></li>
						<li class="childActive "><a class="indexa" href="daijin.jsp">代金卷</a></li>
                </ul>
            </div>
            <div class="mar10">
                <div class="date-before">
                    上次登陆时间：2015-4-1 <span>13:00:47</span></div>
                <div class="user-info">
                    <div class="fl uf-control">
                        <div class="uo-tit">
                            我的购物车</div>
                    </div>
                    <div class="fr uf-control">
                        <a href="#">问题反馈</a> <span>|</span> <a href="#">操作说明</a>
                    </div>
                </div>
                <div class="user-order">
                    <div class="shopcar-content">
                        <ul>
                            <li class="uoc-tit">
                                <div class="backc">
                                    <div class="shopcar-onclick">
                                        <div style="margin-left: 30px">选择</div>
                                    </div>
                                    <div class="shopcar-name">商品名称</div>
                                    <div class="shopcar-danjia">单价</div>
                                    <div class="shopcar-quantity">数量</div>
                                    <div class="shopcar-moeny">小计</div>
                                    <div class="shopcar-state">操作</div>
                                </div>
                            </li>
                            <li class="uoc-tit">
                                <div class="shopcar-onclick">
                                    <div style="margin-left: 30px">
                                        <input style="margin-top: 15px;" type="checkbox" /></div>
                                </div>
                                <div class="shopcar-name"></div>
                                <div class="shopcar-danjia"></div>
                                <div class="shopcar-quantity">
                                    <input type="text" class="shopcar-text1" value="1" />
                                    <div class="shopcar-textB" onclick="selectdiv(this,1)"></div>
                                    <div class="shopcar-textB1" onclick="selectdiv(this,2)"></div>
                                </div>
                                <div class="shopcar-moeny">
                                    <div class="shopcar-text"></div>
                                </div>
                                <div class="shopcar-state colora">【删除】</div>
                            </li>
                        </ul>
                    </div>
                    <div class="shopcar-f1">删除选中商品</div>
                    <div class="shopcar-bottom">
                        <div class="shopcar-bottom-1 fright">
                            <div class="shopcar-f2 fleft">共计：</div>
                            <div class="shopcar-f3 fleft">￥0</div>
                            <input type="button" class="shopcar-button fleft" value="结算"></div>
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
    <script>
        function selectdiv(obj, zt) {
            if (zt == 1) {
                var inputshu = parseInt($(obj).prev().val());
            } else {
            var inputshu = $($(obj).prev()).prev().val();
            }
            if (zt == 1) { $(obj).prev().val(inputshu + 1); } 
            else {
                $($(obj).prev()).prev().val(inputshu-1)
            }
                             
        }
                                </script>
</body>
</html>
