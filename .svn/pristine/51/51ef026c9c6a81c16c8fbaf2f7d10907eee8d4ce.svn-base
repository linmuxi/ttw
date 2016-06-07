$(function() {

	initFormValidator = function (){
		//角色名称必须填写
		var roleName = $("#roleName").val();
		if(roleName == ""){
			formwarning("#alerterror", "角色名称必须填写，不能为空");
			return false;
		}
		
		return true;
	},
	
	addRoleFun = function (){
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		SysRoleAction.addRole({
				roleName:$("#roleName").val(),
				roleDesc:$("#roleDesc").val(),
				enable:$("#enable").is(":checked") ? 1 : 0
			},function(data){
				$("body").unmask();
			if(data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/role/roleList.jsp";
			}else{
				formwarning("#alerterror", "新增角色失败,"+data.remark);
			}
		});
	
	},
	
	uppRoleFun = function (){
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		SysRoleAction.updateRole({
				roleId:$("#roleId").val(),
				roleName:$("#roleName").val(),
				roleDesc:$("#roleDesc").val(),
				enable:$("#enable").is(":checked") ? 1 : 0
			},function(data){
				$("body").unmask();
			if(data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/role/roleList.jsp";
			}else{
				formwarning("#alerterror", "修改角色失败,"+data.remark);
			}
		});
	}
	
	
	
	//按钮“提交”事件
	$("#submit").click(function(){
		addRoleFun();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		uppRoleFun();
	});
	
	
	//根据roleId查询角色信息
	var findRoleByRoleId = function(){
		var roleId = getUrlParam('roleId');
		if(isNotEmpty(roleId)){
			
        	SysRoleAction.getRole({roleId:roleId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			
        			$("#roleId").val(vo.roleId);
					$("#roleName").val(vo.roleName);
					$("#roleDesc").val(vo.roleDesc);
					//是否可用
        			if(vo.enable == '1'){
						$("input[name='enable']").get(0).checked=true;
					}else{
						$("input[name='enable']").get(1).checked=true;
					}
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
		//绑定角色数据
		findRoleByRoleId();
	}
});

