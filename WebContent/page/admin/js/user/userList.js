;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	//隐藏或显示用户编辑窗体
	var userFormModalStatus = function(status){
		$("#userModel").modal(status);
	}
	
	//设置用户编辑title
	var userFormModelTitle = function(title){
		$("#userFormTitle").html(title);
	}
	
	//设置用户编辑URL
	var userFormIframe = function(src){
		$("#userFormIframe").attr("src",src);
	}
	
	//初始化部门树			
	var initZtree = function(){
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey:"id",
					pIdKey:"parent_org", 
					rootPId:"-1"
				},
				key:{
					name:"name"
				}
			},
			callback:{
				onClick:departTreeClick
			}
		};
		SysDepartmentAction.getChildDepartMentByParent({parentId:-1},function(data){
			if(data&&data.result){
				$.fn.zTree.init($("#departMentTree"), setting, data.result);
				selectNode(getDepartMentTree().getNodeByParam("id", 1, null));
			}
		});
	} 
	
	//选中指定节点
	function selectNode(node){
		getDepartMentTree().selectNode(node);
	}
	
	//获取部门树对象
	function getDepartMentTree(){
		return $.fn.zTree.getZTreeObj("departMentTree");
	}
	
	//点击部门树事件
	function departTreeClick(event, treeId, treeNode){
		User.defaults.orgId = treeNode.id;
		$("#userGrid").bootgrid("reload",null);
	}
	
	
	//初始化表格
	function initTable(){
		var grid = $("#userGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
			    actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_user\">新增</button></div>"
	        },
		    navigation:3,
		    searchSettings:{
		    	delay:100,
		    	characters:2
		    },
		    labels:{
		    	all:"全部",
		    	infos:"共 {{ctx.total}} 条，当前显示 {{ctx.start}} 至 {{ctx.end}} 条 ",
		    	loading:"加载中...",
		    	noResults:"没有结果",
		    	refresh:"刷新",
		    	search:"用户名或帐号"
		    },
		    post: function()
		    {
		        return User.defaults;
		    },
		    url: webRoot+"/page/admin/user/index",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd");
		        },
		        "commands":function(column,row){
					return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"授权\" name=\"formRole\" data-userid=\"" + row.userId + "\"><span class=\"glyphicon glyphicon-check\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"修改\" name=\"updateUser\" data-userid=\"" + row.userId + "\"><span class=\"glyphicon glyphicon-edit\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"删除\" name=\"delUser\" data-userid=\"" + row.userId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			grid.find("button[name='formRole']").on("click",user.formRole).end().
				find("button[name='updateUser']").on("click", user.updateUser).end().
				find("button[name='delUser']").on("click", user.delUser);
		}); 
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
	
	//获取选中的部门对象
	function getOrg(){
		var nodes = getDepartMentTree().getSelectedNodes();
		return nodes.length>0?nodes[0]:{};
	}
	
	//初始化事件
	function initEvent(){
		$("#id_add_user").click(function(){
			userFormModalStatus("show"); 
			userFormModelTitle("新增用户");
			userFormIframe(webRoot+"/page/admin/user/userForm.jsp");
		});
	}
	
	//初始化函数
	function init(){
        initZtree.call(this); 
        initTable.call(this);
        initEvent.call(this);
	}
	
	//定义user对象
	var User = function(ops){
		this.options = $.extend(true, {},User.defaults, ops);
		init.call(this);
	}
	
	User.defaults = {
	};
	
	User.prototype = {
		constructor:User,
		//编辑完用户后回调方法：隐藏弹出层、刷新列表
		formUserHandler:function(){
			userFormModalStatus("hide");
			$("#userGrid").bootgrid("reload");
		},
		//赋角色
		formRole:function(){
			userFormModalStatus("show"); 
			userFormModelTitle("赋角色权限");
			userFormIframe(webRoot+"/page/admin/user/getUserRoleInfo?userId="+$(this).data("userid"));
		},
		//修改用户 
		updateUser:function(){
			userFormModalStatus("show"); 
			userFormModelTitle("修改用户");
			userFormIframe(webRoot+"/page/admin/user/userForm.jsp?userId="+$(this).data("userid"));
		},
		//删除用户
		delUser:function(){
			SysUserAction.delUser({userId:$(this).data("userid")},function(data){
				if(data && data.result){
					$("#userGrid").bootgrid("reload");
				}else{
					alert("删除失败");
				}
			});
		},
		//回调处理-保存权限数据
		handAuth:function(data){
			if(!data){return;}
			var auths = data.auths;
			var roles = [];
			for(var i = 0;i<auths.length;i++){
				roles.push({roleId:auths[i].id});
			}
			var data = {userId:data.other.objId,roles:roles};
			SysUserAction.addUserRole(data,function(data){
				if(data && data.result){
					alert("保存成功");
				}else{
					alert("保存失败");
				}
			});
		}
	}
	
	_admin.User = User;
	$.admin = _admin;
})(jQuery); 

var user = new $.admin.User({});

function getTargetObject(){
	return user;
}
