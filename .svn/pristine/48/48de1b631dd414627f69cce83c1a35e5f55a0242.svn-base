/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.model.FileStoreVO;

/**
 * 附件存储dao类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月13日 下午4:51:46
 */
@Repository
public class FileStoreDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 查询附件信息
	 * @param fileStoreVO
	 * @return
	 */
	public List<FileStoreVO> queryFileStoreList(FileStoreVO fileStoreVO){
		return this.queryList("fileStore.queryFileStoreList", fileStoreVO,fileStoreVO.getPageNo(),fileStoreVO.getPageSize());
	}
	
	/**
	 * 查询附件信息
	 * @param fileStoreVO
	 * @return
	 */
	public List<FileStoreVO> queryFileStoreListNoPage(FileStoreVO fileStoreVO){
		return this.queryList("fileStore.queryFileStoreList", fileStoreVO);
	}
	
	
	/**
	 * 查询附件总数
	 * @param fileStoreVO
	 * @return
	 */
	public int getFileStoreCount (FileStoreVO fileStoreVO){
		return (Integer) this.getObject("fileStore.getFileStoreCount", fileStoreVO);
	}
	
	
	/**
	 * 根据ID或者名称查询附件信息
	 * @param fileStoreVO
	 * @return
	 */
	public FileStoreVO getFileStore(FileStoreVO fileStoreVO){
		return (FileStoreVO) this.getObject("fileStore.getFileStore", fileStoreVO);
	}
	
	
	/**
	 * 添加附件信息
	 * @param fileStoreVO
	 * @return
	 */
	public boolean addFileStore(FileStoreVO fileStoreVO){
		boolean flag = false;
		try {
			this.insert("fileStore.addFileStore",fileStoreVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加附件信息失败,"+e);
		}
		return flag;
	}
	
	
	/**
	 * 删除附件
	 * @param fileStoreVO
	 * @return
	 */
	public boolean delFileStore(FileStoreVO fileStoreVO) {
		boolean flag = false;
		try {
			this.delete("fileStore.delFileStore",fileStoreVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除附件失败,"+e);
		}
		return flag;
	}
}
