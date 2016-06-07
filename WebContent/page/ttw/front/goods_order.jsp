<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String id = UUID.randomUUID().toString();
%>
<!DOCTYPE html>
<html language="en">
<head>
    <jsp:include page="common.jsp"></jsp:include>
  	<link href="${ctx}/page/ttw/portal/css/Submit.css" rel="stylesheet" type="text/css" />
  	
 	<!-- dwr -->
	<script src="${ctx}/dwr/engine.js"></script>
	<script src="${ctx}/dwr/util.js"></script>
  	<script src="${ctx}/dwr/interface/FileStoreAction.js"></script>
  	
	<script type="text/javascript" src="${ctx}/page/common/js/fileStore.js"></script>
	<title>淘桃网-我的订单</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<header class="location-search-header">
			<div class="location-info">
				<span>当前位置：</span>
				<span>我的订单</span>
			</div>
		</header>
		<form name="orderfrm" id="orderfrm" action="submitOrder?serialno=${goods.serialNumber}" method="post">
		<input type="hidden" id="fileUrl" name="fileUrl"/>
		<input type="hidden" id="id" name="id" value="<%= id %>"/>
		
		<div class="List">
			<div class="ListTit">商品订单</div>
			<div class="ListBg">
                <div class="ListBgLeft">
                    <c:choose>
                		<c:when test="${empty goods.pictureUrl}">
                			<img src="${ctx}/page/ttw/portal/images/Submit/none.jpg" onerror="this.src='${ctx}/page/ttw/front/images/default_goods_210_130.png'" />
                		</c:when>
                		<c:otherwise>
                			<img src="${ctx}/${goods.pictureUrl}" width="130px" height="130px" onerror="this.src='${ctx}/page/ttw/front/images/default_goods_210_130.png'" />
                		</c:otherwise>
                	</c:choose>
                    <div class="ListBgTit" style="width:390px;">[商品编号：${goods.serialNumber}]&nbsp;${goods.goodsName}</div>
                    <div class="ListBgSup" style="width:390px;">服务商：${goods.supname}</div>
                    <div class="ListSeven">
                        <div class="SevenIcon"></div>
                        <div>7天无理由退货</div>
                    </div>
                </div>
                <div class="ListBgRight">
                    <div class="ListPrice">￥${goods.memberPrice}</div>
                    <div class="ListNum">x${goodsNum}</div>
                    <!-- <div class="ListOpr"><a href="">删除</a></div> -->
                </div>
            </div>
		</div>
		<div>
			<ul class="BB_M2Ul" style="margin:0;">
				<li><div class="BB_CHTit" style="padding-left:4px;font-weight:bold;">留下您的联系方式，服务商可以更快的与您沟通</div></li>
				<li><div class="BB_CHTit">
						<input type="text" id="mobile" name="mobile" placeholder="请输入您的手机号码">
					</div>
				</li>
				<!-- <li><div class="BB_CHTit" style="padding-left:4px;font-weight:bold;">发票信息</div></li>
				<li style="margin-top:1px; height:30px;">
					<div class="BB_CHTit" style="padding-left:8px;">
						不开发票&nbsp;<a href="#" id="editInvoice">修改</a>
					</div>
				</li> -->
				<li><div class="BB_CHTit" style="padding-left:4px;font-weight:bold;">添加订单备注</div></li>
				<li>
					<div class="BB_CHTit" style="padding-left:4px;">
						<textarea id="memo" name="memo" rows="10" cols="100" style="border:solid 1px #E5E5E5;"></textarea>
					</div>
				</li>
				<li>
					<div class="BB_CHTit" style="padding-left:4px;font-weight:bold;">
						商品资料范本：<c:if test="${not empty filestore}"><a href="${ctx}${filestore[0].url}">${filestore[0].fileName}</a></c:if>
					</div>
				</li>
				<li>
					<div id="sampleFileList" class="BB_CHTit" style="padding-left:4px;">
					</div>
				</li>
				<li>
				</li>
				<li>
					<div class="BB_CHTit" style="padding-left:4px; margin-top:6px;">
						<div id="triggers" style="padding-left:8px; background-color:#E1EEF8; width: 450px; height:30px; line-height:28px; margin-bottom:5px; display:none;">
						</div>
						<div id="uploadergoodpc">
							<noscript>
								Please enable JavaScript to use file uploader.
							</noscript>
						</div>
					</div>
				</li>
				<!-- <li>
					<div class="BB_CHTit" id="triggers" style="padding-left:8px; background-color:#E1EEF8; height:30px; line-height:28px;">
						
					</div>
				</li> -->
			</ul>
		</div>
		<!-- <div class="Bill">
			<div class="BillTit">发票信息</div>
			<div class="BillInfo">
				<div class="BillInfo_Type">普通发票(电子)</div>
                <div class="BillInfo_Type BMargin">个人</div>
                <div class="BillInfo_Type BMargin">明细</div>
                <div class="BillInfo_Rev" id="btn">修改</div>
            </div>
		</div>
		<div style="margin-left:-150px;margin-top:-10px;">
			<ul class="BB_M2Ul">
				<li><div class="BB_CHTit">留下您的联系方式，服务商可以更快的与您沟通</div></li>
                <li>
                    <div class="BB_CHTit"></div>
                </li>
                <li>
                    <div class="BB_CHTit"><textarea name="memo" rows="5" cols="50" placeholder="请告诉服务商您的具体要求" style="border:solid 1px #E5E5E5"></textarea>
                </li>
            </ul>
		</div> -->
		</form>
		<br />
		<br />
		<div class="Pay Gold" style="height:15px;">
            <div style="margin-top:-15px; width:98%; margin-left:15px;">
                <div class="PayAll">应付总计：</div>
                <div class="PayPrice">￥ ${goods.memberPrice}</div>
                <a href="javascript:void(0);"><div class="PayBtn">结算</div></a>
            </div>
        </div>
	</main>
	<script src="${ctx}/page/common/js/lhgdialog/lhgdialog.min.js?skin=idialog"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/layer/layer.js"></script>
	<script type="text/javascript" src="${ctx}/page/platform/js/plugins/kindeditor/kindeditor-min.js"></script>
	<link href="${ctx}/page/platform/js/plugins/uploader/fileuploader.css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/page/platform/js/plugins/uploader/fileuploader.js"></script>
	
	<script type="text/javascript">
		$(function() {
			loadGoodsFileInfo("sampleFileList", "${goods.id}", "goodsFileInfo", true);
			
			$(".PayBtn").click(function(){
				var mobile = $('#mobile').val();
				if(mobile==''){
					alert('手机号码不能为空');
					$('#mobile').focus();
					return false;
				}
				layer.load(10);
				$('#orderfrm').submit();
			});
			$('#editInvoice').dialog({
				title:'发票信息',
				max: false,
			    min: false,
			    fixed: true,
			    lock: true,
			    background: '#000', /* 背景色 */
			    opacity: 0.5,       /* 透明度 */
				content:'url:${ctx}/page/ttw/front/fapiao.html'
			});
		});
		KE.show({
			id : 'memo',
		    imageUploadJson : '${ctx}/page/platform/js/plugins/kindeditor/jsp/upload_json.jsp',
			allowFileManager : true,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
				});
			}
		});
		function createUploader(){
			var businessId = $('#id').val();
 			
			var uploader = new qq.FileUploader({
                 element: document.getElementById('uploadergoodpc'),
                 action: '${ctx}/newUploadFile?businessId='+ businessId+'&type=orderFileInfo',
                 debug: true,
                 minSizeLimit:1024,
                 sizeLimit: 1073741824,
                 allowedExtensions: ['xls','xlsx','rar','zip'],
                 onComplete: function(id, fileName, responseJSON){
						var pcpath = responseJSON.success;
						var fileStoreId = responseJSON.fileStoreId;
						//var htm = "<img id='"+id+"' src='${ctx}/"+pcpath+"' rel='#"+fileName+"'/>";
						//var checkpc = "<input id='"+id+"' name='pcpath' type='checkbox' value='"+fileStoreId+"' /> ";
						//判断是否有上传的图片，为空表示第一次上传
						if($("#fileUrl").val() == ""){
							$("#fileUrl").val(pcpath);
						}
						//$("#triggers").append(htm).append(checkpc);
						$("#triggers").css('display','block');
						//var closeText = "<a href='javascript:void(0);'>x</a>";
						var uploadContent = fileName+"&nbsp;上传成功";
						//uploadContent += "<span style='float:right; margin-right:10px;'>"+closeText+"</span>";
						$("#triggers").append(uploadContent);
					},
			});
			$('.qq-upload-button').css('width','100px');
			$('#uploadTitle').text('上传附件');
		}
		window.onload = createUploader;
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

