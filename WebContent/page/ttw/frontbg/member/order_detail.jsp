<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html language="en">
	<head>
		<jsp:include page="/page/ttw/front/common.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/jPaginate/css/style.css" media="screen"/>
		<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/css/order_detail.css" media="screen"/>
		<title>淘桃网-会员中心</title>
	</head>
<body>
	<jsp:include page="/page/ttw/front/header.jsp"></jsp:include>
	<main class="member-main">
		<aside class="member-aside">
			<ul>
				<li class="title"><a href="${ctx}/page/ttw/frontbg/member/center?goodsCategoryId=member_id">会员中心</a></li>
				<li class="child-wrap">账户中心
					<ul>
						<li><a href="${ctx}/page/ttw/frontbg/member/base_member.jsp?goodsCategoryId=member_id">基本信息</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/pwdupdate_member.jsp?goodsCategoryId=member_id">密码修改</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/updateinfo_member.jsp?goodsCategoryId=member_id">信息修改</a></li>
					</ul>
				</li>
				<li class="child-wrap">订单管理
					<ul>
						<li><a href="${ctx}/page/ttw/frontbg/cart?goodsCategoryId=member_id">我的购物车</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id">订单信息</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id&status=6">待付款订单</a></li>
						<li><a href="${ctx}/page/ttw/frontbg/member/order?goodsCategoryId=member_id&status=4">未验收订单</a></li>
					</ul>
				</li>
				<li class="child-wrap">财务管理
					<ul>
						<li><a href="#">发票管理</a></li>
					</ul>
				</li>
			</ul>
		</aside>
		<div id="main">
			<div class="mod-main mod-comm">
				<div class="mt">
					<h4>
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
					</h4>
				</div>
				<div class="mc">
					<table class="tb-void tb-none">
						<colgroup>
							<col width="100">
							<col width="320">
							<col width="90">
						</colgroup>
						<thead>
							<tr>
								<th>商品编号</th>
								<th>商品名称</th>
								<th>最新淘桃价</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="amount" value="0"></c:set>
							<c:forEach items="${items}" var="item">
							<tr>
								<td>${item.sn}</td>
								<td>${item.name}</td>
								<td><strong class="ftx-01">￥${item.price}</strong></td>
							</tr>
							<c:set var="amount" value="${item.price}"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<c:if test="${order.orderStatus==4}">
			<div class="mod-main mod-comm">
				<div class="mc">
					<table class="tb-void tb-left">
						<colgroup>
							<col></col>
						</colgroup>
						<tbody>
							<tr>
								<td>
									<input type="button" id="success" value="通过" class="button orange">
									&nbsp;
									<input type="button" id="back" value="退回" class="button gray">
								</td>
							</tr>
							<tr>
								<td>
									<textarea name="content" id="content" rows="2" cols="80" placeholder="请告诉服务商您的验收结果" style="border:solid 1px #E5E5E5"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</c:if>
			<div class="mod-main mod-comm">
				<div class="mt">
					<h3>订单信息</h3>
				</div>
				<div class="mc">
					<table class="tb-void tb-left">
						<colgroup>
							<col width="110px"></col>
							<col></col>
						</colgroup>
						<tbody>
							<tr>
								<td>订单编号</td>
								<td>${order.orderSn}</td>
							</tr>
							<tr>
								<td>支付方式</td>
								<td>${order.paymentMethodName}</td>
							</tr>
							<tr>
								<td>下单时间</td>
								<td>${order.createDate}</td>
							</tr>
							<tr>
								<td>结算金额</td>
								<td><strong class="ftx-01">￥${order.amount}</strong></td>
							</tr>
							<tr>
								<td rowspan="2">备注</td>
								<td>
									<a href="${ctx}${oa.content}" target="_blank">
										<img src="${ctx}/page/ttw/images/portal/downloads.png" width="50px" height="50px">
									</a>
								</td>
							</tr>
							<tr>
								<td>${order.memo}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="mod-main mod-comm">
				<div class="mt">
					<h3>当前进度</h3>
				</div>
				<div class="mc">
					<table class="tb-void tb-left">
						<colgroup>
							<col width="110px"></col>
							<col></col>
						</colgroup>
						<tbody>
							<c:if test="${empty orderAudits}">
								<tr>
									<td colspan="2" style="text-align:center;">等待后台核实</td>
								</tr>
							</c:if>
							<c:forEach items="${orderAudits}" var="audit">
								<tr>
									<td>${audit.username}</td>
									<td>
										${audit.createDate} -
										<c:choose>
											<c:when test="${audit.orderStatus==4}">
												<a href="${ctx}${audit.content}" target="_blank">
													<img src="${ctx}/page/ttw/images/portal/downloads.png" width="50px" height="50px">验收文件下载
												</a>
											</c:when>
											<c:when test="${audit.orderStatus==6}">
												<a href="${ctx}${audit.content}" target="_blank">
													<img src="${ctx}/page/ttw/images/portal/downloads.png" width="50px" height="50px">源文件下载
												</a>
											</c:when>
											<c:otherwise>${audit.content}</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#success').click(function(){
				layer.load(10);
				location.href="${ctx}/page/ttw/frontbg/member/order/accept?id=${order.id}&result=true";
			});
			$('#back').click(function(){
				var content = $('#content').val();
				if(content==''){
					alert('请填写退回原因');
					$('#content').focus();
					return false;
				}
				layer.load(10);
				location.href="${ctx}/page/ttw/frontbg/member/order/accept?id=${order.id}&result=false&content="+content;
			});
		});
	</script>
</body>
</html>