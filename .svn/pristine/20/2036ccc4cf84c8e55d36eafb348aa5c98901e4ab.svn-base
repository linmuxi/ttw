/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.dao.VacationRequestDao;
import com.phly.common.activiti.utils.ActivitiUtil;
import com.phly.common.activiti.vo.VacationRequestVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.RequestContextUtil;

/**
 * 请假流程
 * @Description TODO
 * @author linyong
 * @since 2015年6月20日 上午12:40:09
 */
@Service
public class VacationRequestService extends ServiceBase implements IFormService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private VacationRequestDao vacationRequestDao;
	
	@Resource
	private ActivitiUtil activitiUtil;

	public ModelMap queryVacationRequestList(VacationRequestVO vacationRequestVO) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = this.vacationRequestDao
				.getVacationRequestCount(vacationRequestVO);
		if (count > 0) {
			map.put(ROWS, this.vacationRequestDao
					.queryVacationRequestList(vacationRequestVO));
			map.put(TOTAL, count);
			map.put(CURRENT, vacationRequestVO.getPageNo());
			map.put(ROWCOUNT, vacationRequestVO.getPageSize());
		}
		return map;
	}

	public ModelMap addVacationRequest(VacationRequestVO vacationRequestVO) {
		ModelMap map = new ModelMap();
		//申请人
		vacationRequestVO.setPerson(RequestContextUtil.getCurrentUser().getAccount());
		//业务表单服务类
		vacationRequestVO.setActFormService("com.phly.common.activiti.service.VacationRequestService");
		//业务表单明细页面,供审批查看
		vacationRequestVO.setActFormPage("/page/admin/activiti/vacationRequestDetail.jsp");
		//添加申请信息
		map.put("result",this.vacationRequestDao.addVacationRequest(vacationRequestVO));
		//保存流程变量
		Map<String,Object> vars = new HashMap<String,Object>();
		vars.put("vacationRequest", vacationRequestVO);
		activitiUtil.startWorkFlowByFormName("请假单", vacationRequestVO.getActFormService()+";"+vacationRequestVO.getActFormPage()+";"+vacationRequestVO.getId(), vars);
		return map;
	}

	/**
	 * 更新业务表单状态
	 * @param params
	 * @return
	 * @see com.phly.common.activiti.service.IFormService#updateStatus(java.util.Map)
	 */
	@SuppressWarnings("unchecked")
	@Override
	public boolean updateStatus(Map<String,Object> params) {
		//当前处理任务的key
		String tdk = (String) params.get("taskDefinitionKey");
		//获取流程变量
		Map<String,Object> vars = (Map<String, Object>) params.get("processVariables");
		//获取审批结果
		String approved = (String) vars.get("approved");
		VacationRequestVO vacationRequestVO = new VacationRequestVO();
		//获取业务对象ID
		vacationRequestVO.setId((String) params.get("businessKey"));
		//根据当前任务节点和审批意见进行业务表单状态判断处理
		if(tdk.equalsIgnoreCase("usertask1")){//上级主管
			if(null != approved && StringUtils.equalsIgnoreCase(approved, "1")){
				vacationRequestVO.setStatus(2);//待部门经理审批
			}else{
				vacationRequestVO.setStatus(5);//审批不通过
			}
		}else if(tdk.equalsIgnoreCase("usertask2")){//部门经理
			if(null != approved && StringUtils.equalsIgnoreCase(approved, "1")){
				vacationRequestVO.setStatus(3);//待人力资源审批
			}else{
				vacationRequestVO.setStatus(5);//审批不通过
			}
		}else if(tdk.equalsIgnoreCase("usertask3")){//人力资源
			vacationRequestVO.setStatus(4);
		}
		//更新业务表单状态
		boolean flag = this.vacationRequestDao.updateVacationRequestStatus(vacationRequestVO);
		if(!flag){
			logger.error("更新请假单状态失败");
		}
		return flag;
	}
	
	public ModelMap getVacationRequest(VacationRequestVO vacationRequestVO) {
		ModelMap map = new ModelMap();
		VacationRequestVO vo = this.vacationRequestDao.getVacationRequest(vacationRequestVO);
		if(vo != null){
			map.put("sucflag", true);
			map.put("bean", vo);
		}else{
			map.put("sucflag", false);
		}
		return map;
	}

}
