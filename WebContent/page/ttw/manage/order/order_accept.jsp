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
					<input type="hidden" id="fileUrl" name="fileUrl"/>
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>说明!</strong> 这里显示了订单的详情信息
					</div>
					<div class="form-inline">
						<table>
							<tr>
								<td>
									<c:if test="${order.orderStatus=='3'}">
										<span class="label label-required">样品上传:</span>
									</c:if>
									<c:if test="${order.orderStatus=='5'}">
										<span class="label label-required">源码上传:</span>
									</c:if>
								</td>
								<td>
									<div id="uploadergoodpc">
										<noscript>
											Please enable JavaScript to use file uploader.
										</noscript>
									</div>
								</td>
							</tr>
						</table>
						<!-- trigger elements -->
						<div id="triggers"></div>
					</div>
					<div class="form-inline" style="display:${order.orderStatus=='5'?'none':'block'}">
						<span class="label label-required">操作:</span>
						<input class="btn btn-success" type="button" id="delpc" name="delpc" value="删除所选图片" />
					</div>
					<div class="form-inline">
						<button id="btnback" type="button" class="btn">返回</button>
						<input class="btn btn-success" type="button" id="submit" name="submit" value="提交" />
					</div>
					<div class="line-dotted"></div>
					<p class="text-left text-info">
						订单信息
					</p>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width:25%">
									编号
								</th>
								<th style="width:25%">
									订单金额
								</th>
								<th style="width:25%">
									状态
								</th>
								<th style="width:25%">
									创建日期
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
								<th>
									联系号码
								</th>
								<th>
									备注
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
								<td>
									${order.mobile}
								</td>
								<td>
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
								<!-- <th style="width:25%">
									商品数量
								</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${items}" var="item">
							<tr>
								<td>${item.sn}</td>
								<td>${item.name}</td>
								<td>${item.price}</td>
								<%-- <td>${item.quantity}</td> --%>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="line-dotted"></div>
		<%@include file="/page/platform/footer.jsp"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/fileStore.js"></script>
		<script type="text/javascript" src="<%=basePath%>page/platform/js/plugins/uploader/fileuploader.js"></script>
		<script type="text/javascript">
	 		function createUploader(){
				var uploader = new qq.FileUploader({
	                 element: document.getElementById('uploadergoodpc'),
	                 action: '<%=basePath%>newUploadFile',
	                 debug: true,
	                 minSizeLimit:1024,
	                 sizeLimit: 1073741824,
	                 allowedExtensions: ['jpeg','jpg','gif','png','rar','zip'],
	                 onComplete: function(id, fileName, responseJSON){
	                			//var pcpath1 = "<%=basePath%>"+ responseJSON.success;
								var pcpath = responseJSON.success;
								var fileStoreId = responseJSON.fileStoreId;
								var htm = "<img id='"+id+"' src='<%=basePath%>"+pcpath+"' rel='#"+fileName+"'/>";
								var checkpc = "<input id='"+id+"' name='pcpath' type='checkbox' value='"+fileStoreId+"' /> ";
								//判断是否有上传的图片，为空表示第一次上传
								if($("#fileUrl").val() == ""){
									$("#fileUrl").val(pcpath);
								}
								$("#triggers").append(htm).append(checkpc);
							},
				});
			}
			window.onload = createUploader;
			$(function() {
				saveAccept = function(){
					$("body").mask("处理中...");
					var fileUrl = $("#fileUrl").val();
					var url = "saveAccept?id=${order.id}&fileUrl="+fileUrl;
					location.href=url;
				},
				//按钮“提交”事件
				$("#submit").click(function(){
					saveAccept();
				});
			});
		</script>
		<%!
			private String htmlspecialchars(String str) {
				str = str.replaceAll("&", "&amp;");
				str = str.replaceAll("<", "&lt;");
				str = str.replaceAll(">", "&gt;");
				str = str.replaceAll("\"", "&quot;");
				return str;
			}
		%>
	</body>
</html>