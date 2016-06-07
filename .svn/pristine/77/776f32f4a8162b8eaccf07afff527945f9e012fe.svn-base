/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
package com.phly.ttw.manage.index;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.phly.common.base.model.SysModuleVO;

/**
 * 生成淘桃网后台管理菜单
 * @Description TODO
 * @author linyong
 * @since 2015年5月23日 上午11:31:40
 */
public class TTWMenuTag extends SimpleTagSupport {

	private List<SysModuleVO> moduleList;

	public List<SysModuleVO> getModuleList() {
		return moduleList;
	}

	public void setModuleList(List<SysModuleVO> moduleList) {
		this.moduleList = moduleList;
	}

	
	/**
	 * <li class="menu">
            <ul>
                <li class="button"><a href="#" class="gyspt1"><img class="gltp" src="/ttw/page/business/images/index/1.png" />test<span></span></a></li>
                <li class="dropdown">
                    <ul>
                        <li><a href="jcxx.html">基本信息11</a></li>
                        <li><a href="xcmm.html">修改密码2121</a></li>
                    </ul>
                </li>
            </ul>
        </li>
	 * @param moduleList
	 * @return
	 */
	private String markMenu(List<SysModuleVO> moduleList) {
		StringBuffer menu = new StringBuffer();
		if (moduleList != null && moduleList.size() > 0) {
			for (SysModuleVO sysModuleVO : moduleList) {
				List<SysModuleVO> childModules = sysModuleVO.getChildModuleList();
				StringBuffer sb = new StringBuffer();
				sb.append("<li class=\"menu\"><ul>");
				sb.append("<li class=\"button\">");
				sb.append("<a href='javascript:void(0);' onclick=\"toModule('"+sysModuleVO.getModuleUrl()+"',this)\" class=\"gyspt1\">");
				if(childModules != null && childModules.size() > 0){
					sb.append("<img class=\"menuImg\" src=\"/ttw/page/business/images/index/rwjtrit.png\" />");
				}
				//<img class=\"gltp\" src=\"/ttw/page/business/images/index/1.png\" />
				sb.append(""+sysModuleVO.getModuleName()+"<span></span>");
				sb.append("</a></li>");
				if (childModules != null && childModules.size() > 0) {
					StringBuffer sbChildMenu = new StringBuffer();
					sbChildMenu.append("<li class=\"dropdown\"><ul>");
					for (SysModuleVO childModule : childModules) {
						sbChildMenu.append("<li><a href='javascript:void(0);' onclick=\"toModule('"+childModule.getModuleUrl()+"',this)\">"+childModule.getModuleName()+"</a></li>");
					}
					sbChildMenu.append("</ul></li>");
					sb.append(sbChildMenu);
				}
				sb.append("</ul></li>");
				menu.append(sb);
			}
		}
		return menu.toString();
	}

	@Override
	public void doTag() throws JspException, IOException {
		getJspContext().getOut().print(markMenu(this.moduleList));
	}
}
