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
<!-- 商品类别导航 -->
<aside class="goods-type-nav">
	<h4>所有类别</h4>
	<ul class="one-level-nav-ul" id="categoryDiv">
		
	</ul>
</aside>
				
		
<script type="text/javascript">
//加载二级分类数据
function loadGoodsCategorySecondData(parentId){
	var html = "";
	$.ajax({
	   type: "POST",
	   async: false,
	   url: webRoot+"/page/portal/menu?parentId="+parentId,
	   success: function(msg){
		   if(msg){
			   //推荐产品分类信息
			   if(msg.menu){
			   		var categoryData = msg.menu;
			   		
			   		for(var i=0; i<categoryData.length; i++){
		   				var categoryUrl = webRoot + '/page/portal/productCategory?goodsCategoryId='+categoryData[i].id;
		   				
		   				html +='<li>';
                        html +='	<a href="'+categoryUrl+'">'+ categoryData[i].name + '</a>';
		   				html +='</li>';
		   				
			   		}
			   }
		   }
	   }
	});
	return html;
} 
//加载分类数据
function loadGoodsCategoryData(container){
	$.ajax({
	   type: "POST",
	   url: webRoot+"/page/portal/menu?parentId=",
	   success: function(msg){
		   if(msg){
			   //推荐产品分类信息
			   if(msg.menu){
			   		var categoryData = msg.menu;
			   		
			   		var html = "";
			   		for(var i=0; i<categoryData.length; i++){
			   				var secondDataHtml = loadGoodsCategorySecondData(categoryData[i].id);
			   				
			   				html += '<li class="one-li-0'+(i+1)+'" onclick="window.location.href=\'${pageContext.request.contextPath}/page/portal/productCategory?goodsCategoryId='+categoryData[i].id+'\'">';
							html += '	<i></i>'+categoryData[i].name+'<hr>';
							if(secondDataHtml != ''){
								html += '	<ul class="two-level-nav-ul">';
								html += 	secondDataHtml;
								html += '	</ul>';
							}
							html += '</li>';
			   		}
		   			$('#'+container).html(html);
			   }
		   }
	   }
	});
}


$(function(){
	loadGoodsCategoryData('categoryDiv');

	// 商品类别导航菜单鼠标事件
	$(".goods-type-nav .one-level-nav-ul>li").live('mouseover',function(){
		var idx = parseInt(this.className.substr(this.className.length-2,this.className.length));
		var _two_nav_ul = $(this).find(".two-level-nav-ul");
		var opts ;
		if(idx == $(".one-level-nav-ul>li").length){
			opts = { bottom:"-1px" } ;
		}else{
			opts = { top:((idx-1)*41)-1+"px" };
		}
		_two_nav_ul.css($.extend({display:"block",left:"250px"},opts));
	}).live('mouseleave',function(){
		$(this).find(".two-level-nav-ul").css("display","none");
	});
})
</script>
		
	