/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.RequestContextUtil;

/**
 * 附件存储服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class FileStoreService extends ServiceBase{

	//private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private FileStoreDao fileStoreDao;
	
	/**
	 * 查询附件列表
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap queryFileStoreList(FileStoreVO fileStoreVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.fileStoreDao.getFileStoreCount(fileStoreVO);
		if(count > 0){
			List<FileStoreVO> list = this.fileStoreDao.queryFileStoreList(fileStoreVO);
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, fileStoreVO.getPageNo());
			model.put(ROWCOUNT, fileStoreVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap queryFileStoreListByBusinessId(FileStoreVO fileStoreVO){
		ModelMap model = new ModelMap();
		
		List<FileStoreVO> list = this.fileStoreDao.queryFileStoreListNoPage(fileStoreVO);
		model.put(ROWS, list);
			
		return model;
	}
	
	/**
	 * 根据ID查询附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap getFileStore(FileStoreVO fileStoreVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		FileStoreVO vo = null;
		if("".equals(fileStoreVO.getId())){
			vo = fileStoreVO;
		}else{
			vo = this.fileStoreDao.getFileStore(fileStoreVO);
		}
		model.put("result",vo);
		return model;
	}
	
	
	
	
	/**
	 * 添加附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap addFileStore(FileStoreVO fileStoreVO){
		ModelMap model= new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		
		fileStoreVO.setCreator(userVO.getAccount());
		fileStoreVO.setCreateDate(new Timestamp(new Date().getTime()));
		fileStoreVO.setUpdater(userVO.getAccount());
		fileStoreVO.setUpdateTime(new Timestamp(new Date().getTime()));
		model.put("result", this.fileStoreDao.addFileStore(fileStoreVO));
		
		return model;
	}
	
	
	
	/**
	 * 删除附件
	 * @param fileStoreVO
	 * @return
	 */
	public ModelMap delFileStore(FileStoreVO fileStoreVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = fileStoreVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					fileStoreVO = new FileStoreVO();
					fileStoreVO.setId(id);
					flag = this.fileStoreDao.delFileStore(fileStoreVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
}
