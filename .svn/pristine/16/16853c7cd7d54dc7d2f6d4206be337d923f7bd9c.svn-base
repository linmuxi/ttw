package com.phly.ttw.manage.supplier.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.directwebremoting.annotations.RemoteMethod;
import org.directwebremoting.annotations.RemoteProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phly.common.base.facade.SysUserFacade;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.supplier.facade.SupplierFacade;
import com.phly.ttw.manage.supplier.model.SupplierVo;


/**
 * 供应商控制类
 * 
 * @author TH
 * @since 2015年6月1日 下午11:00:00
 */
@Controller
@RemoteProxy
public class SupplierAction {
	
	@Resource
	private SupplierFacade supplierFacade;
	
	@Resource
	private SysUserFacade sysUserFacade;
	
	/**
	 * 供应商列表
	 * 
	 * @param supplierVO
	 * @return 供应商集合
	 */
	@RequestMapping("/page/ttw/manage/supplier/supplier")
	@ResponseBody
	public ModelMap querySupplierList(HttpServletRequest request,SupplierVo supplierVo) {
		return this.supplierFacade.querySupplierList(supplierVo);
	}
	
	/**
	 * 添加供应商
	 * @param supplierVo
	 * @return  
	 */
	@RemoteMethod
	public ModelMap addSupplier(SupplierVo supplierVo) {
		return supplierFacade.addSupplier(supplierVo);
	}
	
	/**
	 * 修改供应商
	 * @param supplierVo
	 * @return
	 */
	@RemoteMethod
	public ModelMap updateSupplier(SupplierVo supplierVo) {
		return supplierFacade.updateSupplier(supplierVo);
	}
	
	
	/***
	 * 获取当前用户的供应商
	 * @return
	 */
	@RemoteMethod
	public ModelMap getSupplier() {
		ModelMap map = new ModelMap();
		String userId = RequestContextUtil.getCurrentUser().getUserId();
		SupplierVo supplierVo =new SupplierVo();
		supplierVo.setUserId(userId);
		SupplierVo vo = supplierFacade.findSupplierByUserId(supplierVo);
		if(vo!=null){
			map.put("result", vo);
			map.put("flag", true);
		}else{
			map.put("flag", false);
		}
		return map;
	}
	
	
	
	/**
	 * 删除供应商
	 * @param supplierVo
	 * @return
	 */
	@RemoteMethod
	public ModelMap delSupplier(SupplierVo supplierVo) {
		return supplierFacade.delSupplier(supplierVo);
	}
	
	/**
	 * 查看供应商详情
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/supplier/supplierDetail")
	public String supplierDetail(HttpServletRequest request, SupplierVo supplierVo){
		SupplierVo vo = supplierFacade.findSupplierBySupplierId(supplierVo.getSupplierId());
		request.setAttribute("sup", vo);
		return "/page/ttw/manage/supplier/supplierDetail.jsp";
	}
	
	
	/**
	 * 供应商状态变更
	 * @param userVO
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/supplier/supplierStateChange")
	public String supplierStateChange(SupplierVo supplierVo){
		supplierFacade.updateSupplierState(supplierVo);
		return "redirect:/page/ttw/manage/supplier/supplierStateChange.jsp";
	}
	
	/**
	 * 供应商基本信息
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/supplier/supplierBaseInfo")
	public String supplierBaseInfo(HttpServletRequest request){
		SysUserVO currentUser = RequestContextUtil.getCurrentUser();
		String userId = currentUser.getUserId();
		SupplierVo supplierVo =new SupplierVo();
		supplierVo.setUserId(userId);
		SupplierVo vo = supplierFacade.findSupplierByUserId(supplierVo);
		request.setAttribute("sup", vo);
		return "/page/ttw/manage/supplier/supplierBaseInfo.jsp";
	}
	
	/**
	 * 修改供应商用户登录密码
	 * @return
	 */
	@RemoteMethod
	public boolean updateSupplierUserPwd(String account,String pwd){
		SysUserVO sysUserVO = new SysUserVO();
		sysUserVO.setAccount(account);
		sysUserVO.setPassword(pwd);
		return supplierFacade.updateSupplierUserPwd(sysUserVO );
	}
	
	
	/***
	 * 供应商忘记密码
	 * @param supNo
	 * @param supEmail
	 * @return true:成功 false：失败
	 */
	@RemoteMethod
	public ModelMap resertPwd(String supNo,String supEmail){
		return supplierFacade.resertPwd(supNo,supEmail);
	}
	
	/***
	 * 校验原密码
	 * @param request
	 * @param supplierVo
	 * @return
	 */
	@RemoteMethod
	public boolean validateOldPwd(String account,String pwd){
		SysUserVO userVO =new SysUserVO();
		userVO.setAccount(account);
		userVO.setPassword(pwd);
		return sysUserFacade.getUserPwdByPwdAndAccount(userVO);
	}
	
	
	/****
	 * 审批页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/page/ttw/manage/supplier/goApproveSupplierUpdate")
	public String goSupplierUpdate(HttpServletRequest request){
		String supplierId = request.getParameter("id");
		if(!StringUtils.isBlank(supplierId)){
			SupplierVo vo = supplierFacade.getSupplierForUpdate(new SupplierVo(supplierId));
			request.setAttribute("sup", vo);
		}
		return "/page/ttw/manage/supplier/goApproveSupplierUpdate.jsp";
	}
	
	

}
