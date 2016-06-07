/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.banner.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.manage.banner.dao.BannerDao;
import com.phly.ttw.manage.banner.model.BannerVO;

/**
 * banner服务层
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Service
public class BannerService extends ServiceBase{

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	private BannerDao bannerDao;
	@Resource
	private FileStoreDao fileStoreDao;
	
	/**
	 * 查询banner列表
	 * @param bannerVO
	 * @return
	 */
	public ModelMap queryBannerList(BannerVO bannerVO) {
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.bannerDao.getBannerListCount(bannerVO);
		if(count > 0){
			List<BannerVO> list = this.bannerDao.queryBannerList(bannerVO);
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, bannerVO.getPageNo());
			model.put(ROWCOUNT, bannerVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 获取banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap getBanner(BannerVO bannerVO) {
		ModelMap model = new ModelMap();
		model.put("banner", this.bannerDao.getBanner(bannerVO));
		return model;
	}
	
	/**
	 * 添加banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap addBanner(BannerVO bannerVO) {
		ModelMap model= new ModelMap();
		BannerVO vo = new BannerVO();
		vo.setPage(bannerVO.getPage());
		vo.setPageIdx(bannerVO.getPageIdx());
		vo.setSort(bannerVO.getSort());
		if(this.bannerDao.getBanner(vo) == null){
			String businessId = bannerVO.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				bannerVO.setPicUrl(fsList.get(0).getUrl());
			}
			model.put("result", this.bannerDao.addBanner(bannerVO));
		}else{
			model.put("result", false);
			model.put("remark", "该banner已经存在。");
		}
		return model;
	}

	/**
	 * 修改banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap updateBanner(BannerVO bannerVO) {
		ModelMap model= new ModelMap();
		BannerVO vo = new BannerVO();
		vo.setPage(bannerVO.getPage());
		vo.setPageIdx(bannerVO.getPageIdx());
		vo.setSort(bannerVO.getSort());
		BannerVO rsVO = this.bannerDao.getBanner(vo);
		if((rsVO == null) || (rsVO != null && rsVO.getId().equalsIgnoreCase(bannerVO.getId()))){
			String businessId = bannerVO.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				bannerVO.setPicUrl(fsList.get(0).getUrl());
			}
			model.put("result", this.bannerDao.updateBanner(bannerVO));
		}else{
			model.put("result", false);
			model.put("remark", "该banner已经存在。");
		}
		return model;
	}
	
	/**
	 * 删除banner
	 * @param bannerVO
	 * @return
	 */
	public ModelMap deleteBanner(BannerVO bannerVO) {
		ModelMap model= new ModelMap();
		model.put("result", this.bannerDao.deleteBanner(bannerVO));
		return model;
	}
}
