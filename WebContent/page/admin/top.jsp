<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="menu" uri="/WEB-INF/tld/menu.tld" %>
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container-fluid">
	   <div class="navbar-header">
	   	 <button type="button" class="navbar-toggle" data-toggle="collapse" 
	         data-target="#navbar">
	         <span class="sr-only">切换导航</span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	         <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/page/admin/index">淘桃网管理平台</a>
	   </div>
 	   <div class="collapse navbar-collapse" id="navbar">
	      <ul class="nav navbar-nav">
	         <menu:markMenu moduleList="${moduleList}" />
	      </ul>
	      <%-- <p class="navbar-text navbar-right" style="margin-right: 10px;">
	      	<a href="${pageContext.request.contextPath}/page/logout?type=0" class="navbar-link">退出</a>
	      </p> --%>
	      <div class="navbar-text navbar-right">
	      		欢迎你：
				<div class="btn-group" style="margin-right: 15px;">
					<button type="button"
						class="btn btn-primary btn-xs dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						${SPRING_SECURITY_CONTEXT.authentication.principal.username} <span
							class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">个人资料</a></li>
						<li><a href="#">修改密码</a></li>
						<li><a href="javascript:void(0);" onclick="toModule('/page/admin/activiti/myTaskList.jsp')">我的待办任务</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="${ctx}/page/logout?type=0">退出</a></li>
					</ul>
				</div>
			</div>
	   </div>
	</div>
</nav>
<script>
function toModule(url){
	if(url == undefined || url == null || url.toUpperCase() == 'NULL' || url.trim() == ''){
		return;
	}
	//window.location.href=webRoot+url;
	$("#mainIframe").attr("src",webRoot+url);
}
</script>