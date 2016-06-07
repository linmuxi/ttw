<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.json.simple.*"%>
<%@page import="com.phly.common.base.action.upload.UploadConstants"%>
<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%
//String path = request.getContextPath();
//InetAddress inet = InetAddress.getLocalHost();
//String basePath = request.getScheme()+"://"+inet.getHostAddress()+":"+request.getServerPort()+path+"/";
%>
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
//String saveUrl  = request.getContextPath();
String saveUrl = UploadConstants.UPLOAD_FILE_PATH;
String realpath = "";
String nowTimeStr = "";
String savedir = UploadConstants.UPLOAD_FILE_PATH;
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

String newImgName = "";

RequestContext requestContext = new ServletRequestContext(request);

if(FileUpload.isMultipartContent(requestContext)){
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(new File(savePath));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(maxSize);
	List<FileItem> items = new ArrayList<FileItem>();
	try {
		items = upload.parseRequest(request);
	} catch (FileUploadException e) {
		System.out.println("文件上传发生错误" + e.getMessage());
	}
	
	Iterator it = items.iterator();
	while(it.hasNext()){
	    FileItem fileItem = (FileItem) it.next();
	    if(fileItem.isFormField()){      
			System.out.println(fileItem.getFieldName() + "   " + fileItem.getName() + "   " + new String(fileItem.getString().getBytes("iso8859-1"), "gbk"));
	    }else{
			System.out.println(fileItem.getFieldName() + "   " + 
	        fileItem.getName() + "   " + 
	        fileItem.isInMemory() + "    " + 
	        fileItem.getContentType() + "   " + 
	        fileItem.getSize());
			
			String fileName = fileItem.getName();
			
			//得到上传文件的扩展名
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			//检查扩展名
			if(!Arrays.<String> asList(fileTypes).contains(fileExt)) {
				out.println(getError("上传文件扩展名是不允许的扩展名。"));
				return;
			}

			//检查文件大小
			if (fileItem.getSize() > maxSize) {
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
			newImgName = df.format(new Date()) + "_"+ new Random().nextInt(1000) + "." + fileExt;
			
			if(fileItem.getName()!=null && fileItem.getSize()!=0){
				File fullFile = new File(fileItem.getName());
				File newFile = new File(savePath + newImgName);
				try {
					fileItem.write(newFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				System.out.println("文件没有选择 或 文件内容为空");
			}
		}
	}
}
	   


//发送给 KE 

JSONObject obj = new JSONObject();
obj.put("error", 0);
obj.put("url", request.getContextPath() + realpath + newImgName);
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