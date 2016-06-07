<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	流程测试-请假流程
   @author linyong
   @since  2015年6月11日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>流程测试-请假流程</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/VacationRequestAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="vacationRequestGrid" class="table table-condensed table-hover table-striped">
					    <thead>
					        <tr>
					            <th data-column-id="person">申请人</th>
					            <th data-column-id="reason">原因</th>
					            <th data-column-id="days">天数</th>
					            <th data-column-id="status" data-formatter="status" >处理状态</th>
					        </tr>
					    </thead>     
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="vacationRequestModel" tabindex="-1"  aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="vacationRequestTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="100%" frameborder="0" id="vacationRequestIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/page/admin/js/activiti/vacationRequest.js"></script>
</body>
</html>