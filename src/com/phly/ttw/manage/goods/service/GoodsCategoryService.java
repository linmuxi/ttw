/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.dao.GoodsCategoryDao;
import com.phly.ttw.manage.goods.model.CategoryRpVO;
import com.phly.ttw.manage.goods.model.GoodsCategoryVO;

/**
 * 商品类型模块服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class GoodsCategoryService extends ServiceBase{

	//private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private GoodsCategoryDao goodsCategoryDao;
	
	/**
	 * 查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryList(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.goodsCategoryDao.getGoodsCategoryCount(goodsCategoryVO);
		if(count > 0){
			List<GoodsCategoryVO> list = this.goodsCategoryDao.queryGoodsCategoryList(goodsCategoryVO);
			//查询父分类
			for(GoodsCategoryVO vo : list){
				GoodsCategoryVO parentVO = new GoodsCategoryVO();
				parentVO.setId(vo.getParentId());
				if("".equals(vo.getParentId())){
					parentVO.setName("根分类");
				}else{
					parentVO = this.goodsCategoryDao.getGoodsCategory(parentVO);
				}
				vo.setParentGoodsCategory(parentVO);
			}
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, goodsCategoryVO.getPageNo());
			model.put(ROWCOUNT, goodsCategoryVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 查询商品分类列表排序、分页
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryListByCategorySortPage(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		int count = 0;
		
		List<GoodsCategoryVO> categoryList = this.goodsCategoryDao.queryGoodsCategoryListByCategorySortPage(goodsCategoryVO);
		if(categoryList != null && categoryList.size() > 0){
			count = this.goodsCategoryDao.queryGoodsCategoryListByCategorySort(goodsCategoryVO).size();
		}
		model.put(ROWS, categoryList);
		model.put(TOTAL, count);
		model.put(CURRENT, goodsCategoryVO.getPageNo());
		model.put(ROWCOUNT, goodsCategoryVO.getPageSize());
		return model;
	}
	
	
	
	
	/**
	 * 根据ID查询商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		GoodsCategoryVO vo = null;
		if("".equals(goodsCategoryVO.getId())){
			vo = goodsCategoryVO;
		}else{
			vo = this.goodsCategoryDao.getGoodsCategory(goodsCategoryVO);
			
			CategoryRpVO rpVO = new CategoryRpVO();
			rpVO.setCategoryId(vo.getId());
			List<CategoryRpVO> rpList = this.goodsCategoryDao.queryCategoryRpListByCategoryId(rpVO);
			vo.setMoreParentCategoryList(rpList);
		}
		model.put("result",vo);
		return model;
	}
	
	/**
	 * 查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getParentGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		GoodsCategoryVO vo = null;
		if("".equals(goodsCategoryVO.getId())){
			vo = goodsCategoryVO;
			vo.setParentId("");
		}else{
			vo = this.goodsCategoryDao.getGoodsCategory(goodsCategoryVO);
		}
		model.put("vo",vo);
		model.put("result", this.goodsCategoryDao.queryGoodsCategoryListByParentId(vo));
		return model;
	} 
	
	/**
	 * 查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap getChildGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		GoodsCategoryVO vo = null;
		if("".equals(goodsCategoryVO.getId())){
			vo = goodsCategoryVO;
		}else{
			vo = this.goodsCategoryDao.getGoodsCategory(goodsCategoryVO);
		}
		vo.setParentId(vo.getId());
		model.put("vo",vo);
		model.put("result", this.goodsCategoryDao.queryGoodsCategoryListByParentId(vo));
		return model;
	} 
	
	/**
	 * 根据分类父ID查询商品分类列表
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryListByParentId(GoodsCategoryVO goodsCategoryVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		GoodsCategoryVO vo = null;
		if("".equals(goodsCategoryVO.getId())){
			vo = goodsCategoryVO;
			vo.setParentId("");
		}else{
			vo = this.goodsCategoryDao.getGoodsCategory(goodsCategoryVO);
		}
		vo.setParentId(vo.getId());
		model.put("vo",vo);
		model.put("result", this.goodsCategoryDao.queryGoodsCategoryListByParentId(vo));
		return model;
	}
	
	
	/**
	 * 添加商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap addGoodsCategory(GoodsCategoryVO goodsCategoryVO){
		ModelMap model= new ModelMap();
		if(this.goodsCategoryDao.getGoodsCategory(goodsCategoryVO) == null){
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			
			if(StringUtils.isEmpty(goodsCategoryVO.getId())){
				goodsCategoryVO.setId(UUID.randomUUID().toString());
			}
			
			goodsCategoryVO.setCreator(userVO.getAccount());
			goodsCategoryVO.setCreateDate(new Timestamp(new Date().getTime()));
			goodsCategoryVO.setUpdater(userVO.getAccount());
			goodsCategoryVO.setUpdateTime(new Timestamp(new Date().getTime()));
			model.put("result", this.goodsCategoryDao.addGoodsCategory(goodsCategoryVO));
			
			//添加更多父分类
			String moreParentCategory = goodsCategoryVO.getMoreParentCategory();
			if(StringUtils.isNotEmpty(moreParentCategory)){
				//删除旧数据
				CategoryRpVO rpVO = new CategoryRpVO();
				rpVO.setCategoryId(goodsCategoryVO.getId());
				this.goodsCategoryDao.delCategoryRp(rpVO);
				
				String [] categoryStrArr = moreParentCategory.split(","); 
				for(String category : categoryStrArr){
					String [] categoryDataArr = category.split("#");
					rpVO = new CategoryRpVO();
					rpVO.setId(UUID.randomUUID().toString());
					rpVO.setCategoryId(goodsCategoryVO.getId());
					rpVO.setParentCategoryId(categoryDataArr[0]);
					rpVO.setParentCategoryName(categoryDataArr[1]);
					this.goodsCategoryDao.addCategoryRp(rpVO);
				}
			}
		}else{
			model.put("result", false);
			model.put("remark", "该商品分类已经存在。");
		}
		return model;
	}
	
	
	/**
	 * 修改商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap updateGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		ModelMap model = new ModelMap();
		GoodsCategoryVO paramVO = new GoodsCategoryVO();
		paramVO.setName(goodsCategoryVO.getName());
		GoodsCategoryVO vo = this.goodsCategoryDao.getGoodsCategory(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getId(), goodsCategoryVO.getId())){
			model.put("result", false);
			model.put("remark", "该商品分类已经存在");
		}else{
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
			model.put("result", this.goodsCategoryDao.updateGoodsCategory(goodsCategoryVO));
			
			//添加更多父分类
			String moreParentCategory = goodsCategoryVO.getMoreParentCategory();
			if(StringUtils.isNotEmpty(moreParentCategory)){
				//删除旧数据
				CategoryRpVO rpVO = new CategoryRpVO();
				rpVO.setCategoryId(goodsCategoryVO.getId());
				this.goodsCategoryDao.delCategoryRp(rpVO);
				
				String [] categoryStrArr = moreParentCategory.split(","); 
				for(String category : categoryStrArr){
					String [] categoryDataArr = category.split("#");
					rpVO = new CategoryRpVO();
					rpVO.setId(UUID.randomUUID().toString());
					rpVO.setCategoryId(goodsCategoryVO.getId());
					rpVO.setParentCategoryId(categoryDataArr[0]);
					rpVO.setParentCategoryName(categoryDataArr[1]);
					this.goodsCategoryDao.addCategoryRp(rpVO);
				}
			}
		}
		return model;
	}
	
	/**
	 * 删除商品分类
	 * @param goodsCategoryVO
	 * @return
	 */
	public ModelMap delGoodsCategory(GoodsCategoryVO goodsCategoryVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = goodsCategoryVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					goodsCategoryVO = new GoodsCategoryVO();
					goodsCategoryVO.setId(id);
					flag = this.goodsCategoryDao.delGoodsCategory(goodsCategoryVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
}
