<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	业务表单审批
   @author linyong
   @since  2015年6月11日 下午3:04:31
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>流程审批&middot; 淘桃网</title>
</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- role dwr -->
	<script src="<%=basePath%>dwr/interface/ActivitiAction.js"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">流程审批</a> <a class="brand2">业务表单审批</a>
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
					<strong>说明</strong> 业务表单审批
				</div>
				<div id="alerterror" style="display: none;"
					class="alert alert-error">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div class="line-dotted"></div>
				<div class="form-inline">
					<button id="btnback" type="button" class="btn btn-success" onclick="javascript:window.location.href = '<%=basePath%>page/platform/activiti/taskList.jsp';">返回</button>
					<%--
					<input class="btn btn-success" type="button" id="submit" name="submit" value="提交" />
					 --%>
				</div>
				
				<form name="approvalForm" id="approvalForm" role="form">
					<!-- 开始显示用户form表单 -->
					<div class="form-actions">
						<div class="form-inline">
							<span class="label label-required">审批: </span> 
							<input type="radio"
								id="approved" name="approved" value="1" checked="checked" /> <label
								for="radio-1">同意 </label> <input type="radio" id="approved"
								name="approved" value="0" /> <label for="radio-2">不同意</label>
						</div>
						<div class="form-inline">
							<span class="label label-required">意见: </span> 
							<textarea rows="5" cols="200" style="width: 98%;" class="medium" id="opinion" name="opinion"></textarea>
						</div>
						<div class="form-inline">
							<label class="label label-submit"></label> <input type="hidden"
								id="hidgoodsid" name="hidgoodsid" value="" /> <input
								type="hidden" id="hidproductid" name="hidproductid" value=""> <input
								class="btn btn-success" type="button" id="submit" name="submit"
								value="提交" />
						</div>
					</div>
				</form>
				
				<span class="label label-required" style="margin-left: 20px; ">审核数据</span> 
				
				<iframe width="100%" height="100%" frameborder="0" id="bussniessIframe" src="${param.src}"></iframe>
				
			</div>
		</div>

	</div>
	<script type="text/javascript">
		//任务id
		var taskId = "${param.taskId}";
	</script>
	<script type="text/javascript"
		src="<%=basePath%>page/platform/js/activiti/approvalForm.js?2=3"></script>
	
	<%@include file="/page/platform/footer.jsp"%>
</body>
</html>