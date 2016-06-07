<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	用户列表
   @author linyong
   @since  2015年5月17日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表页面</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysUserAction.js"></script>
<script src="${ctx}/dwr/interface/SysDepartmentAction.js"></script>
</head>
<body>
	<div class="container" style="width: 100%;">
		<div class="row">
			<div class="col-xs-2">
				<ul id="departMentTree" class="ztree"></ul>
			</div>
			<div class="col-xs-10">
				<div class="table-responsive">
				<table id="userGrid" class="table table-condensed table-hover table-striped" style="width: 1200px;" >
				    <thead>
				        <tr>
				            <!-- <th data-column-id="userId">ID</th> -->
				            <th data-column-id="username">用户名称</th>
				            <th data-column-id="account">帐号</th>
				            <th data-column-id="lastLoginIp">最后登录IP</th>
				            <th data-column-id="lastLoginDate" data-formatter="date">最后登录日期</th>
				            <th data-column-id="orgName">所属部门名称</th>
				            <th data-column-id="enabled">可用</th>
				            <th data-column-id="accountNonExpired">未过期</th>
				            <th data-column-id="accountNonLocked">未锁定</th>
				            <th data-column-id="credentialsNonExpired">未失效</th>
				            <th data-column-id="createDate" data-formatter="date">创建日期</th>
				            <th data-column-id="logoutDate" data-formatter="date">注销日期</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="userModel" tabindex="-1" 
	   aria-labelledby="roleForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="userFormTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="420px" frameborder="0" id="userFormIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	<script type="text/javascript" src="${ctx}/page/admin/js/user/userList.js"></script>
</body>
</html>