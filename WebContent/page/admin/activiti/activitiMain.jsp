<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
		   <div class="col-sm-2 col-md-2 cursor" onclick="forward('${ctx}/page/admin/activiti/processDefinitionList.jsp');">
		      <div class="thumbnail">
		         <img src="${ctx}/page/common/images/kittens.jpg" 
		         alt="流程定义管理">
		      </div>
		      <div class="caption">
		         <h4 class="text-center">流程定义管理</h4>
		      </div>
		   </div>
		   <div class="col-sm-2 col-md-2 cursor" onclick="forward('${ctx}/page/admin/activiti/taskList.jsp');">
		      <div class="thumbnail">
		         <img src="${ctx}/page/common/images/kittens.jpg" 
		         alt="我的待办任务">
		      </div>
		      <div class="caption">
		         <h4 class="text-center">我的待办任务</h4>
		      </div>
		   </div>
		   <div class="col-sm-2 col-md-2 cursor" onclick="forward('${ctx}/page/admin/activiti/formProcessList.jsp');">
		      <div class="thumbnail">
		         <img src="${ctx}/page/common/images/kittens.jpg" 
		         alt="表单流程管理">
		      </div>
		      <div class="caption">
		         <h4 class="text-center">表单流程管理</h4>
		      </div>
		   </div>
		   <div class="col-sm-2 col-md-2 cursor" onclick="forward('${ctx}/page/admin/activiti/vacationRequest.jsp');">
		      <div class="thumbnail">
		         <img src="${ctx}/page/common/images/kittens.jpg" 
		         alt="请假流程测试">
		      </div>
		      <div class="caption">
		         <h4 class="text-center">请假流程测试</h4>
		      </div>
		   </div>
		</div>
	</div>
</body>
</html>