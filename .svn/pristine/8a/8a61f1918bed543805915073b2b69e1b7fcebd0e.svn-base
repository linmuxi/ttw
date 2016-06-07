/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.activiti.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.phly.common.activiti.vo.VacationRequestVO;
import com.phly.common.base.dao.MyBatisDao;

/**
 * 工作流测试
 * 
 * @Description TODO
 * @author linyong
 * @since 2015年6月19日 下午11:12:26
 */
@Repository
public class VacationRequestDao extends MyBatisDao {

	public List<VacationRequestVO> queryVacationRequestList(
			VacationRequestVO vacationRequestVO) {
		return this.queryList("vacationRequest.queryVacationRequestList",
				vacationRequestVO, vacationRequestVO.getPageNo(),
				vacationRequestVO.getPageSize());
	}

	public int getVacationRequestCount(VacationRequestVO vacationRequestVO) {
		return (Integer) this.getObject(
				"vacationRequest.getVacationRequestCount", vacationRequestVO);
	}

	public boolean addVacationRequest(VacationRequestVO vacationRequestVO) {
		boolean flag = false;
		try {
			this.insert("vacationRequest.addVacationRequest", vacationRequestVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}


	public boolean updateVacationRequestStatus(VacationRequestVO vacationRequestVO) {
		boolean flag = false;
		try {
			this.update("vacationRequest.updateVacationRequestStatus", vacationRequestVO);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public VacationRequestVO getVacationRequest(VacationRequestVO vacationRequestVO) {
		return (VacationRequestVO) this.getObject("vacationRequest.getVacationRequest", vacationRequestVO);
	}
}
