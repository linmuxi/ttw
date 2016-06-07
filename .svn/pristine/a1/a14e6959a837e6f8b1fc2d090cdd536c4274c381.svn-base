<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String introData = request.getParameter("intro") != null ? request
			.getParameter("intro") : "";
			
	String id = UUID.randomUUID().toString();
	
	//不需要header.jsp的头部
	request.setAttribute("INCLUDE_HEADER", false);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>产品信息管理 &middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" style="padding: 0;">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/GoodsAction.js?2=1"></script>
	<script src="<%=basePath%>dwr/interface/FileStoreAction.js?2=1"></script>
	
	
	<div class="container-fluid containerb" style="padding: 0; margin: 0;">

		<div class="row-fluid">
			<form name="businessForm" id="businessForm" role="form" style="margin-bottom: 0px;">
			<div id="mainlogic">
				<!-- 开始显示商品类型form表单 -->
				<input type="hidden" id="id" name="id" value="<%= id %>"/>
				<div class="form-actions" style="margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
					<div class="form-inline">
						<span class="label label-required">产品名称:</span> 
						<input type="text" class="medium" id="goodsName" name="goodsName" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">分类:</span> 
						<select id="goodsCategoryId" disabled="disabled">
			        		<option value="">--请选择--</option>
			        	</select>
			        	<span class="label label-info">请选择一个产品类型</span>
					</div>
					<!-- 加载商品类型属性和参数区域 -->
					<div id="gat"
						style="display: none; border: 1px solid #E3E3E3; padding: 10px; margin-bottom: 10px;">
						<div class="well">
							<h4>商品属性选择区域</h4>
						</div>

						<div class="form-inline">
							<span class="label label-required">属性选择区:</span> <select
								id="gatarea" name="gatarea" disabled="disabled"></select>
						</div>

					</div>
					<div class="form-inline">
						<span class="label label-required">品牌:</span> 
						<select id="brandId" disabled="disabled">
			        		<option value="">--请选择--</option>
			        	</select>
					</div>
					<div class="form-inline">
						<span class="label label-required">成本价格: </span> 
						<input type="text" class="medium" id="cost" name="cost"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">销售价格: </span> 
						<input type="text" class="medium" id="price" name="price" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">会员价格: </span> 
						<input type="text" class="medium" id="memberPrice" name="memberPrice" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">数量: </span> 
						<input type="text" class="medium" id="quantity" name="quantity" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">单位: </span> 
						<input type="text" class="medium" id="unitName" name="unitName" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">新品: </span> 
						<input type="radio"
							id="isNew" name="isNew" value="1" checked="checked" readonly="readonly"/> <label
							for="radio-1">是 </label> <input type="radio" id="isNew"
							name="isNew" value="0" readonly="readonly"/> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<span class="label label-required">上架: </span> 
						<input type="radio"
							id="isSpecificationsOpen" name="isSpecificationsOpen" value="1" checked="checked" readonly="readonly"/> <label
							for="radio-1">是 </label> <input type="radio" id="isSpecificationsOpen"
							name="isSpecificationsOpen" value="0" readonly="readonly"/> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<span class="label label-required">排序: </span> 
						<input type="text" class="medium" id="sort" name="sort" readonly="readonly"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">关键字: </span> 
						<input type="text" class="medium" id="keywordName" name="keywordName" readonly="readonly"/>
					</div>

					<div class="form-inline">
						<table>
							<tr>
								<td><span class="label label-required">主图:</span></td>
								<td>
									<div id="uploadergoodpc">
										<noscript>
											Please enable JavaScript to use file uploader.
											<!-- or put a simple form for upload here -->
										</noscript>

									</div>
								</td>
							</tr>
						</table>
						<!-- trigger elements -->
						<div id="triggers"></div>

					</div>
					
					<div class="form-inline">
						<span class="label label-required">商品介绍:</span>
						
						<div id="introView"></div>
					</div>

					
				</div>

			</div>
			</form>
		</div>

	</div>

	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/goodsDetail.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript">
		function saveData(){
			//dwr修改产品价格
			
			GoodsAction.updateGoodsPrice(
				{
					id:$("#id").val(),
					cost:$("#cost").val()
				},
				function(data){
					//修改产品价格成功
				}
			);
			
		}
	</script>
</body>
</html>


<%!
private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
}
%>
