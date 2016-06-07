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
<title>数据字典&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
	<script src="${ctx}/page/common/js/utils/jquery_extend.js"></script>
	<script type="text/javascript" src="${ctx}/page/platform/js/plugins/uploader/fileuploader.js"></script>
	<script src="${ctx}/page/common/js/loadmask/jquery.loadmask.js"></script>
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/SysDictAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">数据字典管理</a> <a class="brand2">编辑数据字典信息 </a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<%-- <div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div> --%>

			<div id="mainlogic" class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明</strong> 请根据需要编辑数据字典
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
				<!-- <div class="btn-group">
					<input class="btn btn-success" type="button" id="btn_add_row"
							name="btn_add_row" value="增加数据字典" />
				</div> -->
				

				<!-- <div id="dictForm" class="form-actions"> -->
				<form class="form-horizontal" role="form" id="userForm">
				
				<div class="form-inline">
						<input type="radio" id="valueDefaultType1" name="defaultValueType" value="1" checked="checked"  onclick="hideDiv(this)"/> <labelfor="defaultValueType1">文本 </label> 
						<input type="radio" id="valueDefaultType2" name="defaultValueType" value="0"  onclick="hideDiv(this)"/> <label for="defaultValueType2">图片 </label>
				</div>
				
				<div class="form-inline">
						<input type="hidden"  class="form-control" id = "id" name="id"  value="${result.id }">
				</div>
				
				
				<div class="form-inline">
						<span class="label label-required">数据字典类型: </span> 
						<input type="text" class="form-control" id = "type" name="type" placeholder="请输入数据字典类型" value="${result.type }" >
				</div>
				
				
				<div class="form-inline">
						<span class="label label-required">数据字典键: </span> 
						<input type="text" class="form-control" id = "defaultKey" name="defaultKey" placeholder="请输入数据字典键" value="${result.defaultKey }" >
				</div>
				
				<div class="form-inline">
						<span class="label label-required">数据字典值: </span> 
						<input type="text" class="form-control" id = "defaultValue" name="defaultValue" placeholder="请输入数据字典值" value="${result.defaultValue }" >
				
						
						<div id = "defaultValueImage" style="display: none"><div  class="label label-required" style="display: none">上传图片</div>
							<input type="hidden" class="form-control" id = "defaultValue" name="defaultValue" placeholder="请输入数据字典值"  >
							<table>
										<tr>
											<td>
												<div id="triggers"></div>
											</td>
										</tr>
										<tr>
											<td>
												<div id="uploadmemberpc"></div>
											</td>
										</tr>
							</table>
					</div>
			
				</div>
				
				
				<div class="form-inline">
						<span class="label label-required">排序: </span> 
						<input type="text" class="form-control" id = "sort" name="sort" placeholder="请输入排序" value="${result.sort }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">扩展字段1: </span> 
						<input type="text" class="form-control" id = "expand1" name="expand1" placeholder="请输入扩展字段1" value="${result.expand1 }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">扩展字段2: </span> 
						<input type="text" class="form-control" id = "expand2" name="expand2" placeholder="请输入扩展字段2" value="${result.expand2 }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">扩展字段3: </span> 
						<input type="text" class="form-control" id = "expand3" name="expand3" placeholder="请输入扩展字段3" value="${result.expand3 }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">扩展字段4: </span> 
						<input type="text" class="form-control" id = "expand4" name="expand4" placeholder="请输入扩展字段4" value="${result.expand4 }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">扩展字段5: </span> 
						<input type="text" class="form-control" id = "expand5" name="expand5" placeholder="请输入扩展字段5" value="${result.expand5 }">
				</div>
				
				<div class="form-inline">
						<span class="label label-required">描述: </span> 
						<textarea rows="5" cols="200" class="medium" id="remark" name="remark" style="width: 50%;">${result.remark }</textarea>
				</div>
					
					<div class="form-inline">
						<label class="label label-submit"></label> <input
							class="btn btn-success" type="button" id="submitattrs"
							name="submitattrs" value="提交" /> <input class="btn btn-success"
							type="button" id="btn_submit" name="btn_submit" value="更新"
							style="display: none;" />
					</div>
				</form>
				</div>

			</div>

		</div>

	<!-- </div> -->

	
	<script type="text/javascript" src="<%=basePath%>page/platform/js/dict/dict.js"></script>
	<script type="text/javascript">
			//数据字典数据类型选中
			var defaultValueType = "${result.defaultValueType}";//数据字典数据类型
			var defaultValue = "${result.defaultValue}";//数据字典数据值
			var operate = "${operate}";
			if("" !=defaultValueType && defaultValueType != null){
				if(defaultValueType == "0"){
					$("input[type=radio][name=defaultValueType][value=0]").attr("checked",true);
					$("input[id^='defaultValue']").hide();
					
				}else if(defaultValueType == "1"){
					$("input[type=radio][name=defaultValueType][value=1]").attr("checked",true);
					$("input[id^='defaultValue']").show();
					$("div[id^='defaultValueImage']").hide();
				}
			}
			
			if(operate == "edit"){
				$("#type").attr("disabled",true);
				$("#defaultKey").attr("disabled",true);
			}
		
		var defaultValueTypeSelect= $('input:radio[name=defaultValueType]:checked').val();
		if("" !=defaultValue && defaultValue != null && defaultValueTypeSelect == "0"){
			var htm = "<img id='imgId' src='"+defaultValue+"' class='float-left' border='1' alt='上传图片' width='110' height='130' />";
			$("#defaultValue").val(defaultValue);
			$("#triggers").append(htm);
			$("div[id^='defaultValueImage']").show();
		}else{
				var htm = "<img id='imgId' src='${ctx}/upload/member/default.png' class='float-left' border='1' alt='上传图片' width='110' height='130' />";
				$("#defaultValue").val('${ctx}/upload/member/default.png');
				$("#triggers").append(htm);
		}
		 
		//文本值和图片的显示和隐藏
		function hideDiv(val){
			var value = $(val).val();
			 if(value == "1"){
				$("input[id^='defaultValue']").show();
				$("div[id^='defaultValueImage']").hide();
			}else{
				$("input[id^='defaultValue']").hide();
				$("div[id^='defaultValueImage']").show();
			} 
		}
		
		
 		function createUploader(){
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadmemberpc'),
                 action: '${ctx}'+'/uploadDictImg',
                 debug: true,
                 multiple: false,
                 minSizeLimit:1024,
                 sizeLimit: 1073741824,
                 allowedExtensions: ['jpg','png'],
                 onComplete: function(id, fileName, responseJSON){
							var pcpath = responseJSON.success;
							$("#imgId").attr("src",'${ctx}'+pcpath);
							$("#defaultValue").val('${ctx}'+pcpath);
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
