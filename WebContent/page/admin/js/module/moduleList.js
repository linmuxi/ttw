;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	//隐藏或显示模块编辑窗体
	var moduleFormModalStatus = function(status){
		$("#moduleFormModel").modal(status);
	}
	
	//设置模块编辑title
	var moduleFormModelTitle = function(title){
		$("#moduleFormTitle").html(title);
	}
	
	//设置模块编辑URL
	var moduleFormIframe = function(src){
		$("#moduleFormIframe").attr("src",src);
	}

	var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey:"moduleId",
				pIdKey:"parent", 
				rootPId:"-1"
			},
			key:{
				name:"moduleName"
			}
		},
		callback:{
			onClick:manageModuleTreeClick
		}
	};
	
	//初始化管理模块树			
	var initZtree = function(){
		loadManageModuleTreeData();
	}
	
	//加载树数据
	function loadManageModuleTreeData(){
		SysModuleAction.getModuleTree({parent:-1,moduleType:1},function(data){
			var treeData = [{moduleId:-1,parent:-100,moduleName:"根节点",open:true}];
			if(data&&data.moduleTree){
				treeData = treeData.concat(data.moduleTree);
			}
			$.fn.zTree.init($("#manageModuleTree"), setting, treeData);
			selectNode(getManageModuleTree().getNodeByParam("id", -1, null));
		});
	}
	
	//选中指定节点
	function selectNode(node){
		getManageModuleTree().selectNode(node);
	}
	
	//获取管理模块树对象
	function getManageModuleTree(){
		return $.fn.zTree.getZTreeObj("manageModuleTree");
	}
	
	//点击管理模块树事件
	function manageModuleTreeClick(event, treeId, treeNode){
		Module.defaults.parent = treeNode.moduleId;
		$("#pageModuleGrid").bootgrid("reload",null);
	}
	
	
	//初始化表格
	function initTable(){
		var grid = $("#pageModuleGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
			    actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_module\">新增</button></div>"
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
		    	search:"名称或说明"
		    },
		    post: function()
		    {
		        return Module.defaults;
		    },
		    url: webRoot+"/page/admin/module/index",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd");
		        },
		        "commands":function(column,row){
					return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"修改\" name=\"updateModule\" data-moduleid=\"" + row.moduleId + "\"><span class=\"glyphicon glyphicon-edit\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"删除\" name=\"delModule\" data-moduleid=\"" + row.moduleId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		        },
		        "enable":function(column,row){
		        	return row[column.id]==1?"可用":"不可用";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			grid.find("button[name='updateModule']").on("click",module.updateModule).end().
				find("button[name='delModule']").on("click", module.delModule);
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
	
	//获取选中的管理模块对象
	function getOrg(){
		var nodes = getManageModuleTree().getSelectedNodes();
		return nodes.length>0?nodes[0]:{};
	}
	
	//初始化事件
	function initEvent(){
		$("#id_add_module").click(function(){
			moduleFormModalStatus("show"); 
			moduleFormModelTitle("新增模块");
			moduleFormIframe(webRoot+"/page/admin/module/moduleForm.jsp");
		});
	}
	
	//初始化函数
	function init(){
        initZtree.call(this); 
        initTable.call(this);
        initEvent.call(this);
	}
	
	//定义Module对象
	var Module = function(ops){
		this.options = $.extend(true, {},Module.defaults, ops);
		init.call(this);
	}
	
	Module.defaults = {
	};
	
	Module.prototype = {
		constructor:Module,
		//编辑完后回调方法：隐藏弹出层、刷新列表
		formHandler:function(){
			moduleFormModalStatus("hide");
			$("#pageModuleGrid").bootgrid("reload");
			loadManageModuleTreeData();
		},
		//修改模块
		updateModule:function(){
			moduleFormModalStatus("show"); 
			moduleFormModelTitle("修改模块");
			moduleFormIframe(webRoot+"/page/admin/module/moduleForm.jsp?moduleId="+$(this).data("moduleid"));
		},
		//删除模块
		delModule:function(){
			var param={moduleId:$(this).data("moduleid")};
			lhgdialog.confirm('你确定要删除此条数据吗？', function(){
				SysModuleAction.delModule(param,function(data){
					if(data){
						lhgdialog.tips('删除成功');
						$("#pageModuleGrid").bootgrid("reload");
					}else{
						lhgdialog.alert("删除失败");
					}
				});
			}, function(){
				lhgdialog.tips('执行取消操作');
			});
		
		}
	}
	
	_admin.Module = Module;
	$.admin = _admin;
})(jQuery); 

var module = new $.admin.Module({});

function getTargetObject(){
	return module;
}
