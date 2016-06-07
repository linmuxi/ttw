<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>账户基本信息 &middot; 淘桃网</title>
</head>
<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<%@include file="/page/platform/header.jsp"%>
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
			<a class="brand2">账户基本信息</a>
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
					<strong>说明!</strong> 这里显示了供应商的详情信息
				</div>
				<!-- <div class="btn-group">
						<button id="btnback" type="button" class="btn btn-success">返回</button>
					</div> -->
				<div class="line-dotted"></div>
				<p class="text-left text-info">
					基本信息
				</p>
				<table class="table table-bordered">
				<tr>
					<th>供应商编码</th>
					<td>
						<c:choose>
							<c:when test="${sup.supNo!=''}">
								${sup.supNo}
							</c:when>
							<c:otherwise>
								 &nbsp;
							</c:otherwise>
						</c:choose>
					</td>
					<th>供应商名称</th>
					<td>${sup.supName}</td>
					<th>供应商合同编码</th>
					<td>${sup.contractCode}</td>
					<th>招商人姓名</th>
					<td>${sup.cmbPeopleName}</td>
				</tr>
				<tr>
					<th>供应商电话</th>
					<td>${sup.supPhone}</td>
					<th>供应商邮箱</th>
					<td>${sup.supEmail}</td>
					<th>供应商传真</th>
					<td colspan="3">${sup.supFaxes}</td>
				</tr>
				<tr>
					<th>供应商地址</th>
					<td colspan="7">${sup.supAddress}</td>
				</tr>
				</table>
				<p class="text-left text-info">
					银行信息
				</p>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							银行账号 
						</th>
						<th>
							银行账户名称 
						</th>
						<th>
							银行账户地址 
						</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>
							<c:choose>
								<c:when test="${sup.bankAccountNo!=''}">
									${sup.bankAccountNo}
								</c:when>
								<c:otherwise>
									 &nbsp;
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${sup.bankAccountName}
						</td>
						<td>
							${sup.bankAddress}
						</td>
					</tr>
				</tbody>
				</table>
				<p class="text-left text-info">
					负责人信息
				</p>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							负责人姓名 
						</th>
						<th>
							负责人QQ 
						</th>
						<th>
							负责人电话 
						</th>
						<th>
							负责人身份证号码 
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<c:choose>
								<c:when test="${sup.headPeopleName!=''}">
									${sup.headPeopleName}
								</c:when>
								<c:otherwise>
									 &nbsp;
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${sup.headPeopleQQ}
						</td>
						<td>
							${sup.headPeoplePhone}
						</td>
						<td>
							${sup.headPeopleCardNo}
						</td>
					</tr>
					</tbody>
				</table>
				<p class="text-left text-info">
					联系人信息
				</p>
				<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							联系人姓名 
						</th>
						<th>
							联系人电话 
						</th>
						<th>
							联系人QQ 
						</th>
						<th>
							联系人邮箱 
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<c:choose>
								<c:when test="${sup.linkPeopleName!=''}">
									${sup.linkPeopleName}
								</c:when>
								<c:otherwise>
									 &nbsp;
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							${sup.linkPeoplePhone}
						</td>
						<td>
							${sup.linkPeopleQQ}
						</td>
						<td>
							${sup.linkPeopleEmail}
						</td>
					</tr>
					</tbody>
				</table>
				<p class="text-left text-info">
					其他信息
				</p>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>
								供应商类型 
							</th>
							<td>
								<c:choose>
									<c:when test="${sup.supType == 1}">
										公司
									</c:when>
									<c:when test="${sup.supType == 0}">
										个人
									</c:when>
									<c:otherwise>
										 &nbsp;
									</c:otherwise>
								</c:choose>
							</td>
							<th>
								供应商状态 
							</th>
							<td>
								<c:choose>
									<c:when test="${sup.supState == 0}">
										合作
									</c:when>
									<c:when test="${sup.supState == 1}">
										中止
									</c:when>
									<c:otherwise>
										 &nbsp;
									</c:otherwise>
								</c:choose>
							</td>
							<c:choose>
									<c:when test="${sup.supType == 1}">
										<th>
											供应商营业执照 
										</th>
									</c:when>
							</c:choose>
							<c:choose>
									<c:when test="${sup.supType == 1}">
										<td>
											${sup.busLicense}
										</td>
									</c:when>
							</c:choose>
						</tr>
						<tr>
							<th>
								备注 
							</th>
							<td colspan="5">
								${sup.remark}
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
<div class="line-dotted"></div>
<%@include file="/page/platform/footer.jsp"%>
</body>
</html>