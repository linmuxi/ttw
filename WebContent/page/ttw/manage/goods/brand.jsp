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
<title>品牌&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/BrandAction.js?2=1"></script>
	<script src="<%=basePath%>dwr/interface/FileStoreAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">品牌信息管理</a> <a class="brand2">编辑品牌信息 </a>
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
					<strong>说明</strong> 请根据需要编辑品牌信息
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
				<!-- 开始显示商品类型form表单 -->
				<input type="hidden" id="id" name="id" value="<%= id %>"/>
				<div class="form-actions">
					<div class="form-inline">
						<span class="label label-required">品牌名称:</span> 
						<input type="text" class="medium" id="brandName" name="brandName"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">品牌官网地址: </span> 
						<input type="text" class="medium" id="url" name="url"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">排序: </span> 
						<input type="text" class="medium" id="sort" name="sort"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">是否可用: </span> 
						<input type="radio"
							id="enabled" name="enabled" value="1" checked="checked" /> <label
							for="radio-1">是 </label> <input type="radio" id="enabled"
							name="enabled" value="0" /> <label for="radio-2">否 </label>
					</div>
					<div class="form-inline">
						<table>
							<tr>
								<td><span class="label label-required">品牌logo:</span></td>
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
						<span class="label label-required">品牌介绍:</span>
						<textarea id="intro" name="intro" cols="50" rows="12"
							style="width: 100%; height: 600px; visibility: hidden;"><%=htmlspecialchars(introData)%></textarea>
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

		</div>

	</div>

	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/brand.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript">
 		function createUploader(){ 
 			var businessId = getUrlParam('brandId');
 			if(businessId == null){
 				businessId = $('#id').val();
 			}
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadergoodpc'),
                 action: '<%=basePath%>newUploadFile?businessId='+ businessId,
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
	<script type="text/javascript">
 		KE.show({
			id : 'intro',
		    imageUploadJson : '<%=basePath%>/page/platform/js/plugins/kindeditor/jsp/upload_json.jsp',
			allowFileManager : true,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
				});
			}
		});
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
