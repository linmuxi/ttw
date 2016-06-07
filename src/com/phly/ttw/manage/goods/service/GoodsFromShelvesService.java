/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.goods.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.IFormService;
import com.phly.common.activiti.utils.ActivitiUtil;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.goods.dao.GoodsDao;
import com.phly.ttw.manage.goods.model.GoodsVO;

/**
 * 商品服务类
 * 
 * @Description TODO
 * @author lihui
 * @since 2015年6月6日 下午11:43:26
 */
@Service
public class GoodsFromShelvesService extends ServiceBase implements IFormService{

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String ACT_FORM_SERVICE = "com.phly.ttw.manage.goods.service.GoodsFromShelvesService";
	
	private static final String ACT_FORM_PAGE = "/page/ttw/manage/goods/goodsDetail.jsp";
	
	
	@Resource
	private GoodsDao goodsDao;
	
	@Resource
	private ActivitiUtil activitiUtil;
	
	
	/**
	 * 下架商品
	 * @param goodsVO
	 * @return
	 */
	public ModelMap fromShelvesGoods(GoodsVO goodsVO) {
		ModelMap model = new ModelMap();
		model.put("result", false);
		
		SysUserVO userVO = RequestContextUtil.getCurrentUser();
		if(userVO == null){
			model.put("result", false);
			model.put("remark", "用户未登录。");
			return model;
		}
		goodsVO.setApprovalState(2);//审核中
		goodsVO.setIsSpecificationsOpen("4");//下架中
		goodsVO.setUpdater(userVO.getAccount());
		goodsVO.setUpdateTime(new Timestamp(new Date().getTime()));
		
		String ids = goodsVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					goodsVO.setId(id);
					
					boolean flag = activitiUtil.getTaskByBusinessKey(ACT_FORM_SERVICE+";"+ACT_FORM_PAGE+";"+goodsVO.getId());
					
					if(!flag){
						//更新业务表单审核状态
						model.put("result", this.goodsDao.updateGoodsApproval(goodsVO));
						
						//保存流程变量
						Map<String,Object> vars = new HashMap<String,Object>();
						vars.put("goodsVO", goodsVO);
						vars.put("groupIdentity", "商品审核经理");
						
						//申请人
						//goodsVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
						//业务表单服务类
						goodsVO.setActFormService(ACT_FORM_SERVICE);
						//业务表单明细页面,供审批查看
						goodsVO.setActFormPage(ACT_FORM_PAGE);
						activitiUtil.startWorkFlowByFormName("产品下架", goodsVO.getActFormService()+";"+goodsVO.getActFormPage()+";"+goodsVO.getId(), vars);
					}
				}
			}
		}
		
		return model;
	}
	
	


	@Override
	public boolean updateStatus(Map<String, Object> params) {
		//当前处理任务的key
		String tdk = (String) params.get("taskDefinitionKey");
		//获取流程变量
		@SuppressWarnings("unchecked")
		Map<String,Object> vars = (Map<String, Object>) params.get("processVariables");
		//获取审批结果
		String approved = (String) vars.get("approved");
		GoodsVO goodsVO = new GoodsVO();
		//获取业务对象ID
		goodsVO.setId((String) params.get("businessKey"));
		//根据当前任务节点和审批意见进行业务表单状态判断处理
		if(tdk.equalsIgnoreCase("usertask1")){//经理审批
			if(null != approved && StringUtils.equalsIgnoreCase(approved, "1")){
				goodsVO.setApprovalState(1);//审核通过
				goodsVO.setIsSpecificationsOpen("2");//产品下架
			}else{
				goodsVO.setApprovalState(-1);//审批不通过
				goodsVO.setIsSpecificationsOpen("1");//下架审核不通过，产品状态改回“上架”
			}
		}
		//更新业务表单状态
		boolean flag = this.goodsDao.updateGoodsApproval(goodsVO);
		if(!flag){
			logger.error("更新产品状态失败");
		}
		return flag;
	}
}
