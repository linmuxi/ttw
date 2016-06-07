/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.facade;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.service.FileStoreService;

/**
 * 附件模块代理类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Component
public class FileStoreFacade {

	@Resource
	private FileStoreService fileStoreService;
	
	/**
	 * 查询附件列表
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap queryFileStoreList(FileStoreVO fileStoreVO){
		return this.fileStoreService.queryFileStoreList(fileStoreVO);
	}
	
	/**
	 * 根据id获取附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap queryFileStoreListByBusinessId(FileStoreVO fileStoreVO){
		return this.fileStoreService.queryFileStoreListByBusinessId(fileStoreVO);
	}
	
	/**
	 * 根据id获取附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap getFileStore(FileStoreVO fileStoreVO){
		return this.fileStoreService.getFileStore(fileStoreVO);
	}
	
	
	/**
	 * 添加附件
	 * @param FileStoreVO
	 * @return
	 */
	public ModelMap addFileStore(FileStoreVO fileStoreVO){
		return this.fileStoreService.addFileStore(fileStoreVO);
	}
	
	
	
	/**
	 * 删除附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap delFileStore(FileStoreVO fileStoreVO) {
		return this.fileStoreService.delFileStore(fileStoreVO);
	}
}
