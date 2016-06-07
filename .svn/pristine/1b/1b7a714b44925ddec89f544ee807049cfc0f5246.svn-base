<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	业务表单流程配置列表
   @author linyong
   @since  2015年6月11日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务表单流程配置列表</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/FormProcessAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="formProcessGrid" class="table table-condensed table-hover table-striped">
					    <thead>
					        <tr>
					            <th data-column-id="id" data-visible="false">ID</th>
					            <th data-column-id="formName">业务表单名称</th>
					            <th data-column-id="prodefName">流程定义名称</th>
         				    	<th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
					        </tr>
					    </thead>     
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="fpModel" tabindex="-1" 
	   aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="fpTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="100%" frameborder="0" id="fpIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/formProcessList.js?1=2"></script>
</body>
</html>