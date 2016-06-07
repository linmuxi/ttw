/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.portal.product.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.ttw.manage.goods.dao.GoodsAttributeDao;
import com.phly.ttw.manage.goods.dao.GoodsCategoryDao;
import com.phly.ttw.manage.goods.dao.GoodsDao;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;
import com.phly.ttw.manage.goods.model.GoodsVO;

/**
 * 商品服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class ProductService extends ServiceBase{

	//private final Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	private GoodsDao goodsDao;
	
	@Resource
	private FileStoreDao fileStoreDao;
	
	@Resource
	private GoodsAttributeDao goodsAttributeDao;

	@Resource
	private GoodsCategoryDao goodsCategoryDao;
	
	/**
	 * 查询商品信息
	 * @param productId
	 * @return
	 */
	public ModelMap queryProductInfo(String productId, String menuId){
		ModelMap model = new ModelMap();
		//获取商品信息
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setId(productId);
		goodsVO = goodsDao.getGoods(goodsVO);
		
		String goodsCategoryName = goodsVO.getGoodsCategoryName();
		if(StringUtils.isNotEmpty(goodsCategoryName)){
			goodsCategoryName = goodsCategoryName.replaceAll("└", "");
			goodsVO.setGoodsCategoryName(goodsCategoryName);
		}
		
		//用来显示菜单
		GoodsCategoryVO categoryVO = new GoodsCategoryVO();
		if(StringUtils.isNotEmpty(menuId)){
			categoryVO.setId(menuId);
			categoryVO = this.goodsCategoryDao.getGoodsCategory(categoryVO);
		}
		
		//产品属性信息
		//查询产品属性值
		GoodsAttributeVO goodsAttributeVO = new GoodsAttributeVO();
		goodsAttributeVO.setGoodsId(goodsVO.getId());
		List<GoodsAttributeVO> attrList = this.goodsAttributeDao.queryGoodsAttributeListByGoodsId(goodsAttributeVO);
		
		//查询推荐数据
		/*GoodsVO seachParamVO = new GoodsVO();
		seachParamVO.setGoodsCategoryId(goodsVO.getGoodsCategoryId());
		seachParamVO.setRecommended("1");
		seachParamVO.setIsSpecificationsOpen("1");//查询上架产品
		List<GoodsVO> recommendedList = this.goodsDao.queryGoodsListByRecommendedAndCategoryId(seachParamVO);
		for(GoodsVO vo : recommendedList){
			String businessId = vo.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				vo.setPcurl(fsList.get(0).getUrl());
			}
		}*/
		
		//获取商品图片信息
		FileStoreVO fsVO = new FileStoreVO();
		fsVO.setBusinessId(productId);
		List<FileStoreVO> productList = fileStoreDao.queryFileStoreListNoPage(fsVO);
		//
		model.put("product", goodsVO);
		model.put("goodsCategory", categoryVO);
		model.put("attrList", attrList);//产品属性
		model.put("productImage", productList);
		//model.put("recommendedList", recommendedList);//产品推荐
		return model;
	}
	
	
	/**
	 * 首页根据关键字查找
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryProductByKey(GoodsVO goodsVO){
		ModelMap model = new ModelMap();
		//产品类型信息
		GoodsCategoryVO categoryVO = new GoodsCategoryVO();
		//判断是否根据分类、关键字查询
		if(StringUtils.isNotEmpty(goodsVO.getGoodsCategoryId())){
			categoryVO.setId(goodsVO.getGoodsCategoryId());
			categoryVO = this.goodsCategoryDao.getGoodsCategory(categoryVO);
			GoodsCategoryVO searchChildVO = new GoodsCategoryVO();
			searchChildVO.setParentId(categoryVO.getId());
			//查询分类下子分类
			categoryVO.setChildGoodsCategoryList(goodsCategoryDao.queryGoodsCategoryListByParentId(searchChildVO));
		}
		
		
		//获取商品数量
		int count = this.goodsDao.getGoodsCount(goodsVO);
		
		//获取商品列表
		goodsVO.setPageSize(12);
		List<GoodsVO> goodsList = this.goodsDao.queryGoodsList(goodsVO);
		
		//
		model.put("count", count);//商品总数量
		model.put("goodsList", goodsList);//商品列表（分页）
		model.put("goodsCategory", categoryVO);//商品类型信息
		model.put("search", goodsVO.getSearchPhrase());
		return model;
	}
	
	/**
	 * 查询商品列表根据分类id
	 * @param goodsCategoryId
	 * @return
	 */
	public ModelMap queryProductByCategoryId(GoodsVO goodsVO){
		ModelMap model = new ModelMap();
		//产品类型信息
		GoodsCategoryVO categoryVO = new GoodsCategoryVO();
		categoryVO.setId(goodsVO.getGoodsCategoryId());
		categoryVO = this.goodsCategoryDao.getGoodsCategory(categoryVO);
		
		//查询产品属性值
		GoodsAttributeVO goodsAttributeVO = new GoodsAttributeVO();
		goodsAttributeVO.setGoodsTypeId(goodsVO.getGoodsCategoryId());
		List<GoodsAttributeVO> attrList = this.goodsAttributeDao.queryGoodsAttributeListByGoodsTypeId(goodsAttributeVO);
		
		//获取商品数量
		int count = this.goodsDao.getGoodsCountByCategoryId(goodsVO);
		
		//获取商品列表
		goodsVO.setPageSize(12);
		List<GoodsVO> goodsList = this.goodsDao.queryGoodsByCategoryId(goodsVO);
		
		//
		model.put("count", count);//商品总数量
		model.put("goodsList", goodsList);//商品列表（分页）
		model.put("goodsCategory", categoryVO);//商品类型信息
		model.put("attrList", attrList);//商品类型属性
		return model;
	}
	
	/**
	 * 查询商品列表根据分类id
	 * @param goodsCategoryId
	 * @return
	 */
	public ModelMap queryProductDataBySearchKey(GoodsVO goodsVO){
		ModelMap model = new ModelMap();
		//获取商品信息
		List<GoodsVO> goodsList = goodsDao.queryGoodsList(goodsVO);
		
		//商品总数量
		int count = goodsDao.getGoodsCount(goodsVO);
		
		model.put("count", count);
		model.put("productList", goodsList);
		model.put("search", goodsVO.getSearchPhrase());
		return model;
	}
	
	/**
	 * 查询商品列表根据分类id
	 * @param goodsCategoryId
	 * @return
	 */
	public ModelMap queryProductData(GoodsVO goodsVO){
		ModelMap model = new ModelMap();
		//获取商品信息
		/*
		GoodsVO goodsVO = new GoodsVO();
		goodsVO.setGoodsCategoryId(goodsCategoryId);
		goodsVO.setPageNo(pageNumber);
		goodsVO.setPageSize(pageSize);
		*/
		List<GoodsVO> goodsList = goodsDao.queryGoodsByCategoryId(goodsVO);
		
		/*
		for(GoodsVO vo : goodsList){
			String businessId = vo.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				vo.setPcurl(fsList.get(0).getUrl());
			}
		}
		*/
		
		//商品总数量
		int count = goodsDao.getGoodsCountByCategoryId(goodsVO);
		
		model.put("count", count);
		model.put("productList", goodsList);
		model.put("search", goodsVO.getGoodsName());
		return model;
	}
	
	/**
	 * 查询商品列表商品数量根据分类id
	 * @param goodsCategoryId
	 * @return
	 */
	public ModelMap queryProductDataCount(GoodsVO goodsVO){
		ModelMap model = new ModelMap();
		//获取商品数量
		int count = this.goodsDao.getGoodsCountByCategoryId(goodsVO);
		
		model.put("count", count);
		return model;
	}
	
	/**
	 * 查询首页产品信息
	 * @return
	 */
	public ModelMap queryIndexProduceInfo(){
		ModelMap map = new ModelMap();
		//首页大屏推荐信息
		map.put("bpInfo", null);
		//推荐产品分类信息(前4名,根据产品推荐排名)
		map.put("goodsCategoryInfo", this.getGoodsCategoryList());
		GoodsVO vo = new GoodsVO();
		//平面设计推荐产品集合
		vo.setGoodsCategoryId("C16A8392492D11E5B93902004C4F4F50");
		map.put("pmsjInfo", getGoodsInfo(vo));
		//建站营销推荐产品集合
		vo.setGoodsCategoryId("25995D783F7911E5B93902004C4F4F50");
		map.put("jzyxInfo", getGoodsInfo(vo));
		//项目案例推荐产品集合
		vo.setGoodsCategoryId("BF111F684AFE11E59E3802004C4F4F50");
		map.put("xmalInfo", getGoodsInfo(vo));
		return map;
	}
	
	/**
	 * 查询首页产品信息
	 * @return
	 */
	public ModelMap queryRecommended(String goodsCategoryId){
		ModelMap map = new ModelMap();
		//查询推荐数据
		GoodsVO seachParamVO = new GoodsVO();
		seachParamVO.setGoodsCategoryId(goodsCategoryId);
		seachParamVO.setRecommended("1");
		seachParamVO.setIsSpecificationsOpen("1");//查询上架产品
		List<GoodsVO> recommendedList = this.goodsDao.queryGoodsListByRecommendedAndCategoryId(seachParamVO);
		/*
		for(GoodsVO vo : recommendedList){
			String businessId = vo.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				vo.setPcurl(fsList.get(0).getUrl());
			}
		}
		*/
		map.put("recommendedList", recommendedList);
		return map;
	}
	
	/**
	 * 查询首页产品信息
	 * @return
	 */
	public ModelMap queryMenu(String parentId){
		ModelMap map = new ModelMap();
		GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
		goodsCategoryVO.setParentId(parentId);
		map.put("menu", this.goodsCategoryDao.queryGoodsCategoryListByParentId(goodsCategoryVO));
		return map;
	}
	

	/**
	 * 查询首页滚动分类和推荐分类
	 * @return
	 */
	public Map<String,Object> getGoodsCategoryList(){
		Map<String,Object> map = new HashMap<String, Object>();
		GoodsCategoryVO vo = new GoodsCategoryVO();
		
		//首页滚动分类
		vo.setRecommended(null);
		vo.setScroll("1");
		map.put("scroll", this.queryHotGoodsCategoryList(vo));
		
		//首页推荐分类
		vo.setRecommended("1");
		vo.setScroll(null);
		map.put("recommend", this.queryHotGoodsCategoryList(vo));
		
		return map;		
	}

	public List<GoodsCategoryVO> queryHotGoodsCategoryList(GoodsCategoryVO vo){
		if(vo == null){
			return Collections.emptyList();
		}
		List<GoodsCategoryVO> list = this.goodsCategoryDao.queryHotGoodsCategoryList(vo);
		/*
		for(GoodsCategoryVO gc : list){
			String businessId = gc.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				gc.setPcurl(fsList.get(0).getUrl());
			}
		}
		*/
		return list;
	}
	
	
	/**
	 * 查询指定产品类型下的所有热门和推荐产品
	 * @param vo
	 * @return
	 */
	public Map<String,Object> getGoodsInfo(GoodsVO vo){
		Map<String,Object> map = new HashMap<String, Object>();
		//热门
		vo.setRecommended(null);
		vo.setHotsSale("1");
		vo.setIsSpecificationsOpen("1");//查询已经上架的产品
		map.put("hot", this.queryHotGoodsByCategoryId(vo));
		//推荐
		vo.setHotsSale(null);
		vo.setRecommended("1");
		map.put("recommend", this.queryHotGoodsByCategoryId(vo));
		return map;
	}
	
	
	/**
	 * 根据产品分类id查询热门推荐产品
	 * @param vo
	 * @return
	 */
	public List<GoodsVO> queryHotGoodsByCategoryId(GoodsVO vo){
		if(vo == null || StringUtils.isEmpty(vo.getGoodsCategoryId())){
			return Collections.emptyList();
		}
		List<GoodsVO> recommendedList = this.goodsDao.queryHotGoodsByCategoryId(vo);
		/*
		for(GoodsVO goods : recommendedList){
			String businessId = goods.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null && fsList.size() > 0){
				goods.setPcurl(fsList.get(0).getUrl());
			}
		}
		*/
		return recommendedList;
	}
}
