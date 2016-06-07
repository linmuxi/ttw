/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.phly.common.base.action.upload.UploadConstants;
import com.phly.common.base.facade.DictFacade;
import com.phly.common.base.model.DictVO;

/**
 *数据字典维护
 * @Description: TODO
 * @author wanglong
 * @since 2015年10月25日 上午11:53:53
 */

@Controller
@RemoteProxy
public class SysDictAction {

	@Resource
	private DictFacade dictFacade;
	
	
	/**
	 * 查询数据字典列表
	 * @param dictVO
	 * @return
	 */
	@RequestMapping("/page/admin/dict/index")
	@ResponseBody
	public ModelMap queryDictList(DictVO dictVO){
		return this.dictFacade.queryAllDictList(dictVO);
	}
	
	
	
	@RequestMapping("/page/platform/initAddDict")
	public ModelAndView initAddDict(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/page/platform/dict/dict.jsp");
		mv.addObject("operate", request.getParameter("operate"));
		return mv;
	}
	
	
	@RequestMapping("/page/platform/initEditDict")
	public ModelAndView initEditDict(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		mv.addAllObjects(this.dictFacade.getOneDict(id));
		mv.addObject("operate", request.getParameter("operate"));
		mv.setViewName("/page/platform/dict/dict.jsp");
		return mv;
	}
	
	
	
	
	
	
	/**
	 * 编辑数据字典
	 * @param dictVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap saveDict(DictVO dictVO){
		return this.dictFacade.saveDict(dictVO);
	}
	
	/**
	 * 删除数据字典
	 * @param dictVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delDict(DictVO dictVO){
		return this.dictFacade.delDict(dictVO);
	}
	
	
	
	@RequestMapping("/uploadDictImg")
	public String uploadDictImg(HttpServletRequest request,
			HttpServletResponse response) {
		String newFilename = "";
		String nowTimeStr = "";
		String realpath = request.getSession().getServletContext()
				.getRealPath("/");
		String fileDir = UploadConstants.UPLOAD_IMG_PATH_INDEX;
		String savePath = realpath + fileDir;
		File destFile = new File(savePath);
		if (!destFile.exists()) {
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
			response.setStatus(HttpServletResponse.SC_OK);
			writer.print("{success:'" + fileDir + newFilename + "'}");
		} catch (FileNotFoundException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} catch (IOException ex) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			writer.print("{'success': false}");
		} finally {
			try {
				fos.close();
				is.close();
			} catch (IOException ignored) {

			}
		}
		writer.flush();
		writer.close();
		return null;
	}
}
