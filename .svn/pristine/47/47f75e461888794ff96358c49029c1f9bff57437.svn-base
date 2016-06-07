/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.common.base.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.phly.common.base.model.SysModuleVO;

/**
 * 生成后台管理菜单
 * @Description TODO
 * @author linyong
 * @since 2015年5月23日 上午11:31:40
 */
public class DefaultMenuTag extends SimpleTagSupport {

	private List<SysModuleVO> moduleList;

	public List<SysModuleVO> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<SysModuleVO> moduleList) {
		this.moduleList = moduleList;
	}

	private String markMenu(List<SysModuleVO> moduleList) {
		StringBuffer menu = new StringBuffer();
		if (moduleList != null && moduleList.size() > 0) {
			for (SysModuleVO sysModuleVO : moduleList) {
				List<SysModuleVO> childModule = sysModuleVO.getChildModuleList();
				if (childModule != null && childModule.size() > 0) {
					menu.append("<li class=\"dropdown\">"
							+ "<a href=\"javascript:void(0);\" onclick=\"toModule('"+sysModuleVO.getModuleUrl()+"')\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">"
							+ sysModuleVO.getModuleName()
							+ " <b class=\"caret\"></b></a>"
							+ "<ul class=\"dropdown-menu\">"
							+ markMenu(childModule) + "</ul></li>");
				} else {
					menu.append("<li><a href=\"javascript:void(0);\" onclick=\"toModule('"+sysModuleVO.getModuleUrl()+"')\" >" + sysModuleVO.getModuleName() + "</a></li>");
				}
			}
		}
		return menu.toString();
	}

	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().print(markMenu(this.moduleList));
	}
}
