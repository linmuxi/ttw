<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	我的待办任务列表
   @author linyong
   @since  2015年6月11日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的待办任务列表</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="myTaskGrid" class="table table-condensed table-hover table-striped">
					    <thead>
					        <tr>
					            <th data-column-id="id" data-sortable="false">任务ID</th>
					            <th data-column-id="name" data-sortable="false">任务名称</th>
					            <th data-column-id="processDefinitionName" data-sortable="false">流程名称</th>
					            <th data-column-id="priority" data-sortable="false">优先级</th>
					            <th data-column-id="createTime" data-formatter="date" data-sortable="false">创建时间</th>
					            <%-- <th data-column-id="dueDate" data-formatter="date" data-sortable="false">失效日期</th>--%>
					            <th data-column-id="description" data-sortable="false">描述</th>
	         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
					            <th data-column-id="businessId" data-visible="false">业务表单主键ID</th>
					            <th data-column-id="formKey" data-visible="false">业务表单URL</th>
					            <th data-column-id="processDefinitionId" data-visible="false">流程定义id</th>
					        </tr>
					    </thead>     
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="taskModel" tabindex="-1" 
	   aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="taskTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="100%" frameborder="0" id="taskIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/taskList.js?1=2"></script>
</body>
</html>