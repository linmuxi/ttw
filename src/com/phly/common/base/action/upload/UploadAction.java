package com.phly.common.base.action.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.cxf.common.util.StringUtils;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.phly.common.base.model.FileStoreVO;


/**
 * 文件上传基础类
 * @ClassName: UploadAction 
 * @Description: TODO
 * @author orc_lh
 * @date May 20, 2015 10:39:46 PM 
 *
 */
@Controller
@Scope("prototype")
@RemoteProxy
public class UploadAction extends UploadBaseAction{
	 
	@RequestMapping("/uploadHeadPic")
	public String uploadHeadPic(@RequestParam("file")MultipartFile file, HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("utf-8");
			super.upload(file, UploadConstants.UPLOAD_FILE_PATH, request);
            response.getWriter().print(super.getFileName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}
	
	@RequestMapping("/newUploadFile")
	public String newUploadFile(HttpServletRequest request, HttpServletResponse response){
		String newFilename = "";
		String nowTimeStr = "";
		String realpath = request.getSession().getServletContext().getRealPath("/");
		String fileDir = UploadConstants.UPLOAD_FILE_PATH;
		String savePath = realpath + fileDir;
		File destFile = new File(savePath);
        if(!destFile.exists()){
            destFile.mkdirs();
        }
		SimpleDateFormat sDateFormat;
		Random r = new Random();
		
		int rannum = (int) (r.nextDouble() * (99999 - 1000 + 1)) + 10000;
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		nowTimeStr = sDateFormat.format(new Date());
		String filename = request.getHeader("X-File-Name");
		String extName = "";
		if (filename.lastIndexOf(".") >= 0) {
			extName = filename.substring(filename.lastIndexOf("."));
		}
		newFilename = nowTimeStr + rannum + extName;
		PrintWriter writer = null;
		InputStream is = null;
		FileOutputStream fos = null;
		try {
			writer = response.getWriter();
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		try {
			is = request.getInputStream();
			File file = new File(savePath + newFilename);
			fos = new FileOutputStream(file);
			IOUtils.copy(is, fos);
			
			String businessId = request.getParameter("businessId");
			String type = request.getParameter("type");
			
			FileStoreVO fileStoreVO = new FileStoreVO();
			String fileStoreId = UUID.randomUUID().toString();
			fileStoreVO.setId(fileStoreId);
			fileStoreVO.setBusinessId(businessId);
			//fileStoreVO.setFileName(new String(file.getName().getBytes("utf-8")));
			fileStoreVO.setFileName(filename);
			fileStoreVO.setSuffix(extName);
			fileStoreVO.setFilePath(savePath + newFilename );
			fileStoreVO.setUrl("/upload/user/"+newFilename);
			fileStoreVO.setType(type);
			fileStoreVO.setSize(Double.valueOf(file.length()));
             
			this.fileStoreFacade.addFileStore(fileStoreVO);
			
			response.setStatus(HttpServletResponse.SC_OK);
			writer.print("{success:'" + fileDir + newFilename + "',fileStoreId:'" + fileStoreId + "'}");
		} catch (FileNotFoundException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} catch (IOException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} finally {
			try {
				//this.setImgdirpath(null);
				fos.close();
				is.close();
			} catch (IOException ignored) {

			}
		}
		writer.flush();
		writer.close();
        return null;
	}
	
	@RequestMapping("/uploadFile")
	public String uploadHeadPic(HttpServletRequest request, HttpServletResponse response){
		String result = "{\"exist\":0}";
		try {
			//获取绝对路径
			String realPath = request.getSession().getServletContext().getRealPath("/");
			//文件块下标
			int chunk = 0;
			String chunkStr = request.getParameter("chunk");
			if(!StringUtils.isEmpty(chunkStr)){
				chunk = Integer.valueOf(chunkStr);
			}
			//总共分了多少块
			int chunks = 1;
			String chunksStr = request.getParameter("chunks");
			if(!StringUtils.isEmpty(chunksStr)){
				chunks = Integer.valueOf(chunksStr);
			}
			//文件名称
			String fileName = request.getParameter("name");
			String name = fileName.substring(fileName.lastIndexOf("."));
			//文件上传路径
			String uploadPath = realPath + UploadConstants.UPLOAD_FILE_PATH + fileName;
			//Md5File
			String md5 = request.getParameter("md5");
			System.out.println("md5:"+md5+"=============name:"+fileName+"======chunks:"+chunks+"=============chunk:"+chunk);
			if(!StringUtils.isEmpty(md5)){
				//Md5File 存储文件路径
				File md5file = new File(realPath + UploadConstants.UPLOAD_FILE_PATH + name + UploadConstants.MD5_FILE_SUFFIX);
				if(md5file.exists()){
					//读取服务器所有Md5File
					@SuppressWarnings("unchecked")
					List<String> lines = FileUtils.readLines(md5file, "UTF-8");
					
					//Md5File 是否存在标识
					boolean existFlag = false;
					for(String lineStr : lines){
						if(!StringUtils.isEmpty(lineStr) && lineStr.contains(md5)){
							existFlag = true;
							result = "{\"exist\":1}";
						}
					}
					if(!existFlag){
						FileWriter fw = new FileWriter(md5file);
						fw.write(md5);
						fw.flush();
						fw.close();
					}
				}else{
					md5file.createNewFile();
					FileWriter fw = new FileWriter(md5file);
					fw.write(md5);
					fw.flush();
					fw.close();
				}
			}else{
				DefaultMultipartHttpServletRequest request1 = (DefaultMultipartHttpServletRequest)request;
				MultipartFile file = request1.getFile("file");
				
				 String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
                int length = getAllowSuffix().indexOf(suffix);
                if(length == -1){
                    throw new Exception("请上传允许格式的文件");
                }
                if(file.getSize() > getAllowSize()){
                    throw new Exception("您上传的文件大小已经超出范围");
                }
                 
                File destFile = new File(realPath + UploadConstants.UPLOAD_TEMP_FILE_PATH);
                if(!destFile.exists()){
                    destFile.mkdirs();
                }
                String fileNameNew = "_" + chunk + UploadConstants.UPLOAD_TEMP_FILE_SUFFIX;
                File tempFile = new File(destFile.getAbsoluteFile()+"/"+fileNameNew);
                file.transferTo(tempFile);
                tempFile.createNewFile();
                
                //改名问分块临时文件
				String chunkTempFilePath = realPath + UploadConstants.UPLOAD_TEMP_FILE_PATH + "_" + chunk + UploadConstants.UPLOAD_TEMP_FILE_SUFFIX;
				File newTempFile = new File(chunkTempFilePath);
				if(!newTempFile.getParentFile().exists()){
					newTempFile.getParentFile().mkdir();
				}
				tempFile.renameTo(newTempFile);
				
				//判断是否所有分块都上传完毕
				boolean done = true;
				for(int index = 0; index < chunks; index++){
					//改名问分块临时文件
					String chunkFilePath = realPath + UploadConstants.UPLOAD_TEMP_FILE_PATH + "_" + index + UploadConstants.UPLOAD_TEMP_FILE_SUFFIX;
					File chunkFile = new File(chunkFilePath);
					if(!chunkFile.exists()){
						done = false;
						break;
					}
				}
				//分块全部上传
				if(done){
					//上传文件路径
					File uploadFile = new File(uploadPath);
					FileOutputStream fos = new FileOutputStream(uploadFile);
					for(int index = 0; index < chunks; index++){
						//改名问分块临时文件
						String chunkFilePath = realPath + UploadConstants.UPLOAD_TEMP_FILE_PATH + "_" + index + UploadConstants.UPLOAD_TEMP_FILE_SUFFIX;
						File chunkFile = new File(chunkFilePath);
						InputStream is = new FileInputStream(chunkFile);
						byte[] buffer = new byte[1*1024*1024];
						int len = 0;
						while((len = is.read(buffer,0, 1024*1024*1)) != -1){
							fos.write(buffer, 0, len);
						}
						is.close();
						
						//删除分块临时文件
						chunkFile.delete();
					}
					fos.close();
					//result = uploadPath;
				}
			}
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        return null;
	}
}
