$(function() {
	//查询部门数据
	getDepartMentDS = function (){
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/department/index",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.orgName,value:obj.departmentId});
				});
			}
		});
	    return ds;
	},

	//初始化部门下拉框数据 
	initDepartMentDS = function (){
		$('#orgId').multiselect('dataprovider', getDepartMentDS());
		
		var orgId = getUrlParam('orgId');
		if(orgId){
			$('#orgId').multiselect('select', orgId);
		}
	},
	
	initFormValidator = function (){
		//用户名必须填写
		var userName = $("#userName").val();
		if(userName == ""){
			formwarning("#alerterror", "用户名必须填写，不能为空");
			return false;
		}
		
		//帐号必须填写
		var account = $("#account").val();
		if(account == ""){
			formwarning("#alerterror", "帐号必须填写，不能为空");
			return false;
		}
		
		//查询账号是否使用
		$.ajaxSetup({   
            async : false  
        });
		$.post(
			webRoot+"/page/admin/user/getAccountExists",
			{account:account,userId:$("#userId").val()},
			function(data){
			if(data && data.valid){
				if(data.valid == 'true'){
					formwarning("#alerterror", "帐号已经被使用");
					return false;
				}
			}
		});
		
		//只能以数字、字母、下划线命名
		var accountRegexp = /^[a-zA-Z0-9_\.]+$/;
		if(!accountRegexp.test(account)){    
            formwarning("#alerterror", "账号只能以数字、字母、下划线命名");
			return false;  
        }
        
        //密码必须填写，不能为空
		var password = $("#password").val();
		if(operate != 'edit' && password == ""){
			formwarning("#alerterror", "密码必须填写，不能为空");
			return false;
		}
		
		//长度必须大于6小于30
		if(operate != 'edit' && (password.length < 6 || password.length > 30)){
			formwarning("#alerterror", "密码长度必须大于6小于30");
			return false;
		}
		
		return true;
	},
	
	//提交表单
	submitForm = function (){
		//表单验证
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		var arr = $("#userForm").serializeObject();
		
		arr.enabled = arr.enabled == '1';
		arr.accountNonExpired = arr.accountNonExpired == '1';
		arr.accountNonLocked = arr.accountNonLocked == '1';
		arr.credentialsNonExpired = arr.credentialsNonExpired == '1';
		
		SysUserAction.formUser(arr,function(data){
			$("body").unmask();
			if(data && data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/user/userList.jsp";
			}else{
				alert("操作失败,"+data.remark);
			}
		});
	}
	
	//按钮“提交”事件
	$("#submit").click(function(){
		submitForm();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		submitForm();
	});
	
	
	//根据userId查询用户信息
	var findUserByUserId = function(){
		var userId = getUrlParam('userId');
		if(isNotEmpty(userId)){
			//帐号不能修改
        	$("#account").attr("disabled","disabled");
        	//密码不支持修改
        	$("#password").parent().hide();
        	
        	SysUserAction.getUser({userId:userId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$('#orgId').multiselect('select', vo.orgId);
        			$("#userName").val(vo.username);
        			$("#account").val(vo.account);
        			//是否可用
        			if(vo.enabled){
						$("input[name='enabled']").get(0).checked=true;
					}else{
						$("input[name='enabled']").get(1).checked=true;
					}
        			//$("#enabled").attr("checked",vo.enabled);
        			//
        			if(vo.accountNonExpired){
						$("input[name='accountNonExpired']").get(0).checked=true;
					}else{
						$("input[name='accountNonExpired']").get(1).checked=true;
					}
					//
        			if(vo.accountNonLocked){
						$("input[name='accountNonLocked']").get(0).checked=true;
					}else{
						$("input[name='accountNonLocked']").get(1).checked=true;
					}
					//
        			if(vo.credentialsNonExpired){
						$("input[name='credentialsNonExpired']").get(0).checked=true;
					}else{
						$("input[name='credentialsNonExpired']").get(1).checked=true;
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
		//初始化部门数据
		initDepartMentDS();
	
		//绑定用户数据
		findUserByUserId();
	}else if(operate == 'add'){
		//初始化部门数据
		initDepartMentDS();
	}
});

