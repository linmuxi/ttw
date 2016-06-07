<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理首页</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="container" style="margin-top:50px;margin-left: 0px;margin-right: 0px;padding: 0px;width: 100%;">
		<iframe width="100%" frameborder="0" id="mainIframe"></iframe>
	</div>
	<script type="text/javascript">
		$(function(){
			window.onresize = resizeIframe;
			function resizeIframe(){
				$("#mainIframe").attr("height",(document.documentElement.clientHeight - 55)+"px");
			}
			resizeIframe();
		});
	</script>
</body>
</html>