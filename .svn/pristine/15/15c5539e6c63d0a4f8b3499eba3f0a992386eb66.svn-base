;(function($){
	function initEvent(){
		//提交表单
		$("#userFormBtn").click(function(){
			$('#userForm').submit();
		});
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#userForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	userName: {
                    validators: {
                        notEmpty: {
                            message: '用户名必须填写，不能为空'
                        }
                    }
                },
            	account: {
                    validators: {
                        notEmpty: {
                            message: '帐号必须填写，不能为空'
                        },
                        remote: {
                            type: 'POST',
                            url: webRoot+'/page/admin/user/getAccountExists',
                            message: '这个帐号已经被使用',
                            data:{userId:userId}
                            //delay: 1000
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '只能以数字、字母、下划线命名'
                        }
                    }
                },
            	password: {
                    validators: {
                        notEmpty: {
                            message: '密码必须填写，不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '长度必须大于6小于30'
                        }
                    }
                }
            }
        }).on('success.form.fv', function(e) {
            submitForm();
        });
	}

	//提交表单
	function submitForm(){
		$("body").mask("处理中..");
		var arr = $("#userForm").serializeObject();
		arr.enabled = arr.enabled == 'on';
		arr.accountNonExpired = arr.accountNonExpired == 'on';
		arr.accountNonLocked = arr.accountNonLocked == 'on';
		arr.credentialsNonExpired = arr.credentialsNonExpired == 'on';
		SysUserAction.formUser(arr,function(data){
			$("body").unmask();
			if(data && data.result){
				alert("操作成功"); 
				parent.getTargetObject().formUserHandler();
			}else{
				alert("操作失败,"+data.remark);
			}
		});
	}
	
	//初始化部门下拉框数据 
	function initDepartMentDS(){
		 $('#orgId').multiselect('dataprovider', getDepartMentDS());
	}
	
	function getDepartMentDS(){ 
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
	 }
	
    $(function(){
    	initFormValidator.call(this);
        initEvent.call(this);
        initDepartMentDS.call(this);
        if(isNotEmpty(userId)){
        	//帐号不能修改
        	$("#account").attr("disabled","disabled");
        	//密码不支持修改
        	$("#password").parent().parent().hide();
        	SysUserAction.getUser({userId:userId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$('#orgId').multiselect('select', vo.orgId);
        			$("#userName").val(vo.username);
        			$("#account").val(vo.account);
        			$("#enabled").attr("checked",vo.enabled);
        			$("#accountNonExpired").attr("checked",vo.accountNonExpired);
        			$("#accountNonLocked").attr("checked",vo.accountNonLocked);
        			$("#credentialsNonExpired").attr("checked",vo.credentialsNonExpired);
        		}
        	});
        }
    });
})(jQuery);