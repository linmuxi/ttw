/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.banner.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.phly.common.base.dao.MyBatisDao;
import com.phly.ttw.manage.banner.model.BannerVO;

/**
 * banner持久层
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午4:51:46
 */
@Repository
public class BannerDao extends MyBatisDao {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 查询banner列表
	 * 
	 * @param bannerVO
	 * @return 
	 */
	public List<BannerVO> queryBannerList(BannerVO bannerVO) {
		return this.queryList("banner.queryBannerList", bannerVO, bannerVO.getPageNo(), bannerVO.getPageSize());
	}

	/**
	 * 查询banner列表总数
	 * @param bannerVO
	 * @return
	 */
	public int getBannerListCount (BannerVO bannerVO) {
		return (Integer) this.getObject("banner.getBannerListCount", bannerVO);
	}

	/**
	 * 获取banner
	 * @param bannerVO
	 * @return
	 */
	public BannerVO getBanner(BannerVO bannerVO) {
		return (BannerVO) this.getObject("banner.getBanner", bannerVO);
	}
	
	/**
	 * 添加banner
	 * @param bannerVO
	 * @return
	 */
	public boolean addBanner(BannerVO bannerVO) {
		boolean flag = false;
		try {
			this.insert("banner.addBanner",bannerVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("添加banner失败,"+e);
		}
		return flag;
	}

	/**
	 * 更新banner
	 * @param bannerVO
	 * @return
	 */
	public boolean updateBanner(BannerVO bannerVO) {
		boolean flag = false;
		try {
			this.update("banner.updateBanner",bannerVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("更新banner失败,"+e);
		}
		return flag;
	}
	

	/**
	 * 删除banner
	 * @param bannerVO
	 * @return
	 */
	public boolean deleteBanner(BannerVO bannerVO) {
		boolean flag = false;
		try {
			this.delete("banner.deleteBanner",bannerVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("删除banner失败,"+e);
		}
		return flag;
	}
}
