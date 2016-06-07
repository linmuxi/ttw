/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.IFormService;
import com.phly.common.activiti.utils.ActivitiUtil;
import com.phly.common.base.dao.FileStoreDao;
import com.phly.common.base.model.FileStoreVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.common.util.SerialNumberUtil;
import com.phly.ttw.manage.goods.dao.BrandDao;
import com.phly.ttw.manage.goods.dao.GoodsAttributeDao;
import com.phly.ttw.manage.goods.dao.GoodsCategoryDao;
import com.phly.ttw.manage.goods.dao.GoodsDao;
import com.phly.ttw.manage.goods.model.BrandVO;
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
public class GoodsService extends ServiceBase implements IFormService {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	private static final String ACT_FORM_SERVICE = "com.phly.ttw.manage.goods.service.GoodsService";

	private static final String ACT_FORM_PAGE = "/page/ttw/manage/goods/goodsDetail.jsp";

	private static final String CATEGORY = "CATEGORY";

	private static final String BRAND = "BRAND";

	@Resource
	private GoodsDao goodsDao;

	@Resource
	private GoodsCategoryDao goodsCategoryDao;

	@Resource
	private BrandDao brandDao;

	@Resource
	private FileStoreDao fileStoreDao;

	@Resource
	private GoodsAttributeDao goodsAttributeDao;

	@Resource
	private ActivitiUtil activitiUtil;

