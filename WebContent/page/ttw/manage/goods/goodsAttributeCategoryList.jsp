<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String introData = request.getParameter("intro") != null ? request
			.getParameter("intro") : "";
			
	String id = UUID.randomUUID().toString();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>产品属性&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/GoodsAttributeAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">产品属性信息管理</a> <a class="brand2">编辑产品属性信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div id="mainlogic" class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明</strong> 请根据需要编辑产品属性
				</div>
				<div id="alerterror" style="display: none;"
					class="alert alert-error">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div class="line-dotted"></div>
				<div class="btn-group">
					<button id="btnback" type="button" class="btn btn-success">返回</button>
				</div>
				<div class="btn-group">
					<input class="btn btn-success" type="button" id="btn_add_row"
							name="btn_add_row" value="增加属性" />
				</div>
				<!-- 开始显示商品类型form表单 -->
				<div class="form-actions">
					<div class="form-inline">
						<span class="label label-required">选择产品类型: </span> 
						<select class="form-control" id="goodsCategorySelect">
							<option value="">--请选择--</option>
							<c:if test="${not empty modelMap.CATEGORY && fn:length(modelMap.CATEGORY) > 0 }">
								<c:forEach items="${modelMap.CATEGORY }" var="categoryItem">
									<option value="${categoryItem.id }" <c:if test="${requestScope.modelMap.GOODSTYPEID eq categoryItem.id }">selected</c:if>>
										<c:if test="${not empty categoryItem.grade && categoryItem.grade ne '' }">
											<c:forEach begin="0" end="${categoryItem.grade}" varStatus="stat">
												&nbsp;
												<c:if test="${stat.index eq categoryItem.grade}">└</c:if>
											</c:forEach>
										</c:if>
										${categoryItem.name }
									</option>
								</c:forEach>
							</c:if>
						</select>
						<span class="label label-info">请选择一个产品类型并增加其属性</span>
					</div>
				</div>
				<div id="goodstypetnattrssarea" class="form-actions">
					<div class="table">
						<table>
							<thead>
								<tr>
									<th class="center">属性名称</th>
									<th>可选项(请用英文逗号分隔选项)</th>
									<th>排序</th>
									<th>操作</th>
								</tr>

							</thead>
							<tbody>
								<input type="hidden" name="rows" id="rows" value="${fn:length(modelMap.rows) }"/>
								
								<c:if test="${not empty modelMap.rows && fn:length(modelMap.rows) > 0 }">
						    	<c:forEach items="${modelMap.rows }" var="attrItem" varStatus="stat">
						    		<tr id="rowId${stat.index }">
							           	<td class="text-left">
							           		<c:if test="${attrItem.bParentAttr }">
							           			<input readonly="readonly" type="hidden" name="id" value="${attrItem.id }">
							           			<input readonly="readonly" type="text" class="form-control" name="goodsAttributeName" value="${attrItem.goodsAttributeName }">
							           		</c:if>
							           		<c:if test="${!attrItem.bParentAttr }">
							           			<input type="hidden" name="id" value="${attrItem.id }">
												<input type="text" class="form-control" name="goodsAttributeName" value="${attrItem.goodsAttributeName }">
							           		</c:if>
										</td>
							            <td class="text-left">
							            	<c:if test="${attrItem.bParentAttr }">
							           			<input readonly="readonly" type="text" class="form-control" name="attributeList" value="${attrItem.attributeList }">
							           		</c:if>
							           		<c:if test="${!attrItem.bParentAttr }">
								            	<input type="text" class="form-control" name="attributeList" value="${attrItem.attributeList }">
							           		</c:if>
							            </td>
							            <td class="text-left">
							            	<c:if test="${attrItem.bParentAttr }">
							           			<input readonly="readonly" type="text" class="form-control small" name="sort" value="${attrItem.sort }">
							           		</c:if>
							           		<c:if test="${!attrItem.bParentAttr }">
								            	<input type="text" class="form-control small" name="sort" value="${attrItem.sort }">
							           		</c:if>
							            </td>
			         				    <td class="text-left">
			         				    	<div class='form'>
			         				    		<div class='fields'>
			         				    			<div class='field field-first'>
			         				    				<div class='typeinput'>
			         				    					<c:if test="${!attrItem.bParentAttr }">
			         				    						<input  class='attribute btn btn-success delCommandData' id='${attrItem.id }' name='delbutton${attrItem.id }' type='button' rowId="rowId${stat.index }" value='删除' />
			         				    					</c:if>
		         				    					</div>
	         				    				</div>
         				    				</div>
			         				    </td>
							        </tr>
						    	</c:forEach>
						    	</c:if>
							</tbody>
						</table>
					</div>
					<div class="form-inline">
						<label class="label label-submit"></label> <input
							class="btn btn-success" type="button" id="submitattrs"
							name="submitattrs" value="提交" /> <input class="btn btn-success"
							type="button" id="btn_submit" name="btn_submit" value="更新"
							style="display: none;" />
					</div>
				</div>

			</div>

		</div>

	</div>
	
	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/goodsAttributeCategory.js"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
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
