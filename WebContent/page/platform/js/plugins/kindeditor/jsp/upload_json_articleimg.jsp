<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.json.simple.*"%>
<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@page import="org.springframework.web.multipart.MultipartFile"%>

<%

/**
 * KindEditor JSP
 * 
 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */

//文件保存目录路径

String savePath = request.getSession().getServletContext().getRealPath("");
//文件保存目录URL
//String saveUrl  = request.getContextPath() + "/articleimg/";
String saveUrl="/Uploads/articleimg/";
String realpath="";
String nowTimeStr="";
String savedir="/Uploads/articleimg/";
SimpleDateFormat sDateFormat;
sDateFormat=new SimpleDateFormat("yyyyMMdd");
nowTimeStr=sDateFormat.format(new Date());
savePath=savePath+savedir+nowTimeStr+"/";
File dir=new File(savePath);
	if(!dir.exists()){
		dir.mkdirs();
		realpath=saveUrl+nowTimeStr+"/";
	}else{
		realpath=saveUrl+nowTimeStr+"/";
	}
//定义允许上传的文件扩展名
String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
//最大文件大小
long maxSize = 20971520;

//Struts2 请求 包装过滤器
MultipartRequest wrapper = (MultipartRequest) request;

MultipartFile file = wrapper.getFile("imgFile");

//获得上传的文件名
String fileName = file.getName();
//得到上传文件的扩展名
String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
//检查扩展名
if(!Arrays.<String> asList(fileTypes).contains(fileExt)) {
	out.println(getError("上传文件扩展名是不允许的扩展名。"));
	return;
}

//检查文件大小
if (file.getSize() > maxSize) {
	out.println(getError("上传文件大小超过限制。"));
	return;
} 

//检查目录
File uploadDir = new File(savePath);
	if (!uploadDir.isDirectory()) {
	out.println(getError("上传目录不存在。"));
	return;
}
//检查目录写入权限
if (!uploadDir.canWrite()) {
	out.println(getError("上传目录没有写入权限。"));
	return;
}

//重构上传图片的名称 
SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
String newImgName = df.format(new Date()) + "_"+ new Random().nextInt(1000) + "." + fileExt;

//设置 KE 中的图片文件地址
//String newFileName = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ saveUrl + newImgName;

File f = new File(uploadDir.getAbsoluteFile()+"/"+newImgName);
file.transferTo(f);
f.createNewFile();


//发送给 KE 
JSONObject obj = new JSONObject();
obj.put("error", 0);
obj.put("url", realpath + newImgName);
out.println(obj.toJSONString());

%>
<%!
private String getError(String message) {
	JSONObject obj = new JSONObject();
	obj.put("error", 1);
	obj.put("message", message);
	return obj.toJSONString();
}
%>