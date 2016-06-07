<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	模块编辑页面
   @author linyong
   @since  2015年6月11日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模块编辑</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysModuleAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">  
				<form class="form-horizontal" role="form" id="moduleForm">
		           <input type="hidden" id="moduleId" name="moduleId" value="${param.moduleId}" />
				   <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">父节点：</label>
				      <div class="col-xs-9">
				        <select id="parent" name="parent"></select>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="moduleName" class="col-xs-3 control-label text-right">模块名称：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="moduleName" name="moduleName" 
				            placeholder="请输入模块名称" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="moduleType" class="col-xs-3 control-label text-right">模块类型：</label>
				      <div class="col-xs-9">
				      	<label class="radio-inline">
						  <input type="radio" name="moduleType" id="moduleType1" value="1" checked="checked">管理模块
						</label>
						<label class="radio-inline">
						  <input type="radio" name="moduleType" id="moduleType2" value="2">页面模块
						</label>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="moduleUrl" class="col-xs-3 control-label text-right">模块URL：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="moduleUrl" name="moduleUrl" 
				            placeholder="请输入URL" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="priority" class="col-xs-3 control-label text-right">优先级：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="priority" name="priority" 
				            placeholder="请输入优先级" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="moduleDesc" class="col-xs-3 control-label text-right">模块描述：</label>
				      <div class="col-xs-9"> 
				         <textarea class="form-control" id="moduleDesc" name="moduleDesc" 
				            placeholder="请输入描述" ></textarea>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="enabled" class="col-xs-3 control-label text-right"></label>
				      <div class="col-xs-9"> 
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="enable" id="enable" checked />是否可用
				            </label>
				         </div>
				      </div>
				   </div>
				   <div class="form-group text-right">
				      <button class="btn btn-primary" type="button" id="moduleFormBtn">提交</button>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var moduleId = "${param.moduleId}"; 
	</script>
	<script type="text/javascript" src="${ctx}/page/admin/js/module/moduleForm.js"></script>
</body>
</html>