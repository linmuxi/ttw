/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phly.common.activiti.vo.CommentVO;
import com.phly.common.activiti.vo.TaskVO;
import com.phly.common.base.dao.MyBatisDao;

/**
 * 工作流dao
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Repository
public class ActivitiDao extends MyBatisDao {

	/**
	 * 根据业务key查询审核意见
	 * @param commentVO
	 * @return
	 */
	public List<CommentVO> queryCommentByBkey(CommentVO commentVO) {
		return this.queryList("myActiviti.queryCommentByBkey",commentVO);
	}

	/**
	 * 查询任务列表
	 * @param taskVO
	 * @return
	 */
	public List<TaskVO> queryTaskList(TaskVO taskVO) {
		return this.queryList("myActiviti.queryTaskList",taskVO,taskVO.getPageNo(),taskVO.getPageSize());
	}

	/**
	 * 查询任务列表
	 * @param taskVO
	 * @return
	 */
	public int getTaskCount(TaskVO taskVO) {
		return (Integer) this.getObject("myActiviti.getTaskCount",taskVO);
	}
}
