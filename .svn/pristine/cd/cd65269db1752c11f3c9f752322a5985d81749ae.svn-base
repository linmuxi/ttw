<%@page import="com.phly.common.util.RequestContextUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String roleFlag = "";
	if(RequestContextUtil.existsRole("商品部-商品经理")){
		roleFlag = "sgjl";
	}else if(RequestContextUtil.existsRole("商品部-商品审核经理")){
		roleFlag = "shjl";
	}else{
		roleFlag =  "default";
	}
	request.setAttribute("roleFlag", roleFlag);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="magi">
<title>商品列表 &middot; 淘桃网</title>

</head>

<body data-spy="scroll" data-target=".subnav" data-offset-top="40">
	<!-- header 包含头部导航-->
	<%@include file="/page/platform/header.jsp"%>
	
	<!-- goods dwr -->
	<script src="<%=basePath%>dwr/interface/GoodsAction.js?2=1"></script>
	
	<!-- end header -->
	<div class="navbar">
		<div class="navbar-innert">
			<a class="brand" href="#" style="color: #333333; width: 180px;"><img
				src="<%=basePath%>page/platform/ui/assets/img/logo.png" alt="" style="height: 30px;">淘桃网</a> 
				<a class="brand" href="#">产品</a> <a class="brand2">供应商产品列表</a>
		</div>
	</div>
	<div class="container-fluid containerb">

		<div class="row-fluid">

			<div class="span2">
				<!-- 引入左侧导航 -->
				<%@include file="/page/platform/left.jsp"%>
			</div>

			<div class="span10">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>说明!</strong> 这里显示了供应商的产品信息
					
					<input type="hidden" name="roleFlag" id="roleFlag" value="${roleFlag }"/>
					
				</div>
				<div id="alertinfo" style="display: none;" class="alert alert-info">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<div id="alerterror" style="display: none;"
					class="alert alert-error">
					<a class="close" data-dismiss="alert" href="#">&times;</a> <strong></strong>
				</div>
				<!-- flexigrid -->
				<div id="flexgoodsmanagement">
					<table id="goodsmanagement" style="display: none;"></table>
				</div>
				<!-- 删除提示框 -->
				<div id="goodsdelModal" class="modal hide fade">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    <h3>删除提示</h3>
				  </div>
				  <div  class="modal-body">
				    <p id="contentp">One fine body…</p>
				  </div>
				  <div class="modal-footer">
				    <a href="#" id="goodsbtnclose" class="btn">关闭</a>
				    <a href="#" id="goodsbtnok" class="btn btn-primary">确认删除</a>
				  </div>
				</div>
				
				<!-- 上架提示框 -->
				<div id="goodsShelvesModal" class="modal hide fade">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    <h3>上架提示</h3>
				  </div>
				  <div  class="modal-body">
				    <p id="shelvesContentp">One fine body…</p>
				  </div>
				  <div class="modal-footer">
				    <a href="#" id="goodsShelvesbtnclose" class="btn">关闭</a>
				    <a href="#" id="goodsShelvesbtnok" class="btn btn-primary">确认上架</a>
				  </div>
				</div>
				
				<!-- 下架提示框 -->
				<div id="goodsFromShelvesModal" class="modal hide fade">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    <h3>下架提示</h3>
				  </div>
				  <div  class="modal-body">
				    <p id="fromShelvesContentp">One fine body…</p>
				  </div>
				  <div class="modal-footer">
				    <a href="#" id="goodsFromShelvesbtnclose" class="btn">关闭</a>
				    <a href="#" id="goodsFromShelvesbtnok" class="btn btn-primary">确认下架</a>
				  </div>
				</div>
				
				<!-- 上架流程提示框 -->
				<div id="goodsFromWorkflowModal" class="modal hide fade">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				    <h3>提示</h3>
				  </div>
				  <div  class="modal-body">
				    <p id="fromWorkflowContentp">One fine body…</p>
				  </div>
				  <div class="modal-footer">
				    <a href="#" id="goodsFromWorkflowbtnclose" class="btn">关闭</a>
				    <a href="#" id="goodsFromWorkflowbtnok" class="btn btn-primary">确认</a>
				  </div>
				</div>
			</div>

		</div>

	</div>
	<script type="text/javascript">
	function startGoodsWorkflow(goodsId, goodsName){
		var str = $("#row"+goodsId+" td:nth-child(2) div").html();
		
		str += " 提交审核";
		
		//上架提示框--在goodsList.jsp中编写
		$("#fromWorkflowContentp").text(str);
		$("#goodsFromWorkflowModal").modal({
			keyboard:true,
			show:true,
		});
		//“确认”按钮事件
		$("#goodsFromWorkflowbtnok").click(function(){
			$("#goodsFromWorkflowModal").modal('hide');
			$("body").mask("提交中...");
			GoodsAction.startGoodsWorkflow({id:goodsId,goodsName:goodsName}, function(data){
				$("body").unmask();
				if(data){
					$('#goodsmanagement').flexReload();
					forminfo("#alertinfo", "已发起产品上架申请");
					$("body").unmask();
				}
			});
		});
		
		//关闭“提示框”
		$("#goodsFromWorkflowbtnclose").click(function(){
			$("#goodsFromWorkflowModal").modal('hide');
		});
	}
	

	</script>
	<script type="text/javascript"
		src="<%=basePath%>page/ttw/js/goods/goodsList.js"></script>
	<%@include file="/page/platform/footer.jsp"%>

</body>
</html>