	/**
	 * 查询商品列表
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryGoodsList(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		model.put(TOTAL, 0);
		int count = this.goodsDao.getGoodsCount(goodsVO);
		if (count > 0) {
			List<GoodsVO> list = this.goodsDao.queryGoodsList(goodsVO);
			model.put(ROWS, list);
			model.put(TOTAL, count);
			model.put(CURRENT, goodsVO.getPageNo());
			model.put(ROWCOUNT, goodsVO.getPageSize());
		}
		return model;
	}

	/**
	 * 查询商品类型列表
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryGoodsCategoryList() {
		ModelMap model = new ModelMap();

		GoodsCategoryVO goodsCategoryVO = new GoodsCategoryVO();
		goodsCategoryVO.setSortFieldName(" ID ASC, ");
		goodsCategoryVO.setSortType(" SORT ASC ");
		List<GoodsCategoryVO> categoryList = this.goodsCategoryDao
				.queryGoodsCategoryListByCategorySort(goodsCategoryVO);
		model.put(CATEGORY, categoryList);

		return model;
	}

	/**
	 * 查询商品品牌列表
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap queryBrandList() {
		ModelMap model = new ModelMap();

		BrandVO brandVO = new BrandVO();
		brandVO.setSortFieldName("SORT");
		brandVO.setSortType("ASC");
		List<BrandVO> brandList = this.brandDao.queryBrandList(brandVO);
		model.put(BRAND, brandList);

		return model;
	}

	/**
	 * 根据ID查询商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap getGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();

		// SysUserVO userVO = RequestContextUtil.getCurrentUser();
		// if(userVO == null){
		// model.put("result", false);
		// model.put("remark", "用户未登录。");
		// return model;
		// }
		GoodsVO vo = this.goodsDao.getGoods(goodsVO);
		List<GoodsAttributeVO> attrList = null;
		// if ("".equals(goodsVO.getId())) {
		// vo = goodsVO;
		// } else {
		// vo = this.goodsDao.getGoods(goodsVO);
		if (null == vo) {
			vo = goodsVO;
		} else {
			if (vo != null) {
				// 查询产品属性值
				GoodsAttributeVO goodsAttributeVO = new GoodsAttributeVO();
				goodsAttributeVO.setGoodsId(vo.getId());
				goodsAttributeVO.setGoodsTypeId(vo.getGoodsCategoryId());
				attrList = this.goodsAttributeDao.queryAllGoodsAttributeListByGoodsId(goodsAttributeVO);

				// 查询产品图片
				String businessId = vo.getId();
				FileStoreVO fsVO = new FileStoreVO();
				fsVO.setBusinessId(businessId);
				fsVO.setType(FileStoreVO.FILE_TYPE_GOODSIMG);
				List<FileStoreVO> fsList = fileStoreDao.queryFileStoreListNoPage(fsVO);
				if (fsList != null) {
					String pcurl = "";
					for (int i = 0; i < fsList.size(); i++) {
						FileStoreVO fileStoreVO = fsList.get(i);
						if (i == 0) {
							pcurl += fileStoreVO.getId() + "#" + fileStoreVO.getUrl();
						} else {
							pcurl += "," + fileStoreVO.getId() + "#" + fileStoreVO.getUrl();
						}
					}
					vo.setPcurl(pcurl);
				}
			}
		}
		model.put("result", vo);
		model.put("attrList", attrList);
		return model;
	}

	/**
	 * 添加商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap addGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		if (StringUtils.isEmpty(goodsVO.getId())) {
			goodsVO.setId(UUID.randomUUID().toString());
		}
		goodsVO.setCreator(userVO.getAccount());
		goodsVO.setCreateDate(new Timestamp(new Date().getTime()));
		goodsVO.setUpdater(userVO.getUsername());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));
		goodsVO.setApprovalState(2);// 审核状态： -1：审核未通过 1：审核通过 2：审核中

		//查询商品分类的 分类编码
		GoodsCategoryVO categoryVO = new GoodsCategoryVO();
		categoryVO.setId(goodsVO.getGoodsCategoryId());
		categoryVO = goodsCategoryDao.getGoodsCategory(categoryVO);
		String prefix = categoryVO.getCategoryCode();
		prefix = SerialNumberUtil.getSerialNumber(prefix);
		//查询当前最新的 商品编码
		String serialNumber = goodsDao.queryGoodsSerialNumber(prefix);

		serialNumber = SerialNumberUtil.nextSerialNumber(serialNumber, prefix, 4);

		goodsVO.setSerialNumber(serialNumber);

		model.put("result", this.goodsDao.addGoods(goodsVO));

		// 保存商品属性值
		saveGoodsAttributeVal(goodsVO.getId(), goodsVO.getGoodsAttrsVals());

		// 是否已发起流程
		boolean flag = activitiUtil
				.getTaskByBusinessKey(ACT_FORM_SERVICE + ";" + ACT_FORM_PAGE + ";" + goodsVO.getId());

		if (!flag) {
			// 更新业务表单审核状态
			// model.put("result", this.goodsDao.updateGoodsApproval(goodsVO));

			// 保存流程变量
			Map<String, Object> vars = new HashMap<String, Object>();
			vars.put("goodsVO", goodsVO);

			// 查询角色设置流程处理人
			vars.put("groupIdentity", this.activitiUtil.getApprover("产品上架", 1).getRoleName());

			// 业务表单服务类
			goodsVO.setActFormService(ACT_FORM_SERVICE);
			// 业务表单明细页面,供审批查看
			goodsVO.setActFormPage(ACT_FORM_PAGE);
			activitiUtil.startWorkFlowByFormName("产品上架", goodsVO.getActFormService() + ";" + goodsVO.getActFormPage()
					+ ";" + goodsVO.getId(), vars);
		}
		return model;
	}

	/***
	 * 保存商品属性值
	 * 
	 * @param goodsId
	 * @param goodsAttrsVals
	 * @return
	 */
	private boolean saveGoodsAttributeVal(String goodsId, String goodsAttrsVals) {
		// 根据商品ID删除商品属性值
		GoodsAttributeVO goodsAttributeVO = new GoodsAttributeVO();
		goodsAttributeVO.setGoodsId(goodsId);
		this.goodsAttributeDao.delGoodsAttributeByGoodsId(goodsAttributeVO);

		boolean flag = false;
		String[] goodsAttrArr = goodsAttrsVals.split(",");
		for (String goodsAttr : goodsAttrArr) {
			String[] attrArr = goodsAttr.split("#");
			if (attrArr != null && attrArr.length == 2) {
				GoodsAttributeVO vo = new GoodsAttributeVO();
				vo.setGoodsId(goodsId);
				vo.setId(attrArr[0]);
				vo.setAttrVal(attrArr[1]);
				this.goodsAttributeDao.addGoodsAttributeVal(vo);
			}
		}
		return flag;
	}

