<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author Administrator
   @since  2015年5月18日 下午8:48:46
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" 
%><%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"
%><%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<style>
		html,body{ width: 100%; height: 100%; margin: 0; padding: 0; font-family: 微软雅黑;}
		 a {color:#31333e;}
	</style>
	<jsp:include page="/page/ttw/portal/common.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath}/page/ttw/portal/css/product.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/page/ttw/portal/js/unslider.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/page/ttw/portal/build/template.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/page/common/js/pagination/pagination.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/page/common/js/pagination/style.css" rel="stylesheet" type="text/css" />
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
					<div class="Hbsj_C_T_T_L_Text" id="Hbsj_C_T_T_L_Text" style="margin-left:0px; font-size:12px;"><c:if test="${not empty modelMap.goodsCategory.parentCategoryName }">></c:if>${modelMap.goodsCategory.name }</div>
				</div>
				<div class="Hbsj_C_T_T_Right">
					<div class="Hbsj_C_T_T_R_Div">
                      <input type="text" class="search-input" style="width: 170px;height: 23px;outline: none;border: none;"/>
						<div class="Hbsj_C_T_T_R_D_Right search-word">搜索</div>
					</div>
				</div>
			</div>
			<div class="Hbsj_C_T_Cen">
			
				<%-- 所有分类  start --%>
				<jsp:include page="/page/ttw/portal/html/NewPro/categoryLeft.jsp"></jsp:include>
				<%-- 所有分类  end --%>
				
				<div class="Hbsj_C_T_C_Right">
					<div class="Hbsj_C_T_C_R_Left">
						<c:forEach items="${modelMap.attrList }" var="attrItem" varStatus="stat">
							<div class="Hbsj_C_T_C_R_L_Div">${attrItem.goodsAttributeName }</div>
						</c:forEach>
					</div>
					<div class="Hbsj_C_T_C_R_Right">
						<c:forEach items="${modelMap.attrList }" var="attrItem" varStatus="stat">
							<c:set var="attrNames" value="${attrItem.attributeList }"></c:set>
							<div class="Hbsj_C_T_C_R_R_Div">
								<c:forEach items="${attrNames }" var="attrNameItem">
									<div class="Hbsj_C_T_C_R_R_D_Div">
										<input type='checkbox' name="attrBox" value="${attrItem.id }#${attrNameItem }" onclick="reloadPagination()"/><div class="Hbsj_C_T_C_R_R_D_D_Text">${attrNameItem }</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		
		<div class="Hbsj_C_Cen">
			<div class="Hbsj_C_C_Left Hbsj_C_T_C_Left">
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
                                <div style="color:#222222; float:right; font-size:12px; margin-top:5px;">${recommendedItem.goodsName }</div>
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
			<div class="Hbsj_C_C_Right Hbsj_C_T_C_Right">
				<div class="Hbsj_C_C_R_Top Hbsj_C_T_C_L_Top">
					<div class="Hbsj_C_C_R_T_Left Hbsj_C_T_T_Left">
						<input type="hidden" name="sortField" id="sortField"/>
						<input type="hidden" name="sortField" id="sortType"/>
						
						<div class="Hbsj_C_C_R_T_L_Text" >排序：</div>
						<div class="Hbsj_C_C_R_T_L_Div" style="cursor: pointer; width: 45px;" onclick="reloadPaginationBySort('price', this);">价 格</div>
						<div class="Hbsj_C_C_R_T_L_Div" style="cursor: pointer; width: 45px;" onclick="reloadPaginationBySort('memberPrice', this);">会员价</div>
						<div class="Hbsj_C_C_R_T_L_Text" id="sortDes">(无序)</div>
					</div>
					<div class="Hbsj_C_C_R_T_Right Hbsj_C_T_T_Right">
						<div class="Hbsj_C_C_R_T_R_Text">共<font id="productCount">${modelMap.count }</font>件商品</div>
						<div class="Hbsj_C_C_R_T_R_Num">
							<c:choose>
								<c:when test="${modelMap.count ne 0}">
									<font color="red" id="currPageNumber">1</font>/<font id="totalPage"><fmt:parseNumber var="pageNumber" integerOnly="true" value="${modelMap.count/12 }" />${pageNumber eq 0 ? 1 : pageNumber }</font>
								</c:when>
								<c:otherwise>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
						</div>
						<div class="Hbsj_C_C_R_T_R_Input" style="margin-left:30px; cursor: pointer;" onclick="$('#demo').pagination('previous')">上一页</div>
						<div class="Hbsj_C_C_R_T_R_Input" style="cursor: pointer;" onclick="$('#demo').pagination('next')">下一页</div>
					</div>
				</div>
				<div class="Hbsj_C_C_R_Cen Hbsj_C_C_L_Bot">	
					<%-- 产品列表 --%>
					<div class="Hbsj_C_C_R_C_CenDiv" style="height: 100%;">
						
					
					</div>
					
					<%-- 分页 --%>
					<c:choose>
						<c:when test="${modelMap.count ne 0}">
							<div id="demo" class="Hbsj_C_C_R_C_Bot" style="margin-top: 50px;"></div>
						</c:when>
						<c:otherwise>
							<div id="noData" class="Hbsj_C_C_R_C_Bot" style="margin-top: 50px; text-align: center;">没有数据</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
   <script>
       var html = template('footer', {});
       document.body.innerHTML += html;
    </script>
    <script type="text/javascript">
    $(function(){
    	//判断是否需要分页
    	if('${modelMap.count }' != '0'){
    		initPagination(${modelMap.count })
    	}
    });
    
    
    function reloadPagination(){
    	//清除分页实例
    	$('#demo').pagination('destroy');
    	//查询商品列表数量
    	var count = loadProductDataCount();
    	if(count != 0){
	    	//删除没有数据的提示
	    	$('#noData').remove();
	    	//显示分页div
    		$('#demo').show();
	    	
	    	//重新加载分页实例
	    	initPagination(count);
    	}else{
    		//清空数据
    		$('.Hbsj_C_C_R_C_CenDiv').html('');
    		$('.Hbsj_C_C_R_C_CenDiv').height(0);
    		var noData = '<div id="noData" class="Hbsj_C_C_R_C_Bot" style="margin-top: 50px; text-align: center;">没有数据</div>';
    		$('.Hbsj_C_C_R_Cen').append(noData);
    		//清除分页实例
    		$('#demo').pagination('destroy');
    		//隐藏分页div
    		$('#demo').hide();
    		
    		$('#productCount').html("0");
  	        $('.Hbsj_C_C_R_T_R_Num').html("&nbsp;&nbsp;&nbsp;&nbsp;");
    	}
    }
    
    function loadProductDataCount(){
    	var count = 0;
    	var loadDataUrl = '${pageContext.request.contextPath}/page/portal/queryProductDataCount?goodsCategoryId=${param.goodsCategoryId}';
    	//拼接搜索关键字
    	loadDataUrl += '&search=' + search.encodeURI();
    	//排序
    	loadDataUrl += '&sortField='+$('#sortField').val();
    	loadDataUrl += '&sortType='+$('#sortType').val();
    	//获取属性
    	var attrNames = "";
    	$('input[name="attrBox"]:checked').each(function(){
    		if(attrNames == ""){
    			attrNames += $(this).val();
    		}else{
    			attrNames += "," + $(this).val();
    		}
    	});
    	loadDataUrl += '&attrNames=' + attrNames.encodeURI();
    	
    	$.ajax({
 		   type: "POST",
 		   url: loadDataUrl,
 		   async: false,
 		   success: function(msg){
 			   	//alert(msg);
 			   	//alert(msg.count);
 				if(msg){
	 				count = msg.count;
 				}
 		   }
 		});
    	return count;
    }
    
    
    //排序
    function reloadPaginationBySort(field, obj){
    	//排序字段
		var sortField = $('#sortField').val();    	
    	//排序类型DESC或ASC
    	var sortType = $('#sortType').val();
    	
    	//排序说明
    	var sortDes = $(obj).html() + ":";
    	
    	//判断排序字段是否变更
    	if(sortField == field){
    		if(sortType == ''){
	    		$('#sortType').val('DESC')
	    		sortDes += "倒序";
	    	}else if(sortType == 'DESC'){
	    		$('#sortType').val('ASC')
	    		sortDes += "升序";
	    	}else if(sortType == 'ASC'){
	    		$('#sortType').val('')
	    		sortDes = "无序";
	    	}
    	}else{
    		$('#sortType').val('DESC');
    		sortDes += "倒序";
    	}
    	
    	$('#sortField').val(field);
    	//设置排序备注
    	$('#sortDes').html('('+sortDes+')');
    	
    	//background-color: #0096dc; color: white; border:0; 
    	//#31333e
    	
    	$('.Hbsj_C_C_R_T_L_Div').css('backgroundColor', 'white').css('color', '#31333e');
    	$(obj).css('backgroundColor', '#0096dc').css('color', 'white');
    	
    	//清除分页实例
    	$('#demo').pagination('destroy');
    	//重新加载分页实例
    	initPagination(${modelMap.count });
    }
    
    //初始化分页，并加载数据
    function initPagination(total){
    	var loadDataUrl = '${pageContext.request.contextPath}/page/portal/productData?goodsCategoryId=${param.goodsCategoryId}';
    	//拼接搜索关键字
    	loadDataUrl += '&search=' + search.encodeURI();
    	//排序
    	loadDataUrl += '&sortField='+$('#sortField').val();
    	loadDataUrl += '&sortType='+$('#sortType').val();
    	//获取属性
    	var attrNames = "";
    	$('input[name="attrBox"]:checked').each(function(){
    		if(attrNames == ""){
    			attrNames += $(this).val();
    		}else{
    			attrNames += "," + $(this).val();
    		}
    	});
    	loadDataUrl += '&attrNames=' + attrNames.encodeURI();
    	
    	$('#demo').pagination({
    	    dataSource: loadDataUrl,
    	    locator: 'productList',
    	    totalNumber: total,
    	    pageSize: 5,
    	    ajax: {
    	        beforeSend: function(){
    	            //dataContainer.html('Loading data from flickr.com ...');
    	        }
    	    },
    	    callback: function(data, pagination){
    	    	/*
    	    	var attrHtml = "";
    	    	for(attr in pagination){
    	    		attrHtml += attr+":"+pagination[attr]+"\n";
    	    	}
    	    	alert(attrHtml);
    	    	*/
    	       var totalNumber = 0;
    	       var totalPage = pagination.totalPage;
    	       var pageNumber = pagination.pageNumber;
    	       var pageSize = pagination.pageSize;
    	       
    	       if(totalPage == 1){
    	    	   totalNumber = data.length;
    	       }else{
    	    	   totalNumber = (totalPage - 1) * pageSize + data.length;
    	       }
    	       //
    	       $('#productCount').html(totalNumber);
    	       $('#currPageNumber').html(pageNumber);
    	       $('#totalPage').html(totalPage);
    	       
    	       	//pageRange  pageSize  pageNumber
    	       if(data){
					loadProductData(data);
    	       }
    	       	
    	       $('.Hbsj_C_C_R_C_Bot').width(30 * 2 + 30 * totalPage + 10);
    	    }
    	})
    	
    }
    
    //根据data加载产品数据到页面
    function loadProductData(data){
    	var html = "";
    	for(var i=0; i<data.length; i++){
    		var id = data[i].id;
    		var goodsName = data[i].goodsName;
    		var memberPrice = data[i].memberPrice; 
    		var price = data[i].price;
    		var pcurl = data[i].pcurl;
    		
    		html += '<div class="Hbsj_C_C_R_C_Div Hbsj_C_C_L_B_Div">';
    		html += '	<a href = "${pageContext.request.contextPath}/page/portal/product?goodsCategoryId=${param.goodsCategoryId }&productId='+id+'" class="Hbsj_C_C_R_C_Divs">';
    		html += '   	<div class="Hbsj_C_C_R_C_D_Img Hbsj_C_C_L_B_D_Img">';
    		html += '       	<img src="${pageContext.request.contextPath}'+pcurl+'" style="width: 230px; height: 170px;"/>';
    		html += '   	</div>';
    		html += '   </a>';
   			html += '	<div class="Hbsj_C_C_L_B_D_Text">';
			html += '		<div class="Hbsj_C_C_L_B_D_T_Div">';
			html += '		<div style="color:red; font-size:19px; float:left; width: 35%;">￥'+memberPrice+'</div>';
			html += '			<div style="color:#222222; float:right; font-size:12px; margin-top:5px; width: 65%;">'+goodsName+'</div>';
			html += '		</div>';
			html += '		<div class="Hbsj_C_C_L_B_D_T_Div">';
			html += '			<div style="font-size:10.2px; color:#848484; text-decoration:line-through; float:left;">原价：￥'+price+'</div>';
			//html += '			<div style="color:#aaaaaa; float:right; font-size:12px;">商品编号：LT002</div>';
			html += '		</div>';
			html += '	</div>';
			html += '</div>';
    		
    	}
    	
    	$('.Hbsj_C_C_R_C_CenDiv').html(html);
    	
    	//
    	$('.Hbsj_C_C_R_C_CenDiv').height(240 * Math.ceil(data.length/3) );
    }
              	/*
                var urlinfo = window.location.href;
                var userName = urlinfo.split("?")[1].split("=")[1];
                $("#Hbsj_C_T_T_L_Text")[0].innerHTML = ">" + decodeURI(userName);
                $(".Hbsj_C_C_R_C_Divs").attr("href", "P_Station2.htm?t=" + userName);
                */
    </script>
</body>
</html>
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