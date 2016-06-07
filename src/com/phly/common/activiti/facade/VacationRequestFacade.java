/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.facade;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.VacationRequestService;
import com.phly.common.activiti.vo.VacationRequestVO;

/**
 * 工作流测试
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Component
@RemoteProxy
public class VacationRequestFacade {

	@Resource
	private VacationRequestService vacationRequestService;

	public ModelMap queryVacationRequestList(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestService
				.queryVacationRequestList(vacationRequestVO);
	}

	public ModelMap addVacationRequest(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestService
				.addVacationRequest(vacationRequestVO);
	}

	public ModelMap getVacationRequest(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestService.getVacationRequest(vacationRequestVO);
	}
}
