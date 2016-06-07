<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	部门列表
   @author wanglong
   @since  2015年5月29日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysDepartmentAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table id="grid-data" class="table table-condensed table-hover table-striped" >
				    <thead>
				        <tr>
				            <!-- <th data-column-id="departmentId" style="width: 300px;background-color: red;">ID</th>  --> 
				           	<th data-column-id="orgName">部门名称</th>
				           	<th data-column-id="parentId">上级部门</th>
				            <th data-column-id="orgRemark">备注</th>
				            <th data-column-id="isDel" data-formatter="isDel">是否可用</th>
				            <th data-column-id="lastUpdateDate"  data-formatter="dateFormat">最后修改时间</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
	</div>
	
	<!-- 部门编辑 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="departmentForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="departmentForm"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form">
				   <div class="form-group">
				   	<input type="hidden" id="departmentId" name="departmentId"/>
				      <label for="firstname" class="col-sm-3 control-label">部门名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="orgName" name="orgName" 
				            placeholder="请输入名称">
				      </div>
				   </div>
				   
				   
				
				 <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">上级部门：</label>
				      <div class="col-sm-9">
    					 <select id="parent" >
						</select>
				      </div>
				   </div>
				
				   
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">备注：</label>
				      <div class="col-sm-9">
    						 <textarea class="form-control" rows="3" placeholder="请输入描述"
    					 id="orgRemark" name="orgRemark" ></textarea>   
				   </div>
				   </div>
			
			 	<div class="form-group">
				      <div class="col-sm-offset-3 col-sm-9">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="isDel" id="isDel" checked="checked"> 是否可用
				            </label>
				         </div>
				      </div>
				   </div>
				</form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary" id="btn_department_submit">提交</button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
<!-- 部门列表js文件 -->
<script type="text/javascript" src="${ctx}/page/admin/js/department/departmentList.js"></script>
</body>
</html>