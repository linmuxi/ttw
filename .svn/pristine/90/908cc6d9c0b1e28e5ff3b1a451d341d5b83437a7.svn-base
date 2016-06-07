<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<footer class="home-footer">
	<p class="footer-menu">
		<%-- <c:forEach var="item" items="${footerMenuList}">
			<a href="${ctx}${item.defaultValue}" title="${item.defaultKey}">${item.defaultKey}</a>
		</c:forEach> --%>
	</p>
	<div class="clear"></div>
	<p>粤ICP备13003490号-2</p>
	<p>Copyright © 2015-2015 顺天丞版权所有</p>
</footer>

<script type="text/javascript">
$(function(){
	$.ajax({
		   type: "POST",
		   url: webRoot+"/page/front/home/getFooterMenu",
		   success: function(data){
			   if(data && data.footerMenuList){
				   var _p = $("p.footer-menu");
				   $(data.footerMenuList).each(function(idx,data){
					   _p.append('<a href="'+webRoot+data.defaultValue+'" title="'+data.defaultValue+'">'+data.defaultKey+'</a>');
				   });
			   }
		   }
	});
});
</script>