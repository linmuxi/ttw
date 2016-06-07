<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的订单</title>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
    <link href="${ctx}/page/ttw/portal/css/index.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/page/ttw/portal/css/Submit.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
    <script src="${ctx}/page/ttw/portal/build/template.js"></script>
</head>
<body>
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
    <div class="Opacity" id="op"></div>
    <div class="main">
        <div class="Pos">
            <div class="PosIcon"></div>
            <div class="PosOne">当前位置：</div>
            <div class="PosOne">我的订单</div>
        </div>
        <c:if test="${empty carts }">
	        <div class="List" style="margin-bottom:5px;">
	        	<div class="ListTit" style="margin-top:30px;text-align:center;">
	        		<a href="..">您的商品订单是空的，立即去淘桃看下</a>
	        	</div>
	        </div>
        </c:if>
        <c:set var="totalAmount" value="0"></c:set>
        <c:if test="${not empty carts}">
	        <div class="List">
            <div class="ListTit">商品订单</div>
            <c:forEach items="${carts}" var="cart">
            <div class="ListBg">
                <div class="ListBgLeft">
                    <c:choose>
                		<c:when test="${empty cart.pictureUrl}">
                			<img src="${ctx}/page/ttw/portal/images/Submit/none.jpg" />
                		</c:when>
                		<c:otherwise>
                			<img src="${ctx}/page/ttw/portal/images/Submit/pic.png" />
                		</c:otherwise>
                	</c:choose>
                    <div class="ListBgTit" style="width:390px;">${cart.goodsName}</div>
                    <div class="ListSeven">
                        <div class="SevenIcon"></div>
                        <div>7天无理由退货</div>
                    </div>
                </div>
                <div class="ListBgRight">
                    <div class="ListPrice">￥${cart.price}</div>
                    <div class="ListNum">x${cart.total}</div>
                    <!-- <div class="ListOpr"><a href="">删除</a></div> -->
                </div>
            </div>
            <c:set var="totalAmount" value="${totalAmount+cart.price*cart.total}"></c:set>
            </c:forEach>
        </div>
        <div class="Bill">
            <div class="BillTit">发票信息</div>
            <div class="BillInfo">
            	<div class="BillInfo_Type">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不开发票</div>
            	<div class="BillInfo_Type BMargin"></div>
                <div class="BillInfo_Type BMargin"></div>
            	<div class="BillInfo_Rev" id="btn">修改</div>
                <!-- <div class="BillInfo_Type">普通发票（电子）</div>
                <div class="BillInfo_Type BMargin">个人</div>
                <div class="BillInfo_Type BMargin">明细</div>
                <div class="BillInfo_Rev" id="btn">修改</div> -->
            </div>
            <div class="BillBox" id="box">
                <div class="BB_Tit">发票信息</div>
                <div class="BB_Con">
                    <div class="BB_ConTit">
                        <div class="BB_CT1" id="Tit0">普通发票</div>
                        <div class="BB_CT0">电子发票</div>
                        <div class="BB_CT0" id="Tit2">增值税发票</div>
                    </div>
                    <div id="main0">
                        <div class="BB_ConHead">
                            <div class="BB_CHTit">发票抬头：</div>
                            <input type="text" value="个人" />
                            <!-- <div class="BB_CHNew">新增单位发票</div>
                            <div class="BB_CHIcon"></div> -->
                        </div>
                        <div class="BB_ConMain">
                            <div class="BB_CHTit">发票内容：</div>
                            <div class="BB_CMCon">
                                <div class="BB_CT1">不开发票</div>
                                <div class="BB_CT0">办公用品</div>
                                <div class="BB_CT0">电脑配件</div>
                                <div class="BB_CT0">耗材</div>
                            </div>
                        </div>
                        <div class="BB_ConBtn">
                            <div class="BB_CB_Safe">保存发票信息</div>
                            <div class="BB_CB_Can">取消</div>
                        </div>
                    </div>
                    <div id="main2">
                        <div class="BB_M2Tit">
                            <div class="BB_M2Tit1">1.填写公司信息</div>
                            <div class="BB_M2Tit2">>></div>
                            <div class="BB_M2Tit2">2.填写收票人信息</div>
                        </div>
                        <ul class="BB_M2Ul">
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">单位名称：</div>
                                <input type="text" />
                            </li>
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">纳税人识别码：</div>
                                <input type="text" />
                            </li>
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">注册地址：</div>
                                <input type="text" />
                            </li>
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">注册电话：</div>
                                <input type="text" />
                            </li>
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">开户银行：</div>
                                <input type="text" />
                            </li>
                            <li>
                                <div class="BB_M2Star">*</div>
                                <div class="BB_CHTit">银行账户：</div>
                                <input type="text" />
                            </li>
                        </ul>
                        <div class="BB_ConBtn">
                            <div class="BB_CB_Safe">下一步</div>
                            <div class="BB_CB_Can">取消</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:if>
        <!-- <div class="Gold">
            <div class="GoldFont">使用代金劵：</div>
            <input type="text" />
            <div class="GoldPrice">-￥0.00</div>
        </div> -->
        <c:if test="${not empty carts}">
	        <div class="Pay">
	            <div class="PayRight" style="width:450px;">
	                <div class="PayAll">应付总计：</div>
	                <div class="PayPrice">￥${totalAmount}</div>
	                <a href="Pay.htm"><div class="PayBtn">订单结算</div></a>
	            </div>
	        </div>
        </c:if>
    </div>
    <script type="text/javascript">
	    $(document).ready(function() {
	    	document.onclick = function(e) {
	            $("#box")[0].style.display = "none";
	            $("#op")[0].style.display = "none";
	        }
	        $("#btn")[0].onclick = function(e) {
	            $("#box")[0].style.display = "block";
	            $("#op")[0].style.display = "block";
	            stopFunc(e);
	        }
	        $("#box")[0].onclick = function(e) {
	            stopFunc(e);
	        }
	        $(".dropdownDefault,.dropdownContainer .downArrow1").click(function(event) {
	            if ($(this).siblings(".dropdrown-menu").is(":hidden")) {
	                $(".dropdrown-menu").hide();
	                $(this).siblings(".dropdrown-menu").show(10);
	            } else {
	                $(this).siblings(".dropdrown-menu").hide(10);
	            }
	
	            event.stopPropagation();
	            $(document).click(function() {
	                $(".dropdrown-menu").hide();
	            });
	        });
	        $(".dropdrown-menu li").click(function() {
	            $(this).parent().siblings(".dropdownDefault").html($(this).html());
	            $(this).parent().hide();
	        });
	        Tit();
	    });
	    function Tit() {
	        $("#Tit0")[0].onclick = function() {
	            $("#main0")[0].style.display = "block";
	            $("#main2")[0].style.display = "none";
	            $("#Tit0")[0].className = "BB_CT1";
	            $("#Tit2")[0].className = "BB_CT0";
	        }
	        $("#Tit2")[0].onclick = function() {
	            $("#main0")[0].style.display = "none";
	            $("#main2")[0].style.display = "block";
	            $("#Tit0")[0].className = "BB_CT0";
	            $("#Tit2")[0].className = "BB_CT1";
	        }
	    }
	    function stopFunc(e) {
	        document.all ? event.cancelBubble = true: e.stopPropagation();
	    }
	    var html = template('footer', {});
	    document.body.innerHTML += html;
	</script>
</body>
</html>

