<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	业务表单审批
   @author linyong
   @since  2015年6月11日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务表单审批</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/ActivitiAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<iframe width="100%" height="100%" frameborder="0" id="bussniessIframe" src="${param.src}"></iframe>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" role="form" id="approvalForm">
				   <div class="form-group">
				      <label for="" class="col-xs-3 control-label text-right"></label>
				      <div class="col-xs-9">
				      	<label class="radio">
						  <input type="radio" name="approved" id="approved_yes" value="1">同意
						</label>
						<label class="radio">
						  <input type="radio" name="approved" id="approved_no" value="0">不同意
						</label>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="opinion" class="col-xs-3 control-label text-right">审批意见：</label>
				      <div class="col-xs-9"> 
				         <textarea rows="2" cols="40" id="opinion" name="opinion"></textarea>
				      </div>
				   </div>
				   <div class="form-group text-right">
				      <button class="btn btn-primary" type="button" id="approvalFormBtn">提交</button>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//任务id
		var taskId = "${param.taskId}";
	</script>
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/approvalForm.js"></script>
</body>
</html>