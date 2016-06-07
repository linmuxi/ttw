/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.ActivitiException;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

import com.phly.common.activiti.facade.ActivitiFacade;
import com.phly.common.activiti.vo.CommentVO;
import com.phly.common.activiti.vo.DeploymentVO;
import com.phly.common.activiti.vo.ProcessDefinitionVO;
import com.phly.common.activiti.vo.TaskVO;
import com.phly.common.exceptionhandler.annotation.ExceptionMessage;

/**
 * 工作流控制器
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Controller
@RemoteProxy
public class ActivitiAction {
	
	private static final Logger logger = LoggerFactory.getLogger(ActivitiAction.class);

	@Resource
	private ActivitiFacade activitiFacade;

	/**
	 * 部署
	 * 
	 * @param bpmnPath
	 * @param name
	 */
	@ExceptionMessage("部署流程定义失败,请联系管理员")
	@RequestMapping("/page/admin/activiti/deploy")
	public String deploy(HttpServletRequest request,HttpServletResponse response) {
		String contentType = request.getContentType();
		try {
			if ((contentType.indexOf("multipart/form-data") >= 0)) {
				request.setCharacterEncoding("UTF-8");
				DefaultMultipartHttpServletRequest req = (DefaultMultipartHttpServletRequest) request;
				MultipartFile file = req.getFile("processFile");
				DeploymentVO deploymentVO = new DeploymentVO();
				deploymentVO.setName(new String(req.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"));
				deploymentVO.setResourceName(file.getOriginalFilename());
				deploymentVO.setResource(file.getInputStream());
				if((null != this.activitiFacade.deploy(deploymentVO))){
					logger.info("部署成功");
					return "/page/platform/activiti/processDefinitionList.jsp";
				}else{
					logger.error("部署失败");
					throw new ActivitiException("流程部署失败",null);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			throw new ActivitiException("流程部署失败", e.getCause());
		}
		return null;
	}

	/**
	 * 删除流程部署信息
	 * 
	 * @param deploymentId
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("删除流程部署信息失败,请联系管理员")
	public boolean deleteDeployment(DeploymentVO deploymentVO){
		return this.activitiFacade.deleteDeployment(deploymentVO);
	}

	/**
	 * 预览流程
	 * 
	 * @param processDefinitionId
	 * @return
	 */
	@RequestMapping("/page/admin/activiti/reviewProcessDefinition")
	@ExceptionMessage("预览流程失败,请联系管理员")
	public void reviewProcessDefinition(HttpServletRequest request,HttpServletResponse response, String processDefinitionId) {
		InputStream inputStream = this.activitiFacade.reviewProcessDefinition(processDefinitionId);
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			StreamUtils.copy(inputStream, os);
			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != os) {
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 预览当前环节流程(高亮显示当前节点)
	 * @param taskId
	 * @return
	 */
	@RequestMapping("/page/admin/activiti/reviewNowProcess")
	@ExceptionMessage("预览流程失败,请联系管理员")
	public void reviewNowProcess(HttpServletRequest request,HttpServletResponse response, String taskId) {
		InputStream inputStream = this.activitiFacade.reviewNowProcess(taskId);
		OutputStream os = null;
		try {
			os = response.getOutputStream();
			StreamUtils.copy(inputStream, os);
			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != os) {
				try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 获取所有流程定义
	 */
	@RequestMapping("/page/admin/activiti/getProcessDefinitionList")
	@ExceptionMessage("获取所有流程定义失败,请联系管理员")
	@ResponseBody
	public ModelMap getProcessDefinitionList(ProcessDefinitionVO pdVO) {
		return this.activitiFacade.getProcessDefinitionList(pdVO);
	}

	/**
	 * 启动工作流
	 * 
	 * @param processDefinitionId
	 * @param businessKey
	 * @param variables
	 * @return
	 */
	@RemoteMethod
	@ExceptionMessage("启动工作流失败,请联系管理员")
	public String startWorkflow(String processDefinitionId, String businessKey,
			Map<String, Object> variables) {
		return this.activitiFacade.startWorkflow(processDefinitionId, businessKey, variables);
	}

	/**
	 * 获取任务列表
	 * 
	 * @param taskVO
	 * @return
	 */
	@ResponseBody
	@ExceptionMessage("获取任务列表失败,请联系管理员")
	@Deprecated
	public ModelMap getTaskList(TaskVO taskVO) {
		return this.activitiFacade.getTaskList(taskVO);
	}

	/**
	 * 获取任务列表
	 * 
	 * @param taskVO
	 * @return
	 */
	@RequestMapping("/page/admin/activiti/getTaskList")
	@ResponseBody
	@ExceptionMessage("获取任务列表失败,请联系管理员")
	public ModelMap getNewTaskList(TaskVO taskVO) {
		return this.activitiFacade.getNewTaskList(taskVO);
	}
	
	/**
	 * 删除流程
	 * @param taskVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap delTask(TaskVO taskVO){
		return this.activitiFacade.delTask(taskVO);
	}
	
	/**
	 * 删除流程定义
	 * @param taskVO
	 * @return
	 */
	@RemoteMethod
	public ModelMap dropTask(TaskVO taskVO){
		return this.activitiFacade.dropTask(taskVO);
	}

	/**
	 * 完成任务
	 * 
	 * @param taskVO
	 */
	@ExceptionMessage("完成任务操作失败,请联系管理员")
	@RemoteMethod
	public boolean completeTask(TaskVO taskVO) {
		return this.activitiFacade.completeTask(taskVO);
	}

	/**
	 * 根据业务key查询审核意见
	 * @param commentVO
	 * @return
	 */
	@ExceptionMessage("根据业务key查询审核意见失败,请联系管理员")
	@RemoteMethod
	public List<CommentVO> queryCommentByBkey(CommentVO commentVO) {
		return activitiFacade.queryCommentByBkey(commentVO);
	}
}