	/**
	 * 下架商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap fromShelvesGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		model.put("result", false);

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		// goodsVO.setApprovalState(0);//临时保存
		goodsVO.setIsSpecificationsOpen("2");// 下架
		goodsVO.setUpdater(userVO.getAccount());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));

		String ids = goodsVO.getId();
		//
		if (StringUtils.isNotEmpty(ids)) {
			// 批量删除
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (StringUtils.isNotEmpty(id)) {
					goodsVO.setId(id);

					// 更新业务表单审核状态
					model.put("result", this.goodsDao.updateSpecificationsOpen(goodsVO));

					/*
					 * boolean flag =
					 * activitiUtil.getTaskByBusinessKey(ACT_FORM_SERVICE+";"+ACT_FORM_PAGE+";"+goodsVO.getId());
					 * 
					 * if(!flag){
					 * //更新业务表单审核状态
					 * model.put("result", this.goodsDao.updateGoodsApproval(goodsVO));
					 * 
					 * //保存流程变量
					 * Map<String,Object> vars = new HashMap<String,Object>();
					 * vars.put("goodsVO", goodsVO);
					 * vars.put("groupIdentity", "商品审核经理");
					 * 
					 * //申请人
					 * //goodsVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
					 * //业务表单服务类
					 * goodsVO.setActFormService(ACT_FORM_SERVICE);
					 * //业务表单明细页面,供审批查看
					 * goodsVO.setActFormPage(ACT_FORM_PAGE);
					 * activitiUtil.startWorkFlowByFormName("产品下架",
					 * goodsVO.getActFormService()+";"+goodsVO.getActFormPage()+";"+goodsVO.getId(), vars);
					 * }
					 */
				}
			}
		}

		return model;
	}

	/**
	 * 上架商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap shelvesGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		model.put("result", false);

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		// goodsVO.setApprovalState(2);//审核中
		goodsVO.setIsSpecificationsOpen("1");// 上架
		goodsVO.setUpdater(userVO.getAccount());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));

		String ids = goodsVO.getId();
		//
		if (StringUtils.isNotEmpty(ids)) {
			// 批量上架
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (StringUtils.isNotEmpty(id)) {
					goodsVO.setId(id);

					// 更新业务表单审核状态
					model.put("result", this.goodsDao.updateSpecificationsOpen(goodsVO));

					/*
					 * boolean flag =
					 * activitiUtil.getTaskByBusinessKey(ACT_FORM_SERVICE+";"+ACT_FORM_PAGE+";"+goodsVO.getId());
					 * 
					 * if(!flag){
					 * //更新业务表单审核状态
					 * model.put("result", this.goodsDao.updateGoodsApproval(goodsVO));
					 * 
					 * //保存流程变量
					 * Map<String,Object> vars = new HashMap<String,Object>();
					 * vars.put("goodsVO", goodsVO);
					 * vars.put("groupIdentity", this.activitiUtil.getApprover("产品上架", 1).getRoleName());
					 * 
					 * //申请人
					 * //goodsVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
					 * //业务表单服务类
					 * goodsVO.setActFormService(ACT_FORM_SERVICE);
					 * //业务表单明细页面,供审批查看
					 * goodsVO.setActFormPage(ACT_FORM_PAGE);
					 * activitiUtil.startWorkFlowByFormName("产品上架",
					 * goodsVO.getActFormService()+";"+goodsVO.getActFormPage()+";"+goodsVO.getId(), vars);
					 * }
					 */
				}
			}
		}

		return model;
	}

	/***
	 * 发起产品审核流程
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap startGoodsWorkflow(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		model.put("result", false);

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}

		String id = goodsVO.getId();
		//
		if (StringUtils.isNotEmpty(id)) {
			String workflowId = "";

			boolean flag = activitiUtil.getTaskByBusinessKey(ACT_FORM_SERVICE + ";" + ACT_FORM_PAGE + ";"
					+ goodsVO.getId());

			if (!flag) {
				goodsVO.setApprovalState(2);// 审核中
				// 更新业务表单审核状态
				model.put("result", this.goodsDao.updateGoodsApproval(goodsVO));

				// 保存流程变量
				Map<String, Object> vars = new HashMap<String, Object>();
				vars.put("goodsVO", goodsVO);
				vars.put("groupIdentity", this.activitiUtil.getApprover("产品上架", 1).getRoleName());

				// 申请人
				// goodsVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
				// 业务表单服务类
				goodsVO.setActFormService(ACT_FORM_SERVICE);
				// 业务表单明细页面,供审批查看
				goodsVO.setActFormPage(ACT_FORM_PAGE);
				workflowId = activitiUtil.startWorkFlowByFormName("产品上架",
						goodsVO.getActFormService() + ";" + goodsVO.getActFormPage() + ";" + goodsVO.getId(), vars);
			}

			// 是否成功发起流程
			model.put("result", StringUtils.isNotEmpty(workflowId));
		}

		return model;
	}

	/**
	 * 修改商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap updateGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		goodsVO.setCreator(userVO.getAccount());
		goodsVO.setCreateDate(new Timestamp(new Date().getTime()));
		goodsVO.setUpdater(userVO.getAccount());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));
		model.put("result", this.goodsDao.updateGoods(goodsVO));

		// 保存商品属性值
		saveGoodsAttributeVal(goodsVO.getId(), goodsVO.getGoodsAttrsVals());

		// 是否上架
		/*
		 * if("1".equals(goodsVO.getIsSpecificationsOpen())){
		 * boolean flag = activitiUtil.getTaskByBusinessKey(ACT_FORM_SERVICE+";"+ACT_FORM_PAGE+";"+goodsVO.getId());
		 * 
		 * if(!flag){
		 * //保存流程变量
		 * Map<String,Object> vars = new HashMap<String,Object>();
		 * vars.put("goodsVO", goodsVO);
		 * 
		 * //申请人
		 * //goodsVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
		 * //业务表单服务类
		 * goodsVO.setActFormService("com.phly.ttw.manage.goods.service.GoodsService");
		 * //业务表单明细页面,供审批查看
		 * goodsVO.setActFormPage("/page/platform/activiti/vacationRequestDetail.jsp");
		 * activitiUtil.startWorkFlowByFormName("商品上架",
		 * goodsVO.getActFormService()+";"+goodsVO.getActFormPage()+";"+goodsVO.getId(), vars);
		 * }
		 * }
		 */
		return model;
	}

	/**
	 * 修改商品价格
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap updateGoodsPrice(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();

		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if (userVO == null) {
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		goodsVO.setUpdater(userVO.getAccount());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));
		model.put("result", this.goodsDao.updateGoodsPrice(goodsVO));

		return model;
	}

	/**
	 * 删除商品
	 * 
	 * @param goodsVO
	 * @return
	 */
	public ModelMap delGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = goodsVO.getId();
		//
		if (StringUtils.isNotEmpty(ids)) {
			// 批量删除
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (StringUtils.isNotEmpty(id)) {
					goodsVO = new GoodsVO();
					goodsVO.setId(id);
					flag = this.goodsDao.delGoods(goodsVO);
				}
			}
		}
		model.put("result", flag);
		return model;
	}

	@Override
	public boolean updateStatus(Map<String, Object> params) {
		boolean flag = true;
		// 当前处理任务的key
		String tdk = (String) params.get("taskDefinitionKey");
		// 获取流程变量
		@SuppressWarnings("unchecked")
		Map<String, Object> vars = (Map<String, Object>) params.get("processVariables");
		// 获取审批结果
		String approved = (String) vars.get("approved");
		GoodsVO goodsVO = new GoodsVO();
		// 获取业务对象ID
		goodsVO.setId((String) params.get("businessKey"));
		// 根据当前任务节点和审批意见进行业务表单状态判断处理
		if (tdk.equalsIgnoreCase("usertask1")) {// 经理审批
			if (null != approved && StringUtils.equalsIgnoreCase(approved, "1")) {
				goodsVO.setApprovalState(1);// 审核通过
				// goodsVO.setIsSpecificationsOpen("1");
			} else {
				goodsVO.setApprovalState(-1);// 审批不通过
				// goodsVO.setIsSpecificationsOpen("2");//上架审核不通过，产品状态改回“下架”
			}
			// 更新业务表单状态
			flag = this.goodsDao.updateGoodsApproval(goodsVO);
			if (!flag) {
				logger.error("更新产品状态失败");
			}
		}
		return flag;
	}
}
