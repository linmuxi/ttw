/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.service;

import java.util.Map;

/**
 * 所有走流程的service都需要继承此表单服务类
 * @Description 提供更新业务表单状态方法
 * @author linyong
 * @since 2015年6月19日 下午10:18:04
 */
public interface IFormService {
	
	/**
	 * 更新业务表单方法
	 * @param params 
				//流程定义id
				param.put("processDefinitionId", pi.getProcessDefinitionId());
				//流程定义name
				param.put("processDefinitionName", pi.getProcessDefinitionName());
				//流程实例id
				param.put("processInstanceId", pi.getProcessInstanceId());
				//流程变量集合
				param.put("processVariables", vars);
				//业务表单id
				param.put("businessKey", businessId);
				//当前任务id
				param.put("taskId", task.getId());
				//当前任务name
				param.put("taskName", task.getName());
				//当前任务key
				param.put("taskDefinitionKey", task.getTaskDefinitionKey());
	 * @return
	 */
	public boolean updateStatus(Map<String,Object> params);
}
