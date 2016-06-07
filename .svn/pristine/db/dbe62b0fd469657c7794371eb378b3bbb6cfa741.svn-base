/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.home.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.DictVO;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.util.Constant;
import com.phly.common.util.DictUtil;
import com.phly.ttw.manage.goods.dao.GoodsCategoryDao;
import com.phly.ttw.manage.goods.dao.GoodsDao;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;
import com.phly.ttw.manage.goods.model.GoodsVO;

/**
 * 前台主页
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年10月26日 下午11:43:26
 */
@Service
public class HomeService {

	@Resource
	private GoodsCategoryDao goodsCategoryDao;
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private FileStoreDao fileStoreDao;

	/**
	 * 获取首页商品类型模块信息(图片，子商品类型集合)
	 * @param dictVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryInfo(DictVO dictVO){
		
		ModelMap map = new ModelMap();
		
		//获取商品类型ID
		String goodsCategoryId = (String) DictUtil.getValue(dictVO.getType(),dictVO.getDefaultKey());
		
		GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
		goodsCategoryVO.setId(goodsCategoryId);
		
		GoodsCategoryVO vo = goodsCategoryDao.getGoodsCategory(goodsCategoryVO);
		
		FileStoreVO fsVO = new FileStoreVO();
		fsVO.setBusinessId(vo.getId());
		List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
		if(fsList != null && fsList.size() > 0){
			vo.setPcurl(fsList.get(0).getUrl());
		}
		goodsCategoryVO.setParentId(goodsCategoryId);
		vo.setChildGoodsCategoryList(goodsCategoryDao.queryGoodsCategoryListByParentId(goodsCategoryVO));
		
		map.put("goodsCategoryInfo", vo);
		return map;
	}

	/**
	 * 获取首页指定种类下热门商品列表
	 * @param dictVO
	 * @return
	 */
	public ModelMap queryHotGoodsInfo(DictVO dictVO){
		
		ModelMap map = new ModelMap();
		
		//获取商品类型ID
		String goodsCategoryId = (String) DictUtil.getValue(dictVO.getType(),dictVO.getDefaultKey());
		GoodsVO vo = new GoodsVO();
		//热门
		vo.setGoodsCategoryId(goodsCategoryId);
		//热门
		vo.setHotsSale(Constant.GOODS_HOTSALE_1);
		//查询已经上架的产品
		vo.setIsSpecificationsOpen(Constant.GOODS_SPECIFICATIONS_OPEN_1);
		List<GoodsVO> hotGoodsList = this.goodsDao.queryHotGoodsByCategoryId(vo);
		for(GoodsVO goods : hotGoodsList){
			String businessId = goods.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				goods.setPcurl(fsList.get(0).getUrl());
			}
		}
		map.put("hotGoodsList", hotGoodsList);
		return map;
	}

	/**
	 * 根据产品类型ID获取产品类型信息
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getGoodsCategoryById(GoodsCategoryVO goodsCategoryVO){
		ModelMap map = new ModelMap();
		map.put("goodsCategory", goodsCategoryDao.getGoodsCategory(goodsCategoryVO));
		return map;
	}
}
