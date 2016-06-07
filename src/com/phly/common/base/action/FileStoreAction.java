/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.FileStoreFacade;
import com.phly.common.base.model.FileStoreVO;

/**
 * 附件控制器类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Controller
@RemoteProxy
public class FileStoreAction {

	@Resource
	private FileStoreFacade fileStoreFacade;
	
	@RequestMapping("/page/business/fileStore")
	@ResponseBody
	public ModelMap queryFileStoreList(HttpServletRequest request,FileStoreVO fileStoreVO){
		return this.fileStoreFacade.queryFileStoreList(fileStoreVO);
	}
	
	
	/**
	 * 
	 * @param fileStoreVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap queryFileStoreListByBusinessId(FileStoreVO fileStoreVO){
		return this.fileStoreFacade.queryFileStoreListByBusinessId(fileStoreVO);
	}
	
	
	/**
	 * 根据id获取附件
	 * @param fileStoreVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap getFileStore(FileStoreVO fileStoreVO){
		return this.fileStoreFacade.getFileStore(fileStoreVO);
	}
	
	
	/**
	 * 添加附件
	 * @param fileStoreVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap addFileStore(FileStoreVO fileStoreVO){
		return this.fileStoreFacade.addFileStore(fileStoreVO);
	}

	
	/**
	 * 删除附件
	 * @param fileStoreVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delFileStore(FileStoreVO fileStoreVO) {
		return this.fileStoreFacade.delFileStore(fileStoreVO);
	}
}
