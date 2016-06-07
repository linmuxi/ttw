<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = UUID.randomUUID().toString();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>产品分类&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/GoodsCategoryAction.js?2=1"></script>
	<script src="<%=basePath%>dwr/interface/FileStoreAction.js?2=1"></script>
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">产品分类信息管理</a> <a class="brand2">编辑产品分类信息 </a>
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
					<strong>说明</strong> 请根据需要编辑产品分类信息
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
				<!-- 开始显示产品分类form表单 -->
				<input type="hidden" id="id" name="id" value="<%= id %>"/>
				<input type="hidden" id="parentId" name="parentId"/>
				<input type="hidden" id="grade" name="grade" />
				<input type="hidden" id="path" name="path" />
				
				<div class="form-actions">
					<div class="form-inline">
						<span class="label label-required">产品分类名称:</span> 
						<input type="text" class="medium" id="name" name="name" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">分类编码:</span> 
						<input type="text" class="medium" id="categoryCode" name="categoryCode" style="width: 50%;"/>
					</div>
					
					<div class="form-inline">
						<table>
							<tr>
								<td><span class="label label-required">父分类:</span></td>
								<td>
									<div id="goodsCategoryDiv">

									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="form-inline">
						<span class="label label-required">更多父分类: </span> 
						<input type="text" class="medium" id="moreParentCategoryView" name="moreParentCategoryView" readonly="readonly" style="background-color: #EEEEEE;"/>
						<input type="hidden" id="moreParentCategory" name="moreParentCategory" />
						<input class="btn btn-success" type="button" id="selectCategoryBtn"  value="选择" />
					</div>
					<div class="form-inline">
						<span class="label label-required">排序: </span> 
						<input type="text" class="medium" id="sort" name="sort" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">是否可用: </span> 
						<input type="radio"
							id="enabled" name="enabled" value="1" checked="checked" /> <label
							for="radio-1">是 </label> <input type="radio" id="enabled"
							name="enabled" value="0" /> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<span class="label label-required">是否推荐: </span> 
						<input type="radio"
							id="recommended" name="recommended" value="1" checked="checked" /> <label
							for="radio-1">是 </label> <input type="radio" id="recommended"
							name="recommended" value="0" /> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<span class="label label-required">是否首页滚动: </span> 
						<input type="radio"
							id="scroll" name="scroll" value="1" checked="checked" /> <label
							for="radio-1">是 </label> <input type="radio" id="scroll"
							name="scroll" value="0" /> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<span class="label label-required">URL类型: </span> 
						<input type="radio"
							id="url_mark1" name="url_mark" value="1" checked="checked"/> <label
							for="url_mark1">默认 </label> <input type="radio" id="url_mark2"
							name="url_mark" value="0" /> <label for="url_mark2">自定义</label>
					</div>
					<div class="form-inline" style="display: none;" id="url_wrap">
						<span class="label label-required">URL: </span> 
						<input type="text" class="medium" id="url" name="url" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">图片跳转路径: </span> 
						<input type="text" class="medium" id="picHref" name="picHref" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">分类描述: </span> 
						<textarea rows="5" cols="200" class="medium" id="metaDes" name="metaDes" style="width: 50%;"></textarea>
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
						<span class="label label-required">操作:</span> <input
							class="btn btn-success" type="button" id="delpc" name="delpc"
							value="删除所选图片" />
					</div>
					<div class="form-inline">
						<label class="label label-submit"></label> <input type="hidden"
							id="hidgoodsid" name="hidgoodsid" value="" /> <input
							type="hidden" id="hidproductid" name="hidproductid" value=""> <input
							class="btn btn-success" type="button" id="submit" name="submit"
							value="提交" /> <input class="btn btn-success" type="button"
							id="update" name="update" value="更新" style="display: none;" />
					</div>
				</div>

			</div>
			
			<!-- 提示框 -->
			<div id="selectCategoryModal" class="modal hide fade">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			    <h3>选择更多父分类</h3>
			  </div>
			  <div  class="modal-body">
			    <p id="contentp">One fine body…</p>
			  </div>
			  <div class="modal-footer">
			    <a href="#" id="selectCategoryBtnClose" class="btn">关闭</a>
			    <a href="#" id="selectCategoryBtnOk" class="btn btn-primary">确认</a>
			  </div>
			</div>

		</div>

	</div>

	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/goodsCategory.js?5=1"></script>
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/page/common/js/fileStore.js"></script>
	
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript">
 		function createUploader(){
 			var businessId = getUrlParam('goodsCategoryId');
 			if(businessId == null){
 				businessId = $('#id').val();
 			}
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadergoodpc'),
                 action: '<%=basePath%>newUploadFile?businessId='+ businessId+'&type=goodsCategoryImg',
                 debug: true,
                 minSizeLimit:1024,
                 sizeLimit: 1073741824,
                 allowedExtensions: ['jpeg','jpg','gif','png'],
                 onComplete: function(id, fileName, responseJSON){
                			//var pcpath1 = "<%=basePath%>"+ responseJSON.success;
							var pcpath = responseJSON.success;
							var fileStoreId = responseJSON.fileStoreId;
							var htm = "<img id='"+id+"' src='<%=basePath%>"+pcpath+"' rel='#"+fileName+"'/>";
							var checkpc = "<input id='"+id+"' name='pcpath' type='checkbox' value='"+fileStoreId+"' /> ";
							$("#triggers").append(htm).append(checkpc);
						},
			});
			
		}
		window.onload = createUploader;
	</script>
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
