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

import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.dao.BrandDao;
import com.phly.ttw.manage.goods.model.BrandVO;

/**
 * s品牌服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class BrandService extends ServiceBase{

	//private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private BrandDao brandDao;
	
	@Resource
	private FileStoreDao fileStoreDao;
	
	/**
	 * 查询品牌列表
	 * @param brandVO
	 * @return
	 */
	public ModelMap queryBrandList(BrandVO brandVO){
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.brandDao.getBrandCount(brandVO);
		if(count > 0){
			List<BrandVO> list = this.brandDao.queryBrandList(brandVO);
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, brandVO.getPageNo());
			model.put(ROWCOUNT, brandVO.getPageSize());
		}
		return model;
	}
	
	/**
	 * 根据ID查询品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap getBrand(BrandVO brandVO){
		ModelMap model = new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		BrandVO vo = null;
		if("".equals(brandVO.getId())){
			vo = brandVO;
		}else{
			vo = this.brandDao.getBrand(brandVO);
			
			String businessId = vo.getId();
			FileStoreVO fsVO = new FileStoreVO();
			fsVO.setBusinessId(businessId);
			List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
			if(fsList != null){
				String pcurl = "";
				for(int i=0; i< fsList.size(); i++){
					FileStoreVO fileStoreVO = fsList.get(i);
					if(i == 0){
						pcurl += fileStoreVO.getId()+"#"+fileStoreVO.getUrl();
					}else{
						pcurl += "," + fileStoreVO.getId()+"#"+fileStoreVO.getUrl();
					}
				}
				vo.setLogoPath(pcurl);
			}
		}
		model.put("result",vo);
		return model;
	}
	
	
	
	
	/**
	 * 添加品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap addBrand(BrandVO brandVO){
		ModelMap model= new ModelMap();
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		if(StringUtils.isEmpty(brandVO.getId())){
			brandVO.setId(UUID.randomUUID().toString());
		}
		brandVO.setCreator(userVO.getAccount());
		brandVO.setCreateDate(new Timestamp(new Date().getTime()));
		brandVO.setUpdater(userVO.getAccount());
		brandVO.setUpdateTime(new Timestamp(new Date().getTime()));
		model.put("result", this.brandDao.addBrand(brandVO));
		
		return model;
	}
	
	
	/**
	 * 修改品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap updateBrand(BrandVO brandVO) {
		ModelMap model = new ModelMap();
		BrandVO paramVO = new BrandVO();
		paramVO.setBrandName(brandVO.getBrandName());
		BrandVO vo = this.brandDao.getBrand(paramVO);
		if(vo != null && !StringUtils.equalsIgnoreCase(vo.getId(), brandVO.getId())){
			model.put("result", false);
			model.put("remark", "该品牌已经存在");
		}else{
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				model.put("result", false);
				model.put("remark", "用户未登录。");
				return model;
			}
			brandVO.setCreator(userVO.getAccount());
			brandVO.setCreateDate(new Timestamp(new Date().getTime()));
			brandVO.setUpdater(userVO.getAccount());
			brandVO.setUpdateTime(new Timestamp(new Date().getTime()));
			model.put("result", this.brandDao.updateBrand(brandVO));
		}
		return model;
	}
	
	/**
	 * 删除品牌
	 * @param brandVO
	 * @return
	 */
	public ModelMap delBrand(BrandVO brandVO) {
		ModelMap model = new ModelMap();
		
		boolean flag = false;
		String ids = brandVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					brandVO = new BrandVO();
					brandVO.setId(id);
					flag = this.brandDao.delBrand(brandVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}
}
