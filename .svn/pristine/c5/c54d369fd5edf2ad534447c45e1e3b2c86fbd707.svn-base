<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>会员信息 &middot; 淘桃网</title>
</head>
<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<%@include file="/page/platform/header.jsp"%>
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
			<a class="brand2">会员基本信息</a>
		</div>
	</div>
	<div class="container-fluid containerb">
		<div class="row-fluid">
			<div class="span2">
				<%@include file="/page/platform/left.jsp"%>
			</div>
			<div class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明!</strong> 这里显示了会员的详情信息
				</div>
				<div class="btn-group">
						<button id="btnback" type="button" class="btn btn-success">返回</button>
					</div>
				<div class="line-dotted"></div>
				<p class="text-left text-info">
					登陆信息
				</p>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="width:25%">
								登陆账号 
							</th>
							<th style="width:25%">
								最后登陆时间
							</th>
							<th style="width:25%">
								最后登陆IP地址
							</th>
							<th style="width:25%">
								是否可用 
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								${user.account}(${member.rankName})
							</td>
							<td>
								<fmt:formatDate value="${user.lastLoginDate}" type="both"/>
							</td>
							<td>
								${user.lastLoginIp}
							</td>
							<td>
								${user.enabled=='1'?'可用':'不可用'}
							</td>
						</tr>
					</tbody>
				</table>
				<p class="text-left text-info">
					基本信息
				</p>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th style="width:25%">
								会员名称
							</th>
							<th style="width:25%">
								出生日期
							</th>
							<th style="width:25%">
								性别
							</th>
							<th style="width:25%">
								手机号码
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								${member.name}
							</td>
							<td>
								${member.birth}
							</td>
							<td>
								<c:if test="${not empty member.name}">
									${member.gender=='0'?'女':'男'}
								</c:if>
							</td>
							<td>
								${member.mobile}
							</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th colspan="4">
								地址
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">
								${member.address}
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<div class="line-dotted"></div>
<%@include file="/page/platform/footer.jsp"%>
</body>
</html>