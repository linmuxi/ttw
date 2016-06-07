/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.facade;

import javax.annotation.Resource;

import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.FormProcessService;
import com.phly.common.activiti.vo.FormProcessVO;

/**
 * 业务表单与流程配置管理
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Component
@RemoteProxy
public class FormProcessFacade {

	@Resource
	private FormProcessService formProcessService;
	
	public ModelMap queryFormProcessList(FormProcessVO formProcessVO) {
		return this.formProcessService.queryFormProcessList(formProcessVO);
	}

	public ModelMap addFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessService.addFormProcess(formProcessVO);
	}

	public ModelMap updateFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessService.updateFormProcess(formProcessVO);
	}

	public ModelMap deleteFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessService.deleteFormProcess(formProcessVO);
	}
	
	public ModelMap getFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessService.getFormProcess(formProcessVO);
	}
	
	public ModelMap getFormNameExists(FormProcessVO formProcessVO) {
		return this.formProcessService.getFormNameExists(formProcessVO);
	}
	
	/**
	 * 编辑表单流程
	 * @param userVO
	 * @return
	 */
	public ModelMap formProcess(FormProcessVO formProcessVO) {
		return this.formProcessService.formProcess(formProcessVO);
	}
}
