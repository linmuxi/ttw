<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="author" content="magi">
		<title>订单信息 &middot; 淘桃网</title>
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<script type="text/javascript">
			function doSuccess(){
				$("body").mask("正在提交中....请稍后....");
				setTimeout(function(){
					window.location.href=webRoot + "page/ttw/manage/order/orderAudits?result=true&id=${order.id}";
				},2000);
			}
			function doBack(){
				$.dialog({
				    id:'shake-demo',
				    title:'提示',
				    content:'审批意见：<textarea rows="5" cols="100" style="width: 98%;" class="medium" id="content" name="content"></textarea>',
				    lock:true,
				        fixed:true,
				    ok:function(){
				        //this.shake();
				        var content = $('#content').val();
				        $("body").mask("正在提交中....请稍后....");
				        this.hide();
						setTimeout(function(){
							window.location.href=webRoot + "page/ttw/manage/order/orderAudits?result=false&id=${order.id}&content="+content;
						},2000);
				        return true;
				    },
				    okVal:'确定',
				    cancel:function(){}
				});
			}
			
		</script>
	</head>
	<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
		<%@include file="/page/platform/header.jsp"%>
		<div class="navbar">
			<div class="navbar-innert">
				<a class="brand" href="#" style="color: #333333; width: 180px;"><img src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand2">订单信息</a>
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
						<strong>说明!</strong> 这里显示了订单的详情信息
					</div>
					<div class="btn-group">
						<button id="btnback" type="button" class="btn">返回</button>
						<c:if test="${order.orderStatus=='1'}">
							<button id="btnCheck" type="button" class="btn btn-success" onclick="doSuccess();">通过</button>
							<button id="btnReturn" type="button" class="btn" onclick="doBack();">退回</button>
						</c:if>
					</div>
					<div class="line-dotted"></div>
					<p class="text-left text-info">
						订单信息
					</p>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width:25%">
									订单编号
								</th>
								<th style="width:25%">
									订单金额
								</th>
								<th style="width:25%">
									状态
								</th>
								<th style="width:25%">
									下单日期
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									${order.orderSn}
								</td>
								<td>
									${order.amount}
								</td>
								<td>
									<c:choose>
										<c:when test="${order.orderStatus=='0'}">未确认</c:when>
										<c:when test="${order.orderStatus=='1'}">待核实</c:when>
										<c:when test="${order.orderStatus=='2'}">待制作</c:when>
										<c:when test="${order.orderStatus=='3'}">制作中</c:when>
										<c:when test="${order.orderStatus=='4'}">待验收</c:when>
										<c:when test="${order.orderStatus=='5'}">待上传源文件</c:when>
										<c:when test="${order.orderStatus=='6'}">待支付尾款</c:when>
										<c:when test="${order.orderStatus=='7'}">已完成</c:when>
									</c:choose>
								</td>
								<td>
									${order.createDate}
								</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th>
									会员
								</th>
								<th>
									会员等级
								</th>
								<th colspan="2">
									联系号码
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									${order.memberName}
								</td>
								<td>
									${order.rankName}
								</td>
								<td colspan="2">
									${order.mobile}
								</td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th colspan="4">
									备注(<a href="${pageContext.request.contextPath}${oa.content}" title="附件下载"><img src="${pageContext.request.contextPath}/page/ttw/images/portal/downloads.png" width="30px" height="30px"></a>)
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">
									${order.memo}
								</td>
							</tr>
						</tbody>
					</table>
					<p class="text-left text-info">
						商品信息
					</p>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width:25%">
									商品编号
								</th>
								<th style="width:25%">
									商品名称
								</th>
								<th style="width:25%">
									商品价格
								</th>
								<th style="width:10%">
									商品数量
								</th>
								<th style="width:15%; text-align:center;">
									所属供应商
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${items}" var="item">
							<tr>
								<td>${item.sn}</td>
								<td>${item.name}</td>
								<td>${item.price}</td>
								<td>${item.quantity}</td>
								<td style="text-align:center;">${order.supName}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<p class="text-left text-info">
						审核意见
					</p>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>
									内容
								</th>
								<th style="width:30%">
									审核时间
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderAudits}" var="audit">
								<tr>
									<td>
										<c:choose>
											<c:when test="${audit.orderStatus==4}">
												<a href="${pageContext.request.contextPath}${audit.content}" target="_blank">
													<img src="${pageContext.request.contextPath}/page/ttw/images/portal/downloads.png" width="30px" height="30px">验收文件下载
												</a>
											</c:when>
											<c:when test="${audit.orderStatus==6}">
												<a href="${pageContext.request.contextPath}${audit.content}" target="_blank">
													<img src="${pageContext.request.contextPath}/page/ttw/images/portal/downloads.png" width="30px" height="30px">源文件下载
												</a>
											</c:when>
											<c:otherwise>${audit.content}</c:otherwise>
										</c:choose>
									</td>
									<td>${audit.createDate} [ <font color="#4D82B8">${audit.username}</font> ]</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="line-dotted"></div>
		<%@include file="/page/platform/footer.jsp"%>
	</body>
</html>