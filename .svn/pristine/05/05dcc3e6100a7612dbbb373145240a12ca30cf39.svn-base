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
<section class="goods-search-main-left">
	<!-- 商品类别导航 -->
	<jsp:include page="productTypeMenu.jsp"></jsp:include>
	
	<!-- 推荐商品 -->
	<section class="goods-recommand-wrap" id="recommandDiv">
		
	</section>
	<!-- end 推荐商品 -->

</section>
				
		
<script type="text/javascript">
function loadRecommendedData(container){
	var url = webRoot + "/page/portal/recommended?goodsCategoryId=${param.goodsCategoryId}";
	$.ajax({
	   type: "POST",
	   url: url,
	   success: function(data){
		   if(data){
			   //推荐产品分类信息
			   if(data.recommendedList){
			   		var recommendedList = data.recommendedList;
			   		
			   		var html = "<h4>推荐商品</h4>";
			   		for(var i=0; i<recommendedList.length; i++){
			   			var id = recommendedList[i].id;
			   			var goodsCategoryId = recommendedList[i].goodsCategoryId;
			    		var serialNumber = recommendedList[i].serialNumber;
			    		var goodsName = recommendedList[i].goodsName;
			    		var memberPrice = recommendedList[i].memberPrice ? parseFloat(recommendedList[i].memberPrice).toFixed(1) : '0.0'; 
			    		var price = recommendedList[i].price ? parseFloat(recommendedList[i].price).toFixed(1) : '0.0';
			    		var pcurl = recommendedList[i].pictureUrl;
			   			
			   			html += '<figure>';
			   			html += '	<img src="${ctx}'+pcurl+'" alt="'+goodsName+'" onclick="window.location.href=\'${pageContext.request.contextPath}/page/portal/product?goodsCategoryId='+goodsCategoryId+'&productId='+id+'\'"  onerror="this.src=\'${ctx}/page/ttw/front/images/default_goods_210_130.png\'"  width="221" height="130" >';
			   			html += '	<figcaption>';
			   			html += '		<p>';
			   			html += '			<span class="">￥'+memberPrice+'</span>';
			   			html += '			<span class="float-right">原价：￥'+price+'</span>';
			   			html += '		</p>';
			   			html += '		<p>';
			   			html += '			<span class="">'+goodsName+'</span>';
			   			html += '		</p>';
			   			html += '		<p>';
			   			html += '			<span class="">商品编号:'+serialNumber+'</span>';
			   			html += '		</p>';
			   			html += '	</figcaption>';
			   			html += '</figure>';
			   			
			   			//不是最后一个需要加<hr>
			   			if(i != recommendedList.length - 1){
				   			html += '<hr>';
			   			}
			   		}
			   		if(recommendedList && recommendedList.length > 0){
			   			$('#'+container).html(html);
			   		}else{
			   			$('#'+container).hide();//没有数据则隐藏
			   		}
			   }
		   }
	   }
	});
}


$(function(){
	loadRecommendedData('recommandDiv');
	// 推荐商品鼠标事件
	$(".goods-recommand-wrap").find("figure").live('mouseover', function(){
		$(this).addClass("goods-box-selected");
	}).live('mouseleave', function(){
		$(this).removeClass("goods-box-selected");
	});
})
</script>
		
	