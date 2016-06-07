<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	请假单详细
   @author linyong
   @since  2015年6月11日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请假单详细页面</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/VacationRequestAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" role="form" id="vqForm">
				   <input type="hidden" name="person" id="person" />
				   <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">天数：</label>
				      <div class="col-xs-9">
				      	<input type="text" name="days" id="days"  readonly="readonly"/>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">原因：</label>
				      <div class="col-xs-9">
				      	<textarea rows="2" cols="30" id="reason" name="reason" readonly="readonly"></textarea>
				      </div>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		//业务主键
		var id = "${param.id}"; 
		if(isNotEmpty(id)){
			VacationRequestAction.getVacationRequest({id:id},function(data){
        		if(data && data.sucflag){
        			$("#vqForm").fillFormData(data.bean);
        		}
        	});
        }
		
		
		/*****走流程的工单必须定义下面两个方法*****/
		//返回业务表单数据
		function getFormData(){
			return $("#vqForm").serializeObject();
		}
		//返回业务表单key，用于在流程中通过该key获取业务表单值
		/* function getFormKey(){
			return "vacationRequest";
		} */
	</script>
</body>
</html>