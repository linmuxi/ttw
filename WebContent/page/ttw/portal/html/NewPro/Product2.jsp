<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author Administrator
   @since  2015年5月18日 下午8:48:46
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 微软雅黑;
        }
		a {color:#31333e;}
    </style>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath}/page/ttw/portal/css/product2.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/page/ttw/portal/build/template.js" type="text/javascript"></script>
</head>
<body>
	<%-- 头部    orc_lh  start --%>
	<jsp:include page="/page/ttw/portal/tpl/header.jsp"></jsp:include>
	<%-- 头部    orc_lh  start --%>
	
    <div class="Hbsj_Center">
        <div class="Hbsj_C_Top">
            <div class="Hbsj_C_T_Top">
                <div class="Hbsj_C_T_T_Left">
                    <div class="Hbsj_C_T_T_L_Div"></div>
                    <div class="Hbsj_C_T_T_L_Text">当前位置：${modelMap.goodsCategory.parentCategoryName }</div>
                    <div class="Hbsj_C_T_T_L_Text" id="Hbsj_C_T_T_L_Text" style="margin-left:0px; font-size:12px;"><c:if test="${not empty modelMap.goodsCategory.parentCategoryName }">></c:if>${modelMap.product.goodsCategoryName }</div>
                </div>
            </div>
            <div class="Hbsj_C_T_Mer">
                <div class="Hbsj_C_T_M_Left">
                    <div class="Hbsj_C_T_M_Pic">
                        <img src="${pageContext.request.contextPath}${modelMap.productImage[0].url }" style=" margin: 21px; width: 255px; height: 255px;" />
                    </div>
                    <div class="Hbsj_C_T_M_Bot">
                        <div class="Hbsj_C_T_M_B_Sel">
                            <div class="Hbsj_C_T_M_B_Left" id="hbsjLeft"></div>
                        	<c:forEach items="${modelMap.productImage }" var="imageItem" varStatus="stat">
                        		<c:if test="${stat.index < 3}">
                            	<div class="Hbsj_C_T_M_B_Div">
                            		<c:if test="${stat.index eq 0 }">
                            			<img src="${pageContext.request.contextPath}${imageItem.url }" style="width: 65px; height: 65px;" />
                            		</c:if>
                            		<c:if test="${stat.index ne 0 }">
                            			<img src="${pageContext.request.contextPath}${imageItem.url }" style="width: 65px; height: 65px; opacity: 0.4;" />
                            		</c:if>
                            	</div>
                        		</c:if>
                        	</c:forEach>
                            <div class="Hbsj_C_T_M_B_Left" id="hbsjRight" style="background-position:-141px -154px;"></div>
                        </div>
                    </div>
                </div>
                <div class="Hbsj_C_T_M_Right">
                    <div class="Hbsj_C_T_M_R_Top">
                        <div class="Hbsj_C_T_M_R_T_Left">
                            <div class="Hbsj_C_T_M_R_T_L_Text">${modelMap.product.goodsName }</div>
                            <%--
                            <div class="Hbsj_C_T_M_R_T_L_Num Hbsj_C_T_M_R_T_L_Text">商品编号：AB2012313</div>
                            <div class="Hbsj_C_T_M_R_T_L_Pic"></div>
                            --%>
                        </div>
                        <%--
                        <div class="Hbsj_C_T_M_R_T_Right">
                            <div class="Hbsj_C_T_M_R_T_R_Text">还剩下</div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">1</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">2</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Text">天</div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">3</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">4</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Text">小时</div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">0</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Time"><div class="Hbsj_C_T_M_R_T_R_T_Num">2</div><div class="Hbsj_C_T_M_R_T_R_T_Line"></div></div>
                            <div class="Hbsj_C_T_M_R_T_R_Text">分</div>
                        </div>
                         --%>
                    </div>
                    <div class="Hbsj_C_T_M_R_T_Cen">
                        <div class="Hbsj_C_T_M_R_T_C_Top">
                            <div class="Hbsj_C_T_M_R_T_C_T_Text">桃淘网价：</div>
                            <div class="Hbsj_C_T_M_R_T_C_T_Num"><font size="3">￥</font>${modelMap.product.memberPrice }</div>
                            <div class="Hbsj_C_T_M_R_T_C_T_Value">价格 ￥ ${modelMap.product.price }</div>
                        </div>
                        <div class="Hbsj_C_T_M_R_T_C_Cen Hbsj_C_T_M_R_T_C_Top">
                            <div class="Hbsj_C_T_M_R_T_C_C_Text">促销信息：<font color="#cc0000">无<%--满599.00另加59.00元，或满999.00另加109.00元，即可购买热销商品 --%></font></div>
                        </div>
                        <div class="Hbsj_C_T_M_R_T_C_Bot Hbsj_C_T_M_R_T_C_Top">
                            <div class="Hbsj_C_T_M_R_T_C_B_Text">月销量：<font color="#cc0000">不公开<%--2655 --%></font></div>
                            <div class="Hbsj_C_T_M_R_T_C_B_Appraisal">
                                <div style="float:left;">商品评价：</div>
                                <div class="Hbsj_C_T_M_R_T_C_B_A_Start"></div>
                                <div class="Hbsj_C_T_M_R_T_C_B_A_Start"></div>
                                <div class="Hbsj_C_T_M_R_T_C_B_A_Start"></div>
                                <div class="Hbsj_C_T_M_R_T_C_B_A_Start"></div>
                                <div class="Hbsj_C_T_M_R_T_C_B_A_Value">5.0分</div>
                            </div>
                        </div>
                    </div>
                    <div class="Hbsj_C_T_M_R_T_Bot">
                        <div class="Hbsj_C_T_M_R_T_B_Num">
                            <div class="Hbsj_C_T_M_R_T_B_N_Num">
                                <input type="text" name="amount" id="amount" style="border: 0px; width: 65px; height: 38px; text-align: center;" value="1"/>
                            </div>
                            <div class="Hbsj_C_T_M_R_T_B_N_Add" onclick="operationFun({type:'+'})">+</div>
                            <div class="Hbsj_C_T_M_R_T_B_N_Add" onclick="operationFun({type:'-'})" style=" border-bottom:0px; height:20px;">-</div>
                        </div>
                        <div class="Hbsj_C_T_M_R_T_B_N_Pay" id="payId" style="cursor: pointer;" onclick="order('${modelMap.product.id}');">立即购买</div>
                        <div class="Hbsj_C_T_M_R_T_B_N_Pay" style="background-color:#0096dc; color:white;cursor: pointer;" id="addCarId">加入购物车</div>
                        <div class="Hbsj_C_T_M_R_T_B_N_Fun">支付方式：信用卡  网上银行  支付宝  找人代付</div>
                        <div class="Hbsj_C_T_M_R_T_B_N_CusSer">
                        </div>
                    </div>
                </div>
            </div>
            <div class="Hbsj_C_T_Cen">
            	<%-- 所有分类  start --%>
				<jsp:include page="/page/ttw/portal/html/NewPro/categoryLeft.jsp"></jsp:include>
				<%-- 所有分类  end --%>
            	
            	<%-- 
                <div class="Hbsj_C_T_C_Left">
                    <div class="Hbsj_C_T_C_L_Top">所有类别</div>
                    <div class="Hbsj_C_T_C_L_Bottom">
                        <div class="Hbsj_C_T_C_L_B_Div" style="border-top:0;">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">平面设计</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">建设营销</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">虚拟主机</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">域名注册</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">企业邮箱</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div">
                            <div class="Hbsj_C_T_C_L_B_D_Left"></div>
                            <div class="Hbsj_C_T_C_L_B_D_Text">项目案例</div>
                        </div>
                        <div class="Hbsj_C_T_C_L_B_Div" style="height:1px; border-bottom:0;"></div>
                    </div>
                </div>
                --%>
                <div class="Hbsj_C_T_C_Right" style="border: solid 1px #c9c9c9;">
                    <div class="Hbsj_C_T_C_R_Top">
                        <div class="Hbsj_C_T_C_R_T_Left">
                            商品详情
                        </div>
                    </div>
                    <div id="introDiv">
                    <div style="text-align: center; color: #31333e; font-size: 12px; padding: 20px 0px 20px 0px;">
	                    <ul>
	                    	<c:forEach items="${modelMap.attrList }" var="attrItem">
		                    	<li style="width: 30%; float: left;">${attrItem.goodsAttributeName }：${attrItem.attrVal }</li>
	                    	</c:forEach>
	                    </ul>
                    </div>
                   
					${modelMap.product.intro }
                    </div>
                    <%--
                    <img src="${modelMap.product.goodsName }" style="margin:17.5px;" />
                    <img src="../../images/product/Poster/detail.png" style="margin:17.5px;" />
                    <img src="../../images/product/Poster/detail2.png" style="margin:6.5px;" />
                     --%>
                </div>
            </div>
        </div>
        <div class="Hbsj_C_Cen">
            <div class="Hbsj_C_C_Left Hbsj_C_T_C_Left" style="height: auto; padding-bottom: 10px;">
                <div class="Hbsj_C_C_L_Top Hbsj_C_T_C_L_Top">推荐商品</div>
                <div class="Hbsj_C_C_L_Bot">
                	<c:forEach items="${modelMap.recommendedList }" var="recommendedItem" varStatus="stat">
                    <div class="Hbsj_C_C_L_B_Div" style="cursor: pointer;" 
                    onclick="window.location.href = '${pageContext.request.contextPath}/page/portal/product?productId=${recommendedItem.id }';">
                        <div class="Hbsj_C_C_L_B_D_Img">
                        	<img src="${pageContext.request.contextPath}${recommendedItem.pcurl}" style="width: 180px; height: 140px;"/>
                        </div>
                        <div class="Hbsj_C_C_L_B_D_Text">
                            <div class="Hbsj_C_C_L_B_D_T_Div">
                                <div style="color:red; font-size:19px; float:left;">￥${recommendedItem.memberPrice }</div>
                                <div style="color:#222222; float:right; font-size:12px; margin-top:5px;">${recommendedItem.keywordName }</div>
                            </div>
                            <div class="Hbsj_C_C_L_B_D_T_Div">
                                <div style="font-size:10.2px; color:#848484; text-decoration:line-through; float:left;">原价：￥${recommendedItem.price }</div>
                                <%--
                                <div style="color:#aaaaaa; float:right; font-size:12px;">商品编号：LT002</div>
                                 --%>
                            </div>
                        </div>
                    </div>
                	</c:forEach>
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
            //var urlinfo = window.location.href;
            //var userName = urlinfo.split("?")[1].split("=")[1];
            //$("#Hbsj_C_T_T_L_Text")[0].innerHTML = ">" + decodeURI(userName);
    </script>
