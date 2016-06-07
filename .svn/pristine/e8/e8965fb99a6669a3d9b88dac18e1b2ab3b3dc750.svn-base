<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	角色列表
   @author linyong
   @since  2015年5月17日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysRoleAction.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<table id="roleGrid" class="table table-condensed table-hover table-striped" >
				    <thead>
				        <tr>
				            <th data-column-id="roleId" data-visible="false">ID</th>
				            <th data-column-id="roleName">角色名称</th>
				            <th data-column-id="roleDesc">角色描述</th>
				            <th data-column-id="enable" data-formatter="enable">是否可用</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
	</div>
	
	<!-- 角色编辑 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="roleForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="roleFormTitle"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form" id="roleForm">
				   <div class="form-group">
			         <input type="hidden" id="roleId" name="roleId" >
				      <label for="firstname" class="col-sm-3 control-label">角色名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="roleName" name="roleName" 
				            placeholder="请输入名字">
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">角色描述：</label>
				      <div class="col-sm-9">
    					 <textarea class="form-control" rows="3" placeholder="请输入描述"
    					 id="roleDesc" name="roleDesc" ></textarea>   
				      </div>
				   </div>
				   <div class="form-group">
				      <div class="col-sm-offset-3 col-sm-9">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="enable" id="enable" checked="checked"> 是否可用
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
	            <button type="button" class="btn btn-primary" id="btn_role_submit">提交</button>
	         </div>
	      </div>
		</div>
	</div>
	
	<!-- 权限操作 -->
	<div class="modal fade" id="roleAuth" tabindex="-1" 
	   aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="roleAuthTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="420px" frameborder="0" id="roleAuthIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
</body>
<!-- 角色列表js文件 -->
<script type="text/javascript" src="${ctx}/page/admin/js/role/roleList.js?1=2"></script>
</html>