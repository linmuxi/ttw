<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   
   @author linyong
   @since  2015年5月18日 下午8:48:46
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="ttwmenu" uri="/WEB-INF/tld/ttwmenu.tld" %>
<%@ include file="/page/common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘桃网后台首页</title>
<link href="${ctx}/page/business/css/index/index.css" rel="stylesheet" />
<link href="${ctx}/page/business/css/index/css.css" rel="stylesheet" />
<script src="${ctx}/page/common/js/jquery/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('li.button a').click(function (e) {
            var dropDown = $(this).parent().next();
            $('.dropdown').not(dropDown).slideUp('slow');
            dropDown.slideToggle('slow');
            e.preventDefault();
        })

    });
</script>
</head>
<body>
    <div class="bodyAll">
        <!--header-->
        <div class="headerAll">
            <img class="main_ttw_img" src="/ttw/page/business/images/index/ttw.png" />
            <div class="header">
                <a href="#" class="a1">首  页   |</a>
                <a href="#" class="a1">你好！${SPRING_SECURITY_CONTEXT.authentication.principal.username}   |</a>
                <a href="#" class="a1">客户端下载   |</a>
                <a href="#" class="a1">联系客服   |</a>
                <a href="${ctx}/page/logout?type=2" class="a1">退出</a>
            </div>           
        </div>
        <!--middleSGI  让您的生活更简单-->
        <div class="zh_middleAll">
            <div class="zh_middle">
                <div class="middle_left">
                    <div class="middle_gys"><a class="gyspt">供应商平台</a></div>
                    <ul class="zongdh">
	         			<ttwmenu:markMenu moduleList="${moduleList}"/>
                    </ul>
                </div>
                <div class="middle_right">
                    <iframe width="100%" src="${ctx }/page/admin/activiti/taskList.jsp" frameborder="0" id="containerIframe"></iframe>
                </div>
            </div>
        </div>
        <!--bottom-->
        <div class="bottomAll">
            <div class="bottom">
                <a href="#" class="a2">©2015 SGI</a>
                <a href="#" class="a2">服务协议   |</a>
                <a href="#" class="a2">权利声明   |</a>
                <a href="#" class="a2">帮助中心   |</a>
                <a href="#" class="a2">关于我们   |</a>
                <a href="#" class="a2">联系我们</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	    function toModule(url,obj){
	    	if(url == undefined || url == null || url.toUpperCase() == 'NULL' || url.trim() == ''){
	    	
	    		var imgSrcVal = $(obj).find('img').attr('src');
	    		if(imgSrcVal.indexOf('rwjtrit') > 0){
					$(obj).find('img').attr('src','${ctx}/page/business/images/index/rwjtDown.png');
	    		}else{
	    			$(obj).find('img').attr('src','${ctx}/page/business/images/index/rwjtrit.png');
	    		}
	    		return;
	    	}
	    	//window.location.href="${ctx}"+url;
	    	$("#containerIframe").attr("src","${ctx}"+url);
	    }
	    
	    $(function(){
			window.onresize = resizeIframe;
			function resizeIframe(){
				$("#containerIframe").attr("height",(document.documentElement.clientHeight - 90)+"px");
				$(".middle_left").css("height",(document.documentElement.clientHeight - 90)+"px");
			}
			resizeIframe();
	    });
    </script>
</body>
</html>