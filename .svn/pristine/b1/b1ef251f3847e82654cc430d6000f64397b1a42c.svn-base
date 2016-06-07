package com.phly.ttw.manage.supplier.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.phly.common.activiti.service.IFormService;
import com.phly.common.activiti.utils.ActivitiUtil;
import com.phly.common.base.dao.SysUserDao;
import com.phly.common.base.model.SysRoleVO;
import com.phly.common.base.model.SysUserVO;
import com.phly.common.base.service.ServiceBase;
import com.phly.common.util.DictUtil;
import com.phly.common.util.DigestUtil;
import com.phly.common.util.EmailUtils;
import com.phly.common.util.RequestContextUtil;
import com.phly.ttw.manage.supplier.dao.SupplierDao;
import com.phly.ttw.manage.supplier.model.SupplierModel;
import com.phly.ttw.manage.supplier.model.SupplierVo;
import com.phly.ttw.manage.supplier.util.SupplierNoUtil;

@Service("SupplierService")
public class SupplierService extends ServiceBase implements IFormService{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
	private SupplierDao supplierDao;
	
	@Resource
	private SysUserDao userDao;
	
	@Resource
	private ActivitiUtil activitiUtil;
	
	
	private static final String ACT_FORM_SERVICE = "com.phly.ttw.manage.supplier.service.SupplierService";
	
	private static final String ACT_FORM_PAGE = "/page/ttw/manage/supplier/goApproveSupplierUpdate";
	
	/***
	 * 查询供应商列表
	 * @param supplierVo
	 * @return
	 */
	public ModelMap querySupplierList(SupplierVo supplierVo) {
		ModelMap map = new ModelMap();
		map.put(TOTAL, 0);
		int count = supplierDao.getSupplierCount(supplierVo);
		if(count > 0){
			map.put(ROWS, supplierDao.querySupplierList(supplierVo));
			map.put(TOTAL, count);
			map.put(CURRENT, supplierVo.getPageNo());
			map.put(ROWCOUNT, supplierVo.getPageSize());
		}
		return map;
	}
	
	
	/**
	 * 合同编码是否已经存在
	 * @param contractCode
	 * @return true:存在，反之
	 */
	private boolean existContractCode(String contractCode){
		return supplierDao.existContractCode(contractCode);
	}
	
	

	/***
	 * 供应商编码是否已经存在
	 * @param supNo
	 * @return true:存在，反之
	 */
	private boolean existSupNo(String supNo) {
		return supplierDao.existSupNo(supNo);
	}
	
	
	/***
	 * 添加供应商
	 * @param supplierVo
	 * @return
	 */
	public ModelMap addSupplier_WS(SupplierVo supplierVo) {
		ModelMap map = new ModelMap();
		String defaultPwd =(String) DictUtil.getValue("GONGYINGSHANG", "suppDefaultPwd");
		String defaultOrgId =(String) DictUtil.getValue("GONGYINGSHANG", "supDefaultOrgId");
		String defaultRoleId =(String) DictUtil.getValue("GONGYINGSHANG", "supDefaultRoleId");
		if(StringUtils.isBlank(supplierVo.getContractCode())){
			map.put("result", false);
			map.put("remark", "供应商合同编码不能为空。");
			return map;
		}
		if(existContractCode(supplierVo.getContractCode())){
			map.put("result", true);
			map.put("remark", "该合同编码是否已经存。");
			return map;
		}
		if(StringUtils.isBlank(supplierVo.getSupNo())){
			map.put("result", false);
			map.put("remark", "供应商编码不能为空。");
			return map;
		}
		if(existSupNo(supplierVo.getSupNo())){
			map.put("result", true);
			map.put("remark", "供应商编码已经存在。");
			return map;
		}
		SysUserVO user = new SysUserVO();
		user.setUserName(supplierVo.getSupName());
		user.setAccount(supplierVo.getSupNo());//供应商
		user.setPassword(DigestUtil.encodePasswordByMD5(defaultPwd,user.getAccount()));//默认密码
		user.setEnabled(true);
		user.setOrgId(defaultOrgId);//默认部门 招商部
		user.setAccountNonExpired(true);
		user.setCredentialsNonExpired(true);
		user.setAccountNonLocked(true);
		user.setUserType("0");
		userDao.addUser(user);
		map.put("account", user.getAccount());
		map.put("password", defaultPwd);
		
		//供应商关联用户信息
		supplierVo.setUserId(user.getUserId());
		map.put("result", supplierDao.addSupplier(supplierVo));
		
		
		SysRoleVO sysRoleVO = new SysRoleVO();
		sysRoleVO.setCreator("同步新增-"+supplierVo.getSupName());
		sysRoleVO.setRoleId(defaultRoleId);//供应商默认角色
		sysRoleVO.setUserId(user.getUserId());
		//用户关联默认角色
		userDao.insert("sysUser.addUserRole", sysRoleVO);
		return map;
	}
	

	/***
	 * 添加供应商
	 * @param supplierVo
	 * @return
	 */
	public ModelMap addSupplier(SupplierVo supplierVo) {
		ModelMap map = new ModelMap();
		if(StringUtils.isBlank(supplierVo.getContractCode())){
			map.put("result", false);
			map.put("remark", "供应商合同编码不能为空。");
			return map;
		}
		if(!existContractCode(supplierVo.getContractCode())){
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				map.put("result", false);
				map.put("remark", "用户未登录。");
				return map;
			}
			//供应商编码   注意supplierVo.getSupType()空指针
			supplierVo.setSupNo(supplierVo.getSupType()==0? SupplierNoUtil.getSupplier_P() : SupplierNoUtil.getSupplier_C());
			map.put("result", supplierDao.addSupplier(supplierVo));
		}else{
			map.put("result", false);
			map.put("remark", "该供应商已经存在。");
		}
		return map;
	}
	
	
	/***
	 * 更新供应商
	 * @param supplierVo
	 * @return
	 */
	public ModelMap updateSupplier_WS(SupplierVo updateSupplierVo) {
		ModelMap map = new ModelMap();
		SupplierVo paramVO = new SupplierVo();
		paramVO.setSupNo(updateSupplierVo.getSupNo());
		if(StringUtils.isBlank(updateSupplierVo.getSupNo())){
			map.put("result", false);
			map.put("remark", "供应商编号不能为空");
		}
		//如果供应商关系终止 即将关联用户设置为不可用。
		SupplierVo supplier = supplierDao.getSupplierBySupNo(updateSupplierVo.getSupNo());
		if(!StringUtils.isBlank(supplier.getUserId())){
			SysUserVO vo = userDao.getUserIncludAllByUserId(new SysUserVO(supplier.getUserId()));
			if(vo!=null){
				if(updateSupplierVo.getSupState() == 1){
					vo.setEnabled(false);
				}else{
					vo.setEnabled(true);
				}
				userDao.updateUser(vo);
			}
		}
		boolean updateSupplier = supplierDao.updateSupplier_WS(updateSupplierVo);
		map.put("result", updateSupplier);
		return map;
	}

	/***
	 * 更新供应商
	 * @param supplierVo
	 * @return
	 */
	public ModelMap updateSupplier(SupplierVo supplierVo,boolean isNeedFlow) {
		ModelMap map = new ModelMap();
		SupplierVo paramVO = new SupplierVo();
		paramVO.setSupplierId(supplierVo.getSupplierId());
		if(supplierVo.getSupplierId()==null){
			map.put("result", false);
			map.put("remark", "供应商ID为空");
		}
		SupplierVo s= supplierDao.getSupplier(paramVO);
		if(s != null && !StringUtils.equalsIgnoreCase(s.getSupplierId(), supplierVo.getSupplierId())){
			map.put("result", false);
			map.put("remark", "该供应商经存在，请查看是否该供应商已经添加过。");
		}else{
			SysUserVO userVO = RequestContextUtil.getCurrentUser();
			if(userVO == null){
				map.put("result", false);
				map.put("remark", "用户未登录。");
				return map;
			}
			//如果是供应商信息变更，则需要调用工作流
			if(isNeedFlow){
				SupplierVo supplierForUpdate = supplierDao.getSupplierForUpdate(supplierVo);
				if(supplierForUpdate!=null){
					map.put("result", false);
					map.put("remark", "该供应商的信息变更审批流程未结束，请先结束之前的待办任务。");
					return map;
				}
				
				//插入一条审批更新信息
				supplierDao.addSupplierForUpdate(supplierVo);
				//接工作流
				//1.保存流程变量
				Map<String,Object> vars = new HashMap<String,Object>();
				//处理业务信息
				vars.put("supplierVo", supplierVo);
				//设置处理人
				vars.put("groupIdentity",activitiUtil.getApprover("供应商信息变更", 1).getRoleName());
					
				//2.业务表单服务类
				supplierVo.setActFormService(ACT_FORM_SERVICE);
				//3.业务表单明细页面,供审批查看
				supplierVo.setActFormPage(ACT_FORM_PAGE);
				//4.启动流程
				activitiUtil.startWorkFlowByFormName("供应商信息变更", supplierVo.getActFormService()+";"+supplierVo.getActFormPage()+";"+supplierVo.getSupplierId(), vars);
				map.put("result", true);
			}else{
				//状态变更不需要工作流
				if("".equals(supplierVo.getUserId())){
					map.put("result", false);
					map.put("remark", "该供应商关联的用户ID为空,请检查。");
					logger.error("更新供应商状态失败，该供应商关联的用户ID为空,请检查。");
				}else{
					//更新用户表enable字段 0:合作  1：中止
					SysUserVO vo = userDao.getUserIncludAllByUserId(new SysUserVO(supplierVo.getUserId()));
					if(vo!=null && supplierVo.getSupState() == 1){
						vo.setEnabled(false);
					}else if(vo!=null && supplierVo.getSupState() == 0){
						vo.setEnabled(true);
					}
					userDao.updateUser(vo);
					map.put("result", supplierDao.updateSupplier(supplierVo));
				}
			}
		}
		return map;
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean updateStatus(Map<String, Object> params) {
		//当前处理任务的key
		String tdk = (String) params.get("taskDefinitionKey");
		//获取流程变量
		Map<String,Object> vars = (Map<String, Object>) params.get("processVariables");
		//获取审批结果
		String approved = (String) vars.get("approved");
		//更新业务表单状态
		boolean flag =false;
		//根据当前任务节点和审批意见进行业务表单状态判断处理
		if(tdk.equalsIgnoreCase("usertask1")){//经理审批
			if(null != approved && StringUtils.equalsIgnoreCase(approved, "1")){
				//获取修改前的对象
				SupplierVo supplierVoAfter = this.supplierDao.getSupplierForUpdate(new SupplierVo((String) params.get("businessKey")));
				//更新业务信息
				flag = this.supplierDao.updateSupplier(supplierVoAfter);
			}
			//删除更新审批信息
			flag = this.supplierDao.delSupplierForUpdate(new SupplierVo((String) params.get("businessKey")));
		}
		if(!flag){
			logger.error("更新供应商审批状态失败");
		}
		return flag;
	}
	
	
	public SupplierVo getSupplierForUpdate(SupplierVo supplierVo){
		return this.supplierDao.getSupplierForUpdate(supplierVo);
	}
	
	

	/***
	 * 删除供应商
	 * @param supplierVo
	 * @return
	 */
	public ModelMap delSupplier(SupplierVo supplierVo) {
		ModelMap map = new ModelMap();
		if(supplierVo.getSupplierId()==null){
			map.put("result", false);
			map.put("remark", "供应商ID为空");
		}
		map.put("result", supplierDao.delSupplier(supplierVo));
		return map;
	}


	public SupplierVo findSupplierBySupplierId(String supplierId) {
		if(StringUtils.isBlank(supplierId)) return null;
		return supplierDao.getSupplier(new SupplierVo(supplierId));
	}


	public List<SupplierModel> findSupplierByDate(String date) {
		if(StringUtils.isBlank(date)) return null;
		return supplierDao.findSupplierByDate(date);
	}


	public SupplierVo findSupplierByUserId(SupplierVo supplierVo) {
		return supplierDao.findSupplierByUserId(supplierVo);
	}


	public ModelMap resertPwd(String supNo, String supEmail) {
		String password = RandomStringUtils.randomNumeric(6);//随机6位的整数作为密码
		ModelMap map = new ModelMap();
		SupplierVo vo = supplierDao.getSupplierBySupNo(supNo);
		if(vo!=null){
			if(!StringUtils.isBlank(vo.getSupEmail())){
				if(vo.getSupEmail().equals(supEmail)){
					String userId = vo.getUserId();
					if(StringUtils.isBlank(userId)){
						map.put("result", false);
						map.put("remark", "密码重置失败，该供应商没有关联用户，请联系管理员。");
						return map;
					}
					SysUserVO userVO = userDao.getUser(new SysUserVO(userId));
					String encodePasswordByMD5 = DigestUtil.encodePasswordByMD5(password,userVO.getAccount());
					userVO.setPassword(encodePasswordByMD5);
					boolean updateUser = userDao.updateUser(userVO);
					if(updateUser){
						//用户密码重置成功，则将密码发送至该供应商邮箱
						boolean isSendSuccess = EmailUtils.sendHtmlMail(supEmail,EmailUtils.EMAIL_SUBJECT_RESERT,EmailUtils.getMessage_resetPassWord(userVO.getUsername(), supNo, password));
						if(isSendSuccess){
							map.put("result", true);
							map.put("remark", "密码重置成功，新密码已经发送至供应商邮箱。请查收！");
							return map;
						}else{
							map.put("result", false);
							map.put("remark", "密码重置失败，邮箱服务器链接失败，请联系管理员。");
							return map;
						}
					}else{
						map.put("result", false);
						map.put("remark", "密码重置失败");
						return map;
					}
				}else{
					map.put("result", false);
					map.put("remark", "该供应商编码对应的联系邮箱和您提供的不相符！无法重置密码。");
					return map;
				}
			}else{
				map.put("result", false);
				map.put("remark", "该供应商编码对应的原联系邮箱为空！无法完成验证,请联系管理员。");
				return map;
			}
		}else{
			map.put("result", false);
			map.put("remark", "供应商编码不存在！请联系管理员。");
			return map;
		}
	}

}
