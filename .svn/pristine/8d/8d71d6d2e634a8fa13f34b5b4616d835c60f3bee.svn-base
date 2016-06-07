/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.action;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.activiti.facade.VacationRequestFacade;
import com.phly.common.activiti.vo.VacationRequestVO;

/**
 * 工作流测试
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Controller
@RemoteProxy
public class VacationRequestAction {

	@Resource
	private VacationRequestFacade vacationRequestFacade;

	@RequestMapping("/page/admin/activiti/queryVacationRequestList")
	@ResponseBody
	public ModelMap queryVacationRequestList(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestFacade
				.queryVacationRequestList(vacationRequestVO);
	}

	@RemoteMethod
	public ModelMap addVacationRequest(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestFacade.addVacationRequest(vacationRequestVO);
	}

	@RemoteMethod
	public ModelMap getVacationRequest(VacationRequestVO vacationRequestVO) {
		return this.vacationRequestFacade.getVacationRequest(vacationRequestVO);
	}
}
