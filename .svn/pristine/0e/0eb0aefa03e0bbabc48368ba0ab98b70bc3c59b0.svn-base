/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.phly.common.base.model.BaseVO;

/**
 *
 * @author TH
 */
public class BaseAction {
	
	private static Logger logger = LoggerFactory.getLogger(BaseAction.class);
	
	public void wrapDatatableParams(HttpServletRequest request,BaseVO baseVO){
		try {
			//每页显示行数
			int iLength = (Integer.parseInt(request.getParameter("length")));
			iLength = (iLength < 0 ? Integer.MAX_VALUE : iLength);
			//起始行数
			int iStart = Integer.parseInt(request.getParameter("start"));
			//搜索关键字
			String sSearchValue = request.getParameter("search[value]");
			//分页索引
			baseVO.setPageNo((iStart+iLength)/iLength);
			//每页行数
			baseVO.setPageSize(iLength);
			//排序字段
			baseVO.setSortFieldName(request.getParameter("columns["+request.getParameter("order[0][column]")+"][data]"));
			//排序类型
			baseVO.setSortType(request.getParameter("order[0][dir]"));
			//搜索是否支持模糊
			baseVO.setSearchRegex(Boolean.valueOf(request.getParameter("search[regex]")));
			//将搜索关键字拆分数组
			if(StringUtils.isNotEmpty(sSearchValue)){
				baseVO.setSearchList(sSearchValue.split(" "));
			}
		} catch (Exception e) {
			logger.error("wrapDatatableParams异常");
		}
	}
}
