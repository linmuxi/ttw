<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String id = UUID.randomUUID().toString();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>产品信息管理 &middot; 淘桃网</title>
<style type="text/css">
.layui-layer-title{
	background-color:#165184 !important;
}

.approve-record-table{
	display: table;
	width:100%;
}

.approve-record-table .row{
	display: table-row;  
}

.approve-record-table .cell{
	display: table-cell;
	border-right: 1px solid #999999;
	border-bottom: 1px solid #999999;
	text-align: center;
}

.approve-record-table .header-cell{
	border-top: 1px solid #999999;
	background-color: #3A87AD;
	color:#FFF;
}

.approve-record-table .cell:first-child{
 	border-left:1px solid #999999;
 }
 


</style>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/GoodsAction.js"></script>
	<script src="<%=basePath%>dwr/interface/FileStoreAction.js"></script>
	<script src="<%=basePath%>dwr/interface/ActivitiAction.js"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">产品信息管理</a> <a class="brand2">编辑产品信息 </a>
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
					<strong>说明</strong> 请根据需要编辑产品信息
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
				<input type="hidden" id="pictureUrl" name="pictureUrl"/>
				
				<div class="form-actions">
					<div class="form-inline">
						<span class="label label-required">产品名称:</span> 
						<c:if test="${param.operate }">
						</c:if>
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<input type="text" class="medium" id="goodsName" name="goodsName" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="medium" id="goodsName" name="goodsName"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-inline">
						<span class="label label-required">分类:</span> 
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<select id="goodsCategoryId" disabled="disabled" style="background-color: #eeeeee;">
					        		<option value="">--请选择--</option>
					        	</select>
							</c:when>
							<c:otherwise>
								<select id="goodsCategoryId">
					        		<option value="">--请选择--</option>
					        	</select>
							</c:otherwise>
						</c:choose>
						
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
								id="gatarea" name="gatarea"></select>
						</div>

					</div>
					<div class="form-inline">
						<span class="label label-required">品牌:</span> 
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
					        	<select id="brandId" disabled="disabled" style="background-color: #eeeeee;">
					        		<option value="">--请选择--</option>
					        	</select>
							</c:when>
							<c:otherwise>
								<select id="brandId">
					        		<option value="">--请选择--</option>
					        	</select>
							</c:otherwise>
						</c:choose>
						
					</div>
					<div class="form-inline">
						<span class="label label-required">成本价格: </span> 
						<c:choose>
							<c:when test="${param.operate eq 'view'}">
					        	<input type="text" class="medium" id="cost" name="cost" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:when test="${param.operate eq 'editprice' }">
					        	<input type="text" class="medium" id="cost" name="cost" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="medium" id="cost" name="cost"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-inline">
						<span class="label label-required">销售价格: </span> 
						<c:choose>
							<c:when test="${param.operate eq 'view'}">
					        	<input type="text" class="medium" id="price" name="price" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:when test="${param.operate eq 'editprice' }">
					        	<input type="text" class="medium" id="price" name="price"/>
							</c:when>
							<c:otherwise>
								<span class="label label-info">商管经理负责录入</span>
								<%--
								<input type="text" class="medium" id="price" name="price"/>
								 --%>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-inline">
						<span class="label label-required">会员价格: </span> 
						<c:choose>
							<c:when test="${param.operate eq 'view'}">
					        	<input type="text" class="medium" id="memberPrice" name="memberPrice" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:when test="${param.operate eq 'editprice' }">
					        	<input type="text" class="medium" id="memberPrice" name="memberPrice"/>
							</c:when>
							<c:otherwise>
								<span class="label label-info">商管经理负责录入</span>
								<%--
								<input type="text" class="medium" id="memberPrice" name="memberPrice"/>
								 --%>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-inline">
						<span class="label label-required">数量: </span> 
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<input type="text" class="medium" id="quantity" name="quantity" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="medium" id="quantity" name="quantity"/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-inline">
						<span class="label label-required">单位: </span> 
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<input type="text" class="medium" id="unitName" name="unitName" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="medium" id="unitName" name="unitName"/>
							</c:otherwise>
						</c:choose>
					</div>
					<c:if test="${param.operate ne 'add' }">
						<div class="form-inline">
							<span class="label label-required">新品: </span> 
							
							<c:choose>
								<c:when test="${param.operate eq 'view'}">
									<input type="radio"
									id="isNew" name="isNew" value="1" checked="checked" disabled="disabled"/> <label
									for="radio-1">是 </label> <input type="radio" id="isNew"
									name="isNew" value="0" disabled="disabled"/> <label for="radio-2">否 </label>
								</c:when>
								<c:otherwise>
									<input type="radio"
									id="isNew" name="isNew" value="1" checked="checked" /> <label
									for="radio-1">是 </label> <input type="radio" id="isNew"
									name="isNew" value="0" /> <label for="radio-2">否 </label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="form-inline">
							<span class="label label-required">推荐: </span> 
							
							<c:choose>
								<c:when test="${param.operate eq 'view'}">
									<input type="radio"
									id="recommended" name="recommended" value="1" disabled="disabled"/> <label
									for="radio-1">是 </label> <input type="radio" id="recommended"
									name="recommended" value="0" checked="checked" disabled="disabled"/> <label for="radio-2">否 </label>
								</c:when>
								<c:otherwise>
									<input type="radio"
									id="recommended" name="recommended" value="1"/> <label
									for="radio-1">是 </label> <input type="radio" id="recommended"
									name="recommended" value="0" checked="checked" /> <label for="radio-2">否 </label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="form-inline">
								<span class="label label-required">热销产品: </span> 
								
								<c:choose>
									<c:when test="${param.operate eq 'view'}">
										<input type="radio"
										id="hotsSale" name="hotsSale" value="1" disabled="disabled"/> <label
										for="radio-1">是 </label> <input type="radio" id="hotsSale"
										name="hotsSale" value="0" checked="checked" disabled="disabled"/> <label for="radio-2">否 </label>
								</c:when>
								<c:otherwise>
									<input type="radio"
									id="hotsSale" name="hotsSale" value="1" /> <label
									for="radio-1">是 </label> <input type="radio" id="hotsSale"
									name="hotsSale" value="0" checked="checked"/> <label for="radio-2">否 </label>
								</c:otherwise>
							</c:choose>
						</div>
					
						<%-- 
						<div class="form-inline">
							<span class="label label-required">上架: </span> 
							<input type="radio"
								id="isSpecificationsOpen" name="isSpecificationsOpen" value="1" checked="checked" /> <label
								for="radio-1">是 </label> <input type="radio" id="isSpecificationsOpen"
								name="isSpecificationsOpen" value="0" /> <label for="radio-2">否 </label>
						</div>
						--%>
						<div class="form-inline">
							<span class="label label-required">排序: </span> 
							
							<c:choose>
								<c:when test="${param.operate eq 'view'}">
									<input type="text" class="medium" id="sort" name="sort" readonly="readonly" style="background-color: #eeeeee;"/>
								</c:when>
								<c:otherwise>
									<input type="text" class="medium" id="sort" name="sort"/>
								</c:otherwise>
							</c:choose>
						</div>
					</c:if>
					<div class="form-inline">
						<span class="label label-required">关键字: </span> 
						
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<input type="text" class="medium" id="keywordName" name="keywordName" readonly="readonly" style="background-color: #eeeeee;"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="medium" id="keywordName" name="keywordName"/>
							</c:otherwise>
						</c:choose>
					</div>
					<c:if test="${param.operate eq 'editprice' }">
					<div class="form-inline">
						<table width="100%">
							<tr>
								<td width="10%"><span class="label label-required">商品资料范本: </span> </td>
								<td width="80%">
									<div id="uploaderGoodsFileInfo">
										<noscript>
											Please enable JavaScript to use file uploader.
										</noscript>
									</div>
									
									
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>
									<div id="uploadFileTriggers" style="padding-left:8px; width: 450px; line-height:30px; margin-bottom:5px; display:none;">
									</div>
								</td>
							</tr>
						</table>
						
					</div>
					</c:if>

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
						<span class="label label-required">操作:</span> 
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								
							</c:when>
							<c:otherwise>
								<input class="btn btn-success" type="button" id="delpc" name="delpc" value="删除所选图片" />
							</c:otherwise>
						</c:choose>
					</div>
					
					<c:if test="${param.operate eq 'view' }">
						<div class="form-inline">
							<span class="label label-required">审批记录:</span> 
							<a href="javascript:void(0);" id="open_approve_record_id">点击查看审批记录</a>
						</div>
						<div class="approve-record-table" style="display: none;">
							<div class="row">
								<div class="cell header-cell">审批时间</div>
								<div class="cell header-cell">审批意见</div>
							</div>
						</div>
					</c:if>
					
					<div class="form-inline">
						<span class="label label-required">商品介绍:</span>
						
						<c:choose>
							<c:when test="${param.operate eq 'view' || param.operate eq 'editprice' }">
								<input type="hidden" id="intro"/>
								<div id="introView"></div>
							</c:when>
							<c:otherwise>
								<textarea id="intro" name="intro" cols="50" rows="12"
									style="width: 100%; height: 600px; visibility: hidden;"></textarea>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="form-inline">
						<c:choose>
							<c:when test="${param.operate eq 'view'}">
					        	
							</c:when>
							<c:when test="${param.operate eq 'editprice' }">
					        	<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="submit" name="submit"
								value="提交" /> <input class="btn btn-success" type="button"
								id="update" name="update" value="更新" style="display: none;" />
							</c:when>
							<c:otherwise>
								<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="submit" name="submit"
								value="提交" /> <input class="btn btn-success" type="button"
								id="update" name="update" value="更新" style="display: none;" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

		</div>

	</div>
	
	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/goods.js"></script>
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/page/common/js/fileStore.js"></script>
		
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	<script type="text/javascript">
 		function createUploader(){ 
 			var businessId = getUrlParam('goodsId');
 			if(businessId == null){
 				businessId = $('#id').val();
 			}
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadergoodpc'),
                 action: '<%=basePath%>newUploadFile?businessId='+ businessId+'&type=goodsImg',
                 debug: true,
                 minSizeLimit:1024,
                 sizeLimit: 1073741824,
                 allowedExtensions: ['jpeg','jpg','gif','png'],
                 onComplete: function(id, fileName, responseJSON){
						var pcpath = responseJSON.success;
						var fileStoreId = responseJSON.fileStoreId;
						var htm = "<img id='"+id+"' src='<%=basePath%>"+pcpath+"' rel='#"+fileName+"'/>";
						var checkpc = "<input id='"+id+"' name='pcpath' type='checkbox' value='"+fileStoreId+"' pcpath='"+pcpath+"'/> ";
						
						//判断是否有上传的图片，为空表示第一次上传
						if($("#pictureUrl").val() == ""){
							$("#pictureUrl").val(pcpath);
						}
						$("#triggers").append(htm).append(checkpc);
					}
			});
			
		}
 		
		
		function uploaderGoodsFileInfo(){
			var businessId = getUrlParam('goodsId');
 			if(businessId == null){
 				businessId = $('#id').val();
 			}
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploaderGoodsFileInfo'),
                 action: '<%=basePath%>newUploadFile?businessId='+ businessId+'&type=goodsFileInfo',
                 debug: true,
                 minSizeLimit:1024,
                 sizeLimit: 1073741824,
                 allowedExtensions: ['xls','xlsx','rar','zip'],
                 onComplete: function(id, fileName, responseJSON){
						var pcpath = responseJSON.success;
						var fileStoreId = responseJSON.fileStoreId;
						//var htm = "<img id='"+id+"' src='${ctx}/"+pcpath+"' rel='#"+fileName+"'/>";
						//var checkpc = "<input id='"+id+"' name='pcpath' type='checkbox' value='"+fileStoreId+"' /> ";
						//判断是否有上传的图片，为空表示第一次上传
						//if($("#fileUrl").val() == ""){
						//	$("#fileUrl").val(pcpath);
						//}
						//$("#triggers").append(htm).append(checkpc);
						$("#uploadFileTriggers").css('display','block');
						//var closeText = "<a href='javascript:void(0);'>x</a>";
						var uploadContent = fileName + "&nbsp;上传成功";
						//uploadContent += "<span style='float:right; margin-right:10px;'>"+closeText+"</span>";
						$("#uploadFileTriggers").append(uploadContent);
						
						loadGoodsFileInfo("uploadFileTriggers", businessId, "goodsFileInfo");
					},
			});
			$('.qq-upload-button').css('width','100px');
			$('#uploadTitle').text('上传附件');
		}
		
		$(function(){
			
			<c:if test="${param.operate eq 'edit' || param.operate eq 'add'}">
			createUploader();
			</c:if>
			
			<c:if test="${param.operate eq 'editprice' }">
			uploaderGoodsFileInfo();
			</c:if>
			
		})
	</script>
	<c:if test="${param.operate eq 'edit' || param.operate eq 'add'}">
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
 	</c:if>
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>
