/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.service;

import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.DeploymentQuery;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.dao.ActivitiDao;
import com.phly.common.activiti.vo.CommentVO;
import com.phly.common.activiti.vo.DeploymentVO;
import com.phly.common.activiti.vo.ProcessDefinitionVO;
import com.phly.common.activiti.vo.TaskVO;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.ApplicationContextUtil;
import com.phly.common.util.RequestContextUtil;

/**
 * 工作流服务类
 * 
 * @Description 提供流程部署、启动工作流、获取我的待办任务、完成任务等操作
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Service
@Scope("singleton")
public class ActivitiService extends ServiceBase {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	private RepositoryService repositoryService;
	
	@Resource
	private RuntimeService runtimeService;
	
	@Resource
	private TaskService taskService;
	
	@Resource
	private ProcessEngine processEngine;
	
	@Resource
	private ActivitiDao activitiDao;

	/**
	 * 部署流程
	 * 
	 * @param resourceName
	 * @param inputStream
	 * @return
	 */
	public String deploy(DeploymentVO deploymentVO) {
		try {
			return repositoryService.createDeployment()
					.addInputStream(deploymentVO.getResourceName(),deploymentVO.getResource())
					.name(deploymentVO.getName())
					.deploy()
					.getId();
		} catch (Exception e) {
			logger.error("部署操作失败,resourceName:" + deploymentVO.getResourceName());
			e.printStackTrace();
			throw new ActivitiException("部署操作失败", e);
		}
	}

	/**
	 * 删除流程部署信息
	 * 
	 * @param deploymentId
	 * @return
	 */
	public boolean deleteDeployment(DeploymentVO deploymentVO) {
		boolean flag = false;
		try {
			repositoryService.deleteDeployment(deploymentVO.getId(), true);
			flag = true;
		} catch (Exception e) {
			logger.error("删除流程部署信息失败，部署ID：" + deploymentVO.getId());
			e.printStackTrace();
			throw new ActivitiException("删除流程部署信息", e);
		}
		return flag;
	}

	/**
	 * 预览流程
	 * 
	 * @param processDefinitionId
	 * @return
	 */
	public InputStream reviewProcessDefinition(String processDefinitionId) {
		try {
			ProcessDefinition pd = getProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
			return repositoryService.getResourceAsStream(pd.getDeploymentId(),pd.getDiagramResourceName());
		} catch (Exception e) {
			logger.error("预览流程失败，流程定义ID：" + processDefinitionId);
			e.printStackTrace();
			throw new ActivitiException("预览流程失败", e);
		}
	}

	/**
	 * 预览流程-高亮显示当前节点
	 * 
	 * @param taskId 当前任务节点id
	 * @return
	 */
	public InputStream reviewNowProcess(String taskId) {
		try {
			Task task = getTaskQuery().taskId(taskId).singleResult();
			return processEngine
					.getProcessEngineConfiguration()
					.getProcessDiagramGenerator()
					.generateDiagram(
							repositoryService.getBpmnModel(task.getProcessDefinitionId()),
							"png",
							runtimeService.getActiveActivityIds(task.getProcessInstanceId()),
							Collections.<String> emptyList(),
							processEngine.getProcessEngineConfiguration().getActivityFontName(),
							processEngine.getProcessEngineConfiguration().getLabelFontName(),
							processEngine.getProcessEngineConfiguration().getClassLoader(), 1.0);
		} catch (Exception e) {
			logger.error("预览流程-高亮显示当前节点失败，taskId：" + taskId);
			e.printStackTrace();
			throw new ActivitiException("预览流程-高亮显示当前节点失败", e);
		}
	}

	/**
	 * 获取所有流程定义
	 * @param pdVO
	 * @return
	 */
	public ModelMap getProcessDefinitionList(ProcessDefinitionVO pdVO) {
		ModelMap map = new ModelMap();
		try {
			List<ProcessDefinition> pdList = getProcessDefinitionQuery()
					.listPage((pdVO.getPageNo() - 1) * pdVO.getPageSize(),pdVO.getPageSize());
			map.put(TOTAL, getProcessDefinitionQuery().list().size());
			map.put(ROWS, transProcessDefinitionList(pdList));
			map.put(CURRENT, pdVO.getPageNo());
			map.put(ROWCOUNT, pdVO.getPageSize());
		} catch (Exception e) {
			logger.error("获取所有流程定义失败");
			e.printStackTrace();
			throw new ActivitiException("获取所有流程定义失败", e);
		}
		return map;
	}

	/**
	 * 转换流程定义列表中的vo对象为自定义vo对象
	 * @param pdList
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	private List<ProcessDefinitionVO> transProcessDefinitionList(
			List<ProcessDefinition> pdList) throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		List<ProcessDefinitionVO> mpds = new ArrayList<ProcessDefinitionVO>();
		for (ProcessDefinition pd : pdList) {
			ProcessDefinitionVO vo = new ProcessDefinitionVO();
			PropertyUtils.copyProperties(vo, pd);
			Deployment dep = getDeploymentQuery().deploymentId(pd.getDeploymentId()).singleResult();
			// vo.setDep(dep);//抛流关闭异常???
			vo.setDeploymentId(dep.getId());
			vo.setDeploymentName(dep.getName());
			vo.setDeploymentTime(dep.getDeploymentTime());
			vo.setSuspensionState(pd.isSuspended() ? 1 : 0);
			mpds.add(vo);
		}
		return mpds;
	}

	/**
	 * 启动工作流
	 * 
	 * @param processDefinitionId
	 * @param businessKey
	 * 表单service全路径+表单jsp全路径+主键id,例如：com.phly.base.service.VacationRequestService;/page/admin/activiti/vacationRequestForm.jsp;10210120
	 * @param variables
	 * @return 流程实例ID
	 */
	public String startWorkflow(String processDefinitionId, String businessKey,Map<String, Object> variables) {
		try {
			// 校验businessKey
			if (StringUtils.isEmpty(businessKey) || businessKey.split(";").length != 3) {
				logger.error("业务key不合法，启动流程失败");
				throw new ActivitiException("业务key不合法，启动流程失败");
			}
			return runtimeService.startProcessInstanceById(processDefinitionId,businessKey, variables).getId();
		} catch (Exception e) {
			logger.error("启动工作流失败,流程定义id：" + processDefinitionId + " 业务key:" + businessKey + "  流程变量：" + variables);
			e.printStackTrace();
			throw new ActivitiException("启动工作流失败", e);
		}
	}
	
	
	/**
	 * 删除流程
	 * @param taskVO
	 * @return
	 */
	public ModelMap delTask(TaskVO taskVO) {
		ModelMap model = new ModelMap();
		
		boolean flag = false;
		String ids = taskVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					runtimeService.deleteProcessInstance(id, "删除垃圾数据");
				}
			}
		}
		model.put("result", flag);
		return model;
	}
	
	/**
	 * 删除流程定义
	 * @param taskVO
	 * @return
	 */
	public ModelMap dropTask(TaskVO taskVO){
		ModelMap model = new ModelMap();
		boolean flag = false;
		String ids = taskVO.getId();
		//
		if(StringUtils.isNotEmpty(ids)){
			//批量删除
			String [] idArr = ids.split(",");
			for(String id : idArr){
				if(StringUtils.isNotEmpty(id)){
					repositoryService.deleteDeployment(id, true);
				}
			}
		}
		model.put("result", flag);
		return model;
	}

	/**
	 * 获取任务列表
	 * @param vo
	 * @return
	 */
	public ModelMap getNewTaskList(TaskVO vo) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);

		// 获取用户
		SysUserVO user = getUser(vo);
		// 获取用户所属群组集合
		List<String> groups = getGroups(user);
		
		vo.setAccount(user.getAccount());
		vo.setGroups(groups);
		
		int count = this.activitiDao.getTaskCount(vo);
		if(count > 0){
			
			List<TaskVO> taskList = this.activitiDao.queryTaskList(vo);
			for (TaskVO taskVO : taskList) {
				taskVO.setBusinessId(getBusinessField(taskVO.getBusinessKey())[2]);
				taskVO.setFormKey(getBusinessField(taskVO.getBusinessKey())[1]);
			}
			
			map.put(ROWS, taskList);
			map.put(TOTAL, count);
			map.put(CURRENT, vo.getPageNo());
			map.put(ROWCOUNT, vo.getPageSize());
		}
		
		return map;		
	}

	/**
	 * 获取任务列表
	 * 
	 * @param taskVO
	 * @return
	 */
	@Deprecated
	public ModelMap getTaskList(TaskVO taskVO) {
		ModelMap map = new ModelMap();
		try {
			// 获取用户
			SysUserVO user = getUser(taskVO);
			// 获取用户所属群组集合
			List<String> candidateGroups = getGroups(user);
			// 创建任务查询
			TaskQuery taskQuery = taskService.createTaskQuery();
			// 按帐号查询任务
			if (StringUtils.isNotEmpty(user.getAccount())) {
				taskQuery = taskQuery.taskCandidateOrAssigned(user.getAccount());
			}
			// 按角色群组查询任务
			if (candidateGroups != null && candidateGroups.size() > 0) {
				taskQuery = taskQuery.taskCandidateGroupIn(candidateGroups);
			}
			
			// 分页查询任务列表
			List<Task> tasks = taskQuery.listPage((taskVO.getPageNo() - 1) * taskVO.getPageSize(), taskVO.getPageSize());
			// 转换任务集合数据
			map.put(TOTAL, taskQuery.list().size());
			map.put(ROWS, transfTaskData(tasks));
			map.put(CURRENT, taskVO.getPageNo());
			map.put(ROWCOUNT, taskVO.getPageSize());
		} catch (Exception e) {
			logger.error("获取我的任务失败");
			e.printStackTrace();
			throw new ActivitiException("获取我的任务失败");
		}
		return map;
	}
	
	/**
	 * 根据业务主键获取是否有任务
	 * 
	 * @param taskVO
	 * @return
	 */
	public boolean getTaskByBusinessKey(String businessKey) {
		boolean flag = false;
		try {
			List<ProcessInstance> tasks = runtimeService.createProcessInstanceQuery().processInstanceBusinessKey(businessKey).list();
			// 转换任务集合数据
			flag = (tasks == null || tasks.size() == 0) ? false : true;
		} catch (Exception e) {
			logger.error("获取我的任务失败");
			e.printStackTrace();
			throw new ActivitiException("获取我的任务失败");
		}
		return flag;
	}

	/**
	 * 将任务列表中的vo对象转换成自定义vo对象
	 * 
	 * @param tasks
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 * @throws InstantiationException
	 */
	private List<TaskVO> transfTaskData(List<Task> tasks)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, InstantiationException {
		List<TaskVO> myTasks = new ArrayList<TaskVO>();
		if (tasks != null && tasks.size() > 0) {
			for (Task task : tasks) {
				// MyTaskVO myTaskVO = new MyTaskVO();
				// myTaskVO.setTask((TaskEntity)task);
				myTasks.add(getTaskVO(task));
			}
		}
		return myTasks;
	}

	/**
	 * 将task转换成自定义taskvo对象
	 * @param task
	 * @return
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws NoSuchMethodException
	 */
	private TaskVO getTaskVO(Task task) throws IllegalAccessException,
			InvocationTargetException, NoSuchMethodException {
		TaskVO myTaskVO = new TaskVO();
		//将task属性复制到myTaskVO
		PropertyUtils.copyProperties(myTaskVO, task);
		
		
		String processInstanceId = task.getProcessInstanceId();
		String businessKey = getProcessInstanceQuery().processInstanceId(processInstanceId).singleResult().getBusinessKey();
		String [] field = getBusinessField(businessKey);
		
		// 根据流程实例id获取业务key并设置业务表单key(页面路径)
		myTaskVO.setFormKey(field[1]);
		// 获取业务表单主键ID
		myTaskVO.setBusinessId(field[2]);
		
		//获取流程实例ID
		myTaskVO.setProcessInstanceId(processInstanceId);
		
		// 获取流程定义
		ProcessDefinition pd = getProcessDefinitionQuery().processDefinitionId(
				task.getProcessDefinitionId()).singleResult();
		myTaskVO.setProcessDefinitionName(pd.getName());
		myTaskVO.setProcessDefinitionId(pd.getId());
		
		System.out.println(businessKey);
		return myTaskVO;
	}

	/**
	 * 获取用户所属群组集合
	 * 
	 * @param user
	 */
	private List<String> getGroups(SysUserVO user) {
		List<SysRoleVO> roles = user.getRoles();
		List<String> candidateGroups = new ArrayList<String>();
		if (null != roles && roles.size() > 0) {
			for (SysRoleVO sysRoleVO : roles) {
				candidateGroups.add(sysRoleVO.getRoleName());
			}
		}
		return candidateGroups;
	}

	/**
	 * 获取用户
	 * 
	 * @param taskVO
	 */
	private SysUserVO getUser(TaskVO taskVO) {
		SysUserVO user = taskVO.getUser();
		if (null == user) {
			user = RequestContextUtil.getCurrentUserRole();
		}
		if (null == user) {
			logger.error("获取我的待办任务失败,用户为null");
			throw new ActivitiException("获取我的待办任务失败,用户为null");
		}
		return user;
	}

	/**
	 * 完成任务
	 * 
	 * @param taskVO
	 */
	public boolean completeTask(TaskVO taskVO) {
		try {
			// 根据任务ID获取任务对象
			Task task = taskService.createTaskQuery().taskId(taskVO.getId()).singleResult();
			// 获取流程实例
			ProcessInstance pi = getProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
			// 添加意见
			taskService.addComment(taskVO.getId(), pi.getId(), (String) taskVO.getVars().get("opinion"));
			// 完成任务
			taskService.complete(taskVO.getId(), getVars(taskVO.getVars()));
			// 获取业务字段
			String[] bs = getBusinessField(pi.getBusinessKey());
			// 获取业务服务类
			IFormService formService = (IFormService) ApplicationContextUtil.getApplicationContext().getBean(Class.forName(bs[0]));
			// 更新业务状态
			return formService.updateStatus(getStatusValue(task, pi, bs[2],getVars(taskVO.getVars())));
		} catch (Exception e) {
			logger.error("完成任务操作失败，任务id：" + taskVO.getId() + "  流程变量：" + taskVO.getVars());
			e.printStackTrace();
			throw new ActivitiException("完成任务操作失败", e);
		}
	}

	/**
	 * 获取流程变量
	 * @param params
	 * @return
	 */
	private Map<String, Object> getVars(Map<String, String> params) {
		Map<String, Object> vars = new HashMap<String, Object>();
		Iterator<String> iter = params.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			vars.put(key, params.get(key));
		}
		return vars;
	}

	/**
	 * 获取状态变量值
	 * 
	 * @param task
	 * @param pi
	 * @param businessId
	 */
	private Map<String, Object> getStatusValue(Task task, ProcessInstance pi,
			String businessId, Map<String, Object> vars) {
		Map<String, Object> param = new HashMap<String, Object>();
		// 流程定义id
		param.put("processDefinitionId", pi.getProcessDefinitionId());
		// 流程定义name
		param.put("processDefinitionName", pi.getProcessDefinitionName());
		// 流程实例id
		param.put("processInstanceId", pi.getProcessInstanceId());
		// 流程变量集合
		param.put("processVariables", vars);
		// 业务表单id
		param.put("businessKey", businessId);
		// 当前任务id
		param.put("taskId", task.getId());
		// 当前任务name
		param.put("taskName", task.getName());
		// 当前任务key
		param.put("taskDefinitionKey", task.getTaskDefinitionKey());
		return param;
	}

	/**
	 * 分割业务key
	 * 
	 * @param businessKey
	 * @return
	 */
	private String[] getBusinessField(String businessKey) {
		if (StringUtils.isNotEmpty(businessKey)) {
			return businessKey.split(";");
		}
		return null;
	}

	/**
	 * 获取流程部署查询器
	 * @return
	 */
	private DeploymentQuery getDeploymentQuery() {
		return repositoryService.createDeploymentQuery();
	}
	
	/**
	 * 获取流程定义查询器
	 * @return
	 */
	private ProcessDefinitionQuery getProcessDefinitionQuery() {
		return repositoryService.createProcessDefinitionQuery();
	}
	
	/**
	 * 获取流程实例查询器
	 * @return
	 */
	private ProcessInstanceQuery getProcessInstanceQuery() {
		return runtimeService.createProcessInstanceQuery();
	}
	
	/**
	 * 获取任务查询器
	 * @return
	 */
	private TaskQuery getTaskQuery() {
		return taskService.createTaskQuery();
	}
	
	/**
	 * 根据业务key查询审核意见
	 * @param commentVO
	 * @return
	 */
	public List<CommentVO> queryCommentByBkey(CommentVO commentVO) {
		return activitiDao.queryCommentByBkey(commentVO);
	}
}
