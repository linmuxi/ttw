$(function() {

	initFormValidator = function (){
		//权限名称必须填写
		var authorityName = $("#authorityName").val();
		if(authorityName == ""){
			formwarning("#alerterror", "权限名称必须填写，不能为空");
			return false;
		}
		
		return true;
	},
	
	addAuthorityFun = function (){
		if(!initFormValidator()){
			return false;
		}
		var formData = $("#authorityForm").serializeObject();
		SysAuthorityAction.addAuthority(formData, function(data){
			if(data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/authority/authorityList.jsp";
			}else{
				formwarning("#alerterror", "新增权限失败");
			}
		});
	
	},
	
	uppAuthorityFun = function (){
		if(!initFormValidator()){
			return false;
		}
		var formData = $("#authorityForm").serializeObject();
		formData.enable = formData.enable == '1';
		SysAuthorityAction.updateAuthority(formData, function(data){
			if(data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/authority/authorityList.jsp";
			}else{
				formwarning("#alerterror", "修改权限失败");
			}
		});
	}
	
	
	
	//按钮“提交”事件
	$("#submit").click(function(){
		addAuthorityFun();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		uppAuthorityFun();
	});
	
	
	//根据authorityId查询权限信息
	var findAuthorityByAuthorityId = function(){
		var authorityId = getUrlParam('authorityId');
		if(isNotEmpty(authorityId)){
			
			SysAuthorityAction.getAuthority({authorityId:authorityId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$("#authorityId").val(authorityId);
        			$("#authorityMark").val(vo.authorityMark);
        			$("#authorityName").val(vo.authorityName);
        			$("#authorityDesc").val(vo.authorityDesc);
        			$("#message").val(vo.message);
        			//
        			//是否可用
        			if(vo.enable == '1'){
						$("input[name='enable']").get(0).checked = true;
					}else{
						$("input[name='enable']").get(1).checked = true;
					}
        			$("#enable").attr("enable",vo.enable);
        		}
        	});
			
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
        }
	}
	
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//绑定权限数据
		findAuthorityByAuthorityId();
	}
});