</body>
</html>
<script src="${pageContext.request.contextPath}/page/ttw/js/myslider.js" type="text/javascript"></script>
<script>
$(function(){
	//-----设置商品详情自适应   orc_lh-------start
	var hbsjTop = $('.Hbsj_C_T_C_R_Top').height();
	var hbsjTopHeight = parseInt(hbsjTop);
	var introDiv = $('#introDiv').height();
	var hbsjTopHeight = parseInt(introDiv);
	$('.Hbsj_C_T_C_Right').css('height', hbsjTop + hbsjTopHeight);
	//-----设置商品详情自适应   orc_lh-------end
	
	
	//-----滚动图片代码   orc_lh-------start
	//获取大图的img对象
	var picObj = $('.Hbsj_C_T_M_Pic').find('img').get(0);
	
	//获取小图的数组
	var smallImgArr = $('.Hbsj_C_T_M_B_Sel').find('img');
	$.mySlider({bigImg:picObj, smallImg:smallImgArr, timeVal: 4000, style:'thumbnail'})
	//-----滚动图片代码   orc_lh-------end
	
	function checkMemberLogin(){
		var mid = "${memberInfo.id}";
		return (mid != '' && mid != null && mid != 'null');
	}
	
	//添加购物车
	$("#addCarId").click(function(){
		if(!checkMemberLogin()){
			window.location.href = webRoot + "/page/ttw/portal/html/Et.jsp?actionType=productDetail&productId=${modelMap.product.id}";
			return false;
		}
		
		var _count = $("#amount").val();
		if(_count == 0){
			lhgdialog.alert("请选择数量!");
			return false;
		}
		
		$.ajax({
		   type: "POST",
		   url: webRoot+"/page/portal/cart/insertCart",
		   data:{
			 "goodsId":"${modelMap.product.id}",
			 "total":_count
		   },
		   success: function(msg){
			   refreshCarCount("1");
		   },
		   error:function(){
				lhgdialog.alert("加入购物车失败!");
		   }
		});
		
	});
})

function operationFun(param){
	
	if(param.type == '+'){
		var amount = $('#amount').val();
		if(amount == ''){
			amount = '0';
		}
		
		var amountVal = parseInt(amount);
		
		amountVal++;
		
		$('#amount').val(amountVal+'');
	}else if(param.type == '-'){
		var amount = $('#amount').val();
		if(amount == ''){
			amount = '0';
		}
		var amountVal = parseInt(amount);
		if(amountVal == 0){
			amountVal = 0;
		}else{
			amountVal--;
		}
		$('#amount').val(amountVal+'');
	}
}

function order(id){
	location.href="${pageContext.request.contextPath}/page/portal/product/order?productId="+id;
}
</script>

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