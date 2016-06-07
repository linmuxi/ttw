<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	模块列表
   @author linyong
   @since  2015年6月11日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模块列表页面</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysModuleAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-2">
				<ul id="manageModuleTree" class="ztree"></ul>
			</div>
			<div class="col-xs-10">
				<div class="table-responsive">
					<table id="pageModuleGrid" class="table table-condensed table-hover table-striped" style="width: 1100px;" >
					    <thead>
					        <tr>
					            <!-- <th data-column-id="userId">ID</th> -->
					            <th data-column-id="moduleName">模块名称</th>
					            <th data-column-id="moduleDesc">模块说明</th>
					            <th data-column-id="moduleUrl">模块地址</th>
					            <th data-column-id="enable" data-formatter="enable">是否可用</th>
					            <th data-column-id="createDate" data-formatter="date">创建日期</th>
	         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
					        </tr>
					    </thead>     
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 模块编辑弹出框 -->
	<div class="modal fade" id="moduleFormModel" tabindex="-1" 
	  aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="moduleFormTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="420px" frameborder="0" id="moduleFormIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/page/admin/js/module/moduleList.js"></script>
</body>
</html>