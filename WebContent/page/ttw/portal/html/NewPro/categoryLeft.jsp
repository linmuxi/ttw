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
<div class="Hbsj_C_T_C_Left">
	<div class="Hbsj_C_T_C_L_Top">所有类别</div>
	<div class="Hbsj_C_T_C_L_Bottom">
                    
		<div class="Hbsj_C_T_C_L_B_Div" style="height: 1px; border-bottom: 0;">
		</div>
	 </div>
</div>
				
		
<script type="text/javascript">
//加载二级分类数据
function loadGoodsCategorySecondDate(parentId){
	var resultObj = {};
	var html = "";
	var rowNumber = 1;
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
			   				
	                        html +='    <a href="'+categoryUrl+'"><li>';
	                        html +='		<div>'+categoryData[i].name+'</div>';
	                        html +='		<div>|</div>';
	                        html +='    </li></a>';
	                        if((i+1)%4 == 0){
	                        	html += "<br/><br/>";
	                        	
	                        	rowNumber++;
	                        }
		   				
			   		}
		   			html ='<ul class="adsaf" >' + html + '</ul>';
			   }
		   }
	   }
	});
	resultObj.html = html;
	resultObj.rowNumber = rowNumber;
	return resultObj;
} 
//加载分类数据，只显示前6条
function loadGoodsCategoryData(parentId, container){
	$.ajax({
	   type: "POST",
	   url: webRoot+"/page/portal/menu?parentId="+parentId,
	   success: function(msg){
		   if(msg){
			   //推荐产品分类信息
			   if(msg.menu){
			   		var categoryData = msg.menu;
			   		
			   		var html = "";
			   		for(var i=0; i<categoryData.length; i++){
			   			//取前面6条数据
			   			if(i <= 5){
			   				var dataObj = loadGoodsCategorySecondDate(categoryData[i].id);
			   				var rowHeight = dataObj.rowNumber * 16;
			   				rowHeight += (dataObj.rowNumber - 1) * 10;
			   				html += '<div class="Hbsj_C_T_C_L_B_Div" style="border-top: 0;">';
	                        html += '    <div class="Hbsj_C_T_C_L_B_D_Left">';
	                        html += '    </div>';
	                        html += '    <div class="Hbsj_C_T_C_L_B_D_Text">';
	                        html += categoryData[i].name;
	                        html += '    </div>';
	                        html += '    <div class="Hbsj_C_T_C_L_B_D_Box" style="height: '+rowHeight+'px; width:400px;">'; 
	                        html += dataObj.html;
	                        html += '    </div>'; 
	                        html += '</div>';
			   			}
			   		}
			   		//6个
		   			$('.'+container).html(html);
			   }
		   }
	   }
	});
}
loadGoodsCategoryData('', 'Hbsj_C_T_C_L_Bottom');
</script>
		
	