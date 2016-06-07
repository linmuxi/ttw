/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.dao.GoodsAttributeDao;
import com.phly.ttw.manage.goods.dao.GoodsCategoryDao;
import com.phly.ttw.manage.goods.model.GoodsAttributeVO;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;

/**
 * 商品属性模块服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class GoodsAttributeService extends ServiceBase{

	//private final Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String CATEGORY = "CATEGORY";
	
	private static final String GOODSTYPEID = "GOODSTYPEID";
	
	@Resource
	private GoodsAttributeDao goodsAttributeDao;
	
	@Resource
	private GoodsCategoryDao goodsCategoryDao;
	
	/**
	 * 查询商品属性列表
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap queryGoodsAttributeList(GoodsAttributeVO goodsAttributeVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.goodsAttributeDao.getGoodsAttributeCount(goodsAttributeVO);
		if(count > 0){
			List<GoodsAttributeVO> list = this.goodsAttributeDao.queryGoodsAttributeList(goodsAttributeVO);
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, goodsAttributeVO.getPageNo());
			model.put(ROWCOUNT, goodsAttributeVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 查询商品属性列表
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap initGoodsAttributeCategory(GoodsAttributeVO goodsAttributeVO){
		ModelMap model = new ModelMap();
		
		if(StringUtils.isNotEmpty(goodsAttributeVO.getId())){
			goodsAttributeVO = this.goodsAttributeDao.getGoodsAttribute(goodsAttributeVO);
		}
		
		List<GoodsAttributeVO> list = this.goodsAttributeDao.queryGoodsAttributeListByGoodsTypeId(goodsAttributeVO);
		model.put(ROWS, list);
		
		GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
		goodsCategoryVO.setSortFieldName(" ID ASC, ");
		goodsCategoryVO.setSortType(" SORT ASC ");
		List<GoodsCategoryVO> categoryList = this.goodsCategoryDao.queryGoodsCategoryListByCategorySort(goodsCategoryVO);
		model.put(CATEGORY, categoryList);
		
		model.put(GOODSTYPEID, goodsAttributeVO != null ? goodsAttributeVO.getGoodsTypeId() : "");
		return model;
	}
	
	/**
	 * 根据产品类型查询产品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap queryGoodsAttributeListByGoodsTypeId(GoodsAttributeVO goodsAttributeVO){
		ModelMap model = new ModelMap();
		List<GoodsAttributeVO> list = this.goodsAttributeDao.queryGoodsAttributeListByGoodsTypeId(goodsAttributeVO);
		model.put(ROWS, list);
		return model;
	}
	
	
	
	/**
	 * 添加商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap addGoodsAttribute(GoodsAttributeVO goodsAttributeVO){
		ModelMap model= new ModelMap();
		/*
		if(this.goodsAttributeDao.getGoodsCategory(goodsCategoryVO) == null){
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			goodsCategoryVO.setCreator(userVO.getAccount());
			goodsCategoryVO.setCreateDate(new Timestamp(new Date().getTime()));
			goodsCategoryVO.setUpdater(userVO.getAccount());
			goodsCategoryVO.setUpdateTime(new Timestamp(new Date().getTime()));
			model.put("result", this.goodsCategoryDao.addGoodsCategory(goodsCategoryVO));
		}else{
			model.put("result", false);
			model.put("remark", "该商品分类已经存在。");
		}
		*/
		return model;
	}
	
	/**
	 * 查询商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap getGoodsAttribute(GoodsAttributeVO goodsAttributeVO) {
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		
		GoodsAttributeVO vo = null;
		if("".equals(goodsAttributeVO.getId())){
			vo = goodsAttributeVO;
		}else{
			vo = this.goodsAttributeDao.getGoodsAttribute(goodsAttributeVO);
		}
		model.put("result",vo);
		return model;
	}
	
	/**
	 * 修改商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap saveGoodsAttribute(GoodsAttributeVO goodsAttributeVO) {
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		
		boolean result = false;
		
		String goodsTypeName = goodsAttributeVO.getGoodsTypeName();
		goodsTypeName = goodsTypeName.replaceAll("└", "").replaceAll("—", "").trim();
		goodsAttributeVO.setGoodsTypeName(goodsTypeName);
		if(goodsAttributeVO != null && StringUtils.isNotEmpty(goodsAttributeVO.getId())){
			result = this.goodsAttributeDao.updateGoodsAttribute(goodsAttributeVO);
		}else{
			result = this.goodsAttributeDao.addGoodsAttribute(goodsAttributeVO);
		}
		
		model.put("result", result);
		return model;
	}
	
	/**
	 * 删除商品属性
	 * @param goodsAttributeVO
	 * @return
	 */
	public ModelMap delGoodsAttribute(GoodsAttributeVO goodsAttributeVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = goodsAttributeVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					goodsAttributeVO = new GoodsAttributeVO();
					goodsAttributeVO.setId(id);
					flag = this.goodsAttributeDao.delGoodsAttribute(goodsAttributeVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
}
