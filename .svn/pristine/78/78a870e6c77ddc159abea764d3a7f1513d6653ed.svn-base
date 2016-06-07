<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	流程定义管理
   @author linyong
   @since  2015年6月11日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程定义管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/ActivitiAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="processDefinitionGrid" class="table table-condensed table-hover table-striped" style="width: 1300px;">
					    <thead>
					        <tr>
					            <th data-column-id="deploymentId" data-visible="false">部署ID</th>
					            <th data-column-id="id" data-sortable="false">流程定义ID</th>
					            <th data-column-id="version" data-sortable="false">版本</th>
					            <th data-column-id="category" data-sortable="false">类别</th>
					            <th data-column-id="name" data-sortable="false">流程名称</th>
					            <th data-column-id="key" data-sortable="false">key</th>
					            <th data-column-id="deploymentName" data-sortable="false">部署名称</th>
					            <th data-column-id="deploymentTime" data-formatter="date" data-sortable="false">部署时间</th>
					            <!-- <th data-column-id="suspensionState" data-sortable="false">是否暂停</th> -->
					            <th data-column-id="description" data-sortable="false">描述</th>
	         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
					        </tr>
					    </thead>     
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="pdModel" tabindex="-1" 
	   aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="pdTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="420px" frameborder="0" id="pdIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/processDefinitionList.js?1=3"></script>
</body>
</html>