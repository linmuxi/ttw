<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	业务表单流程编辑页面
   @author linyong
   @since  2015年6月11日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务表单流程编辑页面</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/FormProcessAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" role="form" id="fpForm">
			       <input type="hidden" id="id" name="id" value="${param.id}"/>
				   <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">业务表单名称：</label>
				      <div class="col-xs-9">
				         <input type="text" class="form-control" id="formName" name="formName" 
				            placeholder="请输入业务表单名称" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">流程定义名称：</label>
				      <div class="col-xs-9">
				        <select id="prodefId" name="prodefId"></select>
				      </div>
				   </div>
				   <div class="form-group text-right">
				      <button class="btn btn-primary" type="submit" id="fpFormBtn">提交</button>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var id = "${param.id}"; 
	</script>
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/formProcessForm.js"></script>
</body>
</html>