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

import com.phly.common.activiti.facade.FormProcessFacade;
import com.phly.common.activiti.vo.FormProcessVO;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;

/**
 * 业务表单与流程配置管理
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Controller
@RemoteProxy
public class FormProcessAction {

	@Resource
	private FormProcessFacade formProcessFacade;

	/**
	 * 查询业务表单流程配置信息列表
	 * @param formProcessVO
	 */
	@RequestMapping("/page/admin/activiti/queryFormProcessList")
	@ResponseBody
	@ExceptionMessage("查询业务表单流程配置信息失败，请联系管理员")
	public ModelMap queryFormProcessList(FormProcessVO formProcessVO) {
		return this.formProcessFacade.queryFormProcessList(formProcessVO);
	}

	/**
	 * 业务表单流程配置
	 * @param formProcessVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("业务表单流程配置失败，请联系管理员")
	public ModelMap addFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessFacade.addFormProcess(formProcessVO);
	}

	/**
	 * 业务表单流程修改
	 * @param formProcessVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("业务表单流程修改失败，请联系管理员")
	public ModelMap updateFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessFacade.updateFormProcess(formProcessVO);
	}

	@RemoteMethod
	@ExceptionMessage("业务表单流程删除失败，请联系管理员")
	public ModelMap deleteFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessFacade.deleteFormProcess(formProcessVO);
	}
	
	/**
	 * 获取业务表单流程配置
	 * @param formProcessVO
	 * @return
	 */
	@RequestMapping("/page/admin/activiti/getFormProcess")
	@ResponseBody
	@RemoteMethod
	@ExceptionMessage("获取业务表单流程配置失败，请联系管理员")
	public ModelMap getFormProcess(FormProcessVO formProcessVO) {
		return this.formProcessFacade.getFormProcess(formProcessVO);
	}
	
	@RequestMapping("/page/admin/activiti/getFormNameExists")
	@ResponseBody
	@RemoteMethod
	@ExceptionMessage("查询表单名称是否存在失败，请联系管理员")
	public ModelMap getFormNameExists(FormProcessVO formProcessVO) {
		return this.formProcessFacade.getFormNameExists(formProcessVO);
	}
	
	/**
	 * 编辑表单流程
	 * @param userVO
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("编辑表单流程失败，请联系管理员")
	public ModelMap formProcess(FormProcessVO formProcessVO) {
		return this.formProcessFacade.formProcess(formProcessVO);
	}
}
