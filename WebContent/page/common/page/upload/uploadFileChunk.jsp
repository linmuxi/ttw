<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>文件上传</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/common/js/webuploader-0.1.5/webuploader.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/page/common/js/webuploader-0.1.5/style.css" />
</head>
<body>
	<div id="wrapper">
        <div id="container">
            <!--头部，相册选择和格式选择-->

            <div id="uploader">
                <div class="queueList">
                    <div id="dndArea" class="placeholder">
                        <div id="filePicker">选择文件</div>
                        <p>或将文件拖到这里</p>
                    </div>
                </div>
                <div class="statusBar" style="display:none;">
                    <div class="progress">
                        <span class="text">0%</span>
                        <span class="percentage"></span>
                    </div><div class="info"></div>
                    <div class="btns">
                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/jquery/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/webuploader-0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/webuploader-0.1.5/md5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/webuploader-0.1.5/upload.js"></script>
</body>
</html>