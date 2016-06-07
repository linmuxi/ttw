<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String ctx = request.getContextPath();
	if ("/".equals(ctx)) {
		ctx = "";
	}
	request.setAttribute("ctx", ctx);
%>
<!-- jquery -->
<script src="${pageContext.request.contextPath}/page/common/js/jquery/jquery.min.js"></script>

<!-- 常用帮助js -->
<script src="${pageContext.request.contextPath}/page/common/js/utils/date.js"></script>
<script src="${pageContext.request.contextPath}/page/common/js/utils/stringutils.js"></script>
<script src="${pageContext.request.contextPath}/page/common/js/utils/jquery_extend.js"></script>

<!-- dwr -->
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>

<script src="${pageContext.request.contextPath}/page/common/js/lhgdialog/lhgdialog.min.js"></script>

<script src="${pageContext.request.contextPath}/page/common/js/My97DatePicker/WdatePicker.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/loadmask/jquery.loadmask.css" type="text/css">
<script src="${pageContext.request.contextPath}/page/common/js/loadmask/jquery.loadmask.js"></script>


<script>
	var webRoot = "${pageContext.request.contextPath}";
	
	;$(function(){
		
		if("${memberInfo.name}" != ''){
			var _info = $(".rightsidebar li").eq(0);
			if(_info){
				_info.html("欢迎你：${memberInfo.name}&nbsp;&nbsp;&nbsp;&nbsp; <a href='${ctx}/page/logout?type=0' >注销</a>");
			}
		}
	});

	var nav = {"平面设计":"C16A8392492D11E5B93902004C4F4F50","海报设计":"C8A733CC492D11E5B93902004C4F4F50","展架设计":"1768E21049A411E5B93902004C4F4F50","易拉宝设计":"22A0661D49A411E5B93902004C4F4F50","包装设计":"2A70656C49A411E5B93902004C4F4F50","画册设计":"327F091449A411E5B93902004C4F4F50","DM单设计":"3AF3228149A411E5B93902004C4F4F50","卡片设计":"42BE687849A411E5B93902004C4F4F50","日历设计":"49848B2349A411E5B93902004C4F4F50","VI设计":"508DC61449A411E5B93902004C4F4F50","UI设计":"57E0073449A411E5B93902004C4F4F50",
			"建站营销":"25995D783F7911E5B93902004C4F4F50","交易类":"A3ECC4924BBC11E59E3802004C4F4F50","标准类":"8F791A274BBC11E59E3802004C4F4F50","电商类":"AF7EF4D94BBC11E59E3802004C4F4F50",
			"项目案例":"BF111F684AFE11E59E3802004C4F4F50","定制网站":"CBC3B5674AFE11E59E3802004C4F4F50","网站建设":"E0B641184BBC11E59E3802004C4F4F50","微店建设":"EB549DD54BBC11E59E3802004C4F4F50","淘宝店建设":"F8C7DA824BBC11E59E3802004C4F4F50","天猫店建设":"01ABA0CD4BBD11E59E3802004C4F4F50"};
	
	function getNavLabel(id){
		for(var label in nav){
			if(nav[label] == id){
				return label;
			}
		}
		return id;
	}
</script>