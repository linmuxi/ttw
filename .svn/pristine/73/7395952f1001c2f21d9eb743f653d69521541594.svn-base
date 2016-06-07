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
<title>Banner &middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/BannerAction.js"></script>
	<script src="<%=basePath%>dwr/interface/FileStoreAction.js"></script>
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">Banner管理</a> <a class="brand2">修改Banner</a>
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
					<strong>说明</strong> 页面和页面位置以及排序确定banner唯一
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
				<div class="form-actions">
					<div class="form-inline">
						<span class="label label-required">名称:</span> 
						<input type="text" class="medium" id="name" name="name" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">描述:</span> 
						<input type="text" class="medium" id="descript" name="descript" style="width: 50%;"/>
					</div>
					<!-- <div class="form-inline">
						<span class="label label-required">图片URL:</span> 
						<input type="text" class="medium" id="picUrl" name="picUrl" style="width: 50%;"/>
					</div> -->
					<div class="form-inline">
						<span class="label label-required">排序: </span> 
						<input type="text" class="medium" id="sort" name="sort" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">链接地址:</span> 
						<input type="text" class="medium" id="href" name="href" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">所属页面:</span> 
						<input type="text" class="medium" id="page" name="page" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<span class="label label-required">所属页面位置:</span> 
						<input type="text" class="medium" id="pageIdx" name="pageIdx" style="width: 50%;"/>
					</div>
					<div class="form-inline">
						<table>
							<tr>
								<td><span class="label label-required">主图:</span></td>
								<td>
									<div id="uploadergoodpc">
										<noscript>
											Please enable JavaScript to use file uploader.
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
						<label class="label label-submit"></label>
						<input type="hidden" class="medium" id="id" name="id" value="${param.id}"/> 
						<input
							class="btn btn-success" type="button" id="submit" name="submit"
							value="提交" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath%>page/ttw/js/banner/updateBanner.js"></script>
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/page/common/js/fileStore.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	
	<script type="text/javascript">
 		function createUploader(){
 			var businessId = getUrlParam('id');
 			if(businessId == null){
 				businessId = $('#id').val();
 			}
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadergoodpc'),
                 action: '<%=basePath%>newUploadFile?businessId='+ businessId+'&type=bannerImg',
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