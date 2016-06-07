<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>供应商密码修改页面 &middot; 淘桃网</title>
</head>
<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<%@include file="/page/platform/header.jsp"%>
	<script src="<%=basePath%>dwr/interface/SupplierAction.js"></script>
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
			<a class="brand2">账户密码修改</a>
		</div>
	</div>
	<div class="container-fluid containerb">
		<div class="row-fluid">
			<div class="span2">
				<a href="#" class="thumbnail"><img
					src="<%=basePath%>/page/platform/ui/assets/img/user.png" alt="" class="caption"> </a>
				<div class="well well-small smallt">
					<h4> ${SPRING_SECURITY_CONTEXT.authentication.principal.username}，你好！</h4>
					<p>
						欢迎您来到<br />淘桃网
					</p>
					<button class="btn btn-block btn-primary" type="button" id="myTaskList">我的工作</button>
				</div>
				<div class="line-dotted"></div>
				<%@include file="/page/platform/left.jsp"%>
			</div>
			<div class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明!</strong> 这里修改您的账户密码
				</div>
				<div class="line-dotted"></div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div class="form-actions">
					<input type="hidden" value="${SPRING_SECURITY_CONTEXT.authentication.principal.account}" id ="account" >
					<table style="width: 320px; margin: 40px auto;">
					  <tr>
            				<th >原密码:</th>
            				<td>
                				<span class="tbl-txt">
                					<input id="oldpass" class="input-style" size="30" maxlength="30" name="oldpass" type="password" />
                				</span>
            				</td>
        				 </tr>
       				 <tr>
            				<th >新密码:</th>
            				<td>
                				<span class="tbl-txt">
                					<input id="pass" class="input-style" size="30" maxlength="30" name="pass" type="password" />
                				</span>
            				</td>
        				</tr>
        				<tr>
            				<th >确认新密码:</th>
            				<td>
                				<span class="tbl-txt">
                					<input id="repass" class="input-style" size="30" maxlength="30" name="repass" type="password" />
                				</span>
            				</td>
        				</tr>
       				<tr>
            				<th>
            				</th>
            				<td id="level" class="pw-strength">
	                			<div class="pw-bar"></div>
	                			<div class="pw-bar-on"></div>
	                			<div class="pw-txt"><span>弱</span> <span>中</span> <span>强</span></div>
            				</td>
        				</tr>
    					</table>
				</div>
				<div style="margin: auto;">
	    				<input class="btn btn-success" type="button" id="submit" name="submit"value="提交" />
	    				&nbsp;
	    				<input class="btn btn-success" type="button" id="resert" value="重置" />
    			</div>
			</div>
		</div>
	</div>
<div class="line-dotted"></div>
<script type="text/javascript" src="<%=basePath%>page/ttw/js/supplier/supplierUpdatePwd.js"></script>
<%@include file="/page/platform/footer.jsp"%>
</body>
</html>