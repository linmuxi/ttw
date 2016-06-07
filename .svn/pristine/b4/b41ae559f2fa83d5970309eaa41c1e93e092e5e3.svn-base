(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);
	
	var roleFormValidation;

	var roleAuthTitle = function(title){
		$("#roleAuthTitle").html(title);
	}
	
	var roleAuthModalStatus = function(status){
		$("#roleAuth").modal(status);
	}
	
	var roleFormModalStatus = function(status){
		$("#myModal").modal(status);
	}
	
	var roleAuthIframe = function(src){
		$("#roleAuthIframe").attr("src",src);
	}
	
	//清空表单信息
	var clearForm = function(){
		$("#roleName").val("");
		$("#roleDesc").val("");
	}
	
	//重置表单验证器
	var resetFormValidation = function(){
		roleFormValidation.updateStatus("roleName","NOT_VALIDATED");
	}
	
	//添加角色
	var addRole = function(e){
		$("#roleFormTitle").html("创建新角色");
		clearForm(); 
		roleFormModalStatus('show');
		Role.defaults.type = 1;
	}
	
	//角色修改
	var upateRole = function(e){
		$("#roleFormTitle").html("修改角色");
		roleFormModalStatus('show');
		Role.defaults.type = 2;
		$("#roleId").val($(this).data("roleid"));
		$("#roleName").val($(this).data('rolename'));
		$("#roleDesc").val($(this).data('roledesc'));
		$("#enable").val($(this).data('enable'));
		$("#enable").prop('checked',$(this).data('enable'));
	}
	
	//删除角色
	var delRole = function(e){
		var param={roleId:$(this).data("roleid")};
		lhgdialog.confirm('你确定要删除此条数据吗？', function(){
			SysRoleAction.delRole(param,function(data){
				if(data){
					lhgdialog.tips('删除成功');
					$("#roleGrid").bootgrid("reload");
				}else{
					lhgdialog.alert("删除失败");
				}
			});
		}, function(){
			lhgdialog.tips('执行取消操作');
		});
	
	}
	
	//给角色赋予模块访问权限
	var formModule = function(){
		roleAuthModalStatus("show"); 
		roleAuthTitle("给角色赋予模块权限");
		roleAuthIframe(webRoot+"/page/admin/role/getRoleModuleInfo?roleId="+$(this).data("roleid"));
	}
	
	//给角色赋予权限
	var formAuth = function(){
		roleAuthModalStatus("show"); 
		roleAuthTitle("给角色赋予权限操作");
		roleAuthIframe(webRoot+"/page/admin/role/getRoleAuthInfo?roleId="+$(this).data("roleid"));
	}
	
	//转换请求参数
	function convertParam(request){
		var paramObj = request;
    	paramObj.pageNo = request.current;
    	paramObj.pageSize = (request.rowCount == -1)?99999999:request.rowCount;
    	if(request.sort){
    		for(var key in request.sort){
    			if(key){
    				paramObj.sortFieldName = key;
    				paramObj.sortType = request.sort[key];
    				break;
    			}
    		}
    	}
    	return paramObj;
	}
	
	//初始化事件
	function initEvent(){
		//添加角色
		$("#id_add_role").click(addRole);
		//提交表单 
		$("#btn_role_submit").click(function(){
			$("#roleForm").submit();
		});
	}
	
	//初始化表格
	function initTable(){
		var grid = $("#roleGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
		    templates: {
		    	actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_role\">新增</button></div>"
		    },
		    navigation:3,
		    searchSettings:{
		    	delay:100,
		    	characters:2
		    },
		    labels:{
		    	all:"全部",
		    	infos:"显示 {{ctx.start}} to {{ctx.end}} 共 {{ctx.total}} 条",
		    	loading:"加载中...",
		    	noResults:"没有结果",
		    	refresh:"刷新",
		    	search:"角色名称或描述"
		    },
		    post: function ()
		    {
		        return {
		            roleId: ""
		        };
		    },
		    url: webRoot+"/page/admin/role/index",
		    formatters: {
		        "enable": function(column, row)
		        {
		            return (row.enable == 1)?"可用":"禁用";
		        },
		        "commands":function(column,row){
		            return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"赋模块\" name=\"formModule\" data-roleid=\"" + row.roleId + "\"><span class=\"glyphicon glyphicon-check\"></span></button>"+
		            	"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"赋权限\" name=\"formAuth\" data-roleid=\"" + row.roleId + "\"><span class=\"glyphicon glyphicon-check\"></span></button>"+
		            	"<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" title=\"修改\" data-roleid\=\"" + row.roleId + "\" data-roleName=\"" + row.roleName + "\" data-roleDesc=\"" + row.roleDesc + "\" data-enable=\"" + row.enable + "\"><span class=\"glyphicon glyphicon-edit\"></span></button> " + 
		                "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" title=\"删除\" data-roleid=\"" + row.roleId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			    grid.find(".command-edit").on("click", upateRole).end().find(".command-delete").on("click", delRole).end()
			    .find("button[name='formModule']").on("click",formModule).end().find("button[name='formAuth']").on("click",formAuth).end();
			});
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#roleForm').formValidation({
            message: 'This value is not valid',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                roleName: {
                    message: 'The rolename is not valid',
                    validators: {
                        notEmpty: {
                            message: '角色名称必须填写，不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '长度必须大于2小于30'
                        }
                    }
                }
            }
        }).on('success.form.fv', function(e) {
            submitForm();
            resetFormValidation();
        });
		roleFormValidation = $("#roleForm").data("formValidation");
	}
	
	//提交表单
	function submitForm(){
		if(Role.defaults.type == 1){ 
			SysRoleAction.addRole({roleName:$("#roleName").val(),roleDesc:$("#roleDesc").val(),
				enable:$("#enable").is(":checked")?1:0},function(data){
				if(data.result){
					roleFormModalStatus('hide');
					lhgdialog.tips('新增角色成功');
					$("#roleGrid").bootgrid("reload");
				}else{
					lhgdialog.tips('新增角色失败');
				}
			});
		}else if(Role.defaults.type == 2){
			SysRoleAction.updateRole({roleId:$("#roleId").val(),roleName:$("#roleName").val(),roleDesc:$("#roleDesc").val(),
				enable:$("#enable").is(":checked")?1:0},function(data){
				if(data.result){
					roleFormModalStatus('hide');
					lhgdialog.tips('修改角色成功');
					$("#roleGrid").bootgrid("reload");
				}else{
					lhgdialog.tips('修改角色失败');
				}
			});
		}
	}
	
	function init(){
        initTable.call(this);
        initFormValidator.call(this);
        initEvent.call(this);
	}
	
	var Role = function(ops){
		this.options = $.extend(true, {},Role.defaults, ops);
		init.call(this);
	}
	
	//回调处理-保存权限数据
	Role.prototype.handAuth = function(data){
		if(!data){return;}
		var auths = data.auths;
		if(data.other.type == 3){
			//模块
			var modules = [];
			for(var i = 0;i<auths.length;i++){
				modules.push({moduleId:auths[i].id});
			}
			var data = {roleId:data.other.objId,modules:modules};
			SysRoleAction.addRoleModule(data,function(data){
				if(data && data.result){
					alert("保存成功");
				}else{
					alert("保存失败");
				}
			});
		}else if(data.other.type == 2){
			//权限
			var sysAuths = [];
			for(var i = 0;i<auths.length;i++){
				sysAuths.push({authorityId:auths[i].id});
			}
			var data = {roleId:data.other.objId,auths:sysAuths};
			SysRoleAction.addRoleAuth(data,function(data){
				if(data && data.result){
					alert("保存成功");
				}else{
					alert("保存失败");
				}
			});
		}
	};
	
	Role.defaults = {
		type:1
	};
	
	_admin.Role = Role;
	$.admin = _admin;
})(jQuery);

var role = new $.admin.Role({});

function getTargetObject(){
	return role;
}
