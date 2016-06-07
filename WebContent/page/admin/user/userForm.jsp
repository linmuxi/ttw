<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	用户编辑页面
   @author linyong
   @since  2015年5月17日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户编辑</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysUserAction.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">  
				<form class="form-horizontal" role="form" id="userForm">
				   <div class="form-group">
			         <input type="hidden" id="userId" name="userId" value="${param.userId}"/>
				      <label for="firstname" class="col-xs-3 control-label text-right">所属部门：</label>
				      <div class="col-xs-9"> 
				        <!-- <span id="orgId"></span> -->
				        <select id="orgId" name="orgId"></select>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="userName" class="col-xs-3 control-label text-right">用户名：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="userName" name="userName" 
				            placeholder="请输入用户名" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="account" class="col-xs-3 control-label text-right">帐号：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="account" name="account" 
				            placeholder="请输入帐号" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="password" class="col-xs-3 control-label text-right">密码：</label>
				      <div class="col-xs-9"> 
				         <input type="text" class="form-control" id="password" name="password" 
				            placeholder="请输入密码" /> 
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="" class="col-xs-3 control-label text-right"></label>
				      <div class="col-xs-9"> 
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="enabled" id="enabled" checked />是否可用
				            </label>
				         </div>
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="accountNonExpired" id="accountNonExpired" checked/>是否未过期
				            </label>
				         </div>
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="accountNonLocked" id="accountNonLocked" checked/>是否未锁定
				            </label>
				         </div>
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="credentialsNonExpired" id="credentialsNonExpired" checked/>是否未失效
				            </label>
				         </div>
				      </div>
				   </div>
				   <div class="form-group text-right">
				      <button class="btn btn-primary" type="button" id="userFormBtn">提交</button>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var userId = "${param.userId}"; 
	</script>
	<script type="text/javascript" src="${ctx}/page/admin/js/user/userForm.js"></script>
</body>
</html>