;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	var pdModalStatus = function(status){
		$("#pdModel").modal(status);
	}
	
	var pdModelTitle = function(title){
		$("#pdTitle").html(title);
	}
	
	var pdIframe = function(src){
		$("#pdIframe").attr("src",src);
	}
	
	//初始化表格
	function initTable(){
		var grid = $("#processDefinitionGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
			    actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_processDefinition\">新增</button></div>",
	        	search:""
	        },
		    navigation:3,
		    searchSettings:{
		    	delay:100,
		    	characters:3
		    },
		    labels:{
		    	all:"全部",
		    	infos:"共 {{ctx.total}} 条，当前显示 {{ctx.start}} 至 {{ctx.end}} 条 ",
		    	loading:"加载中...",
		    	noResults:"没有结果",
		    	refresh:"刷新",
		    	search:"名称或key"
		    },
		    post: function()
		    {
		        return ProcessDefinition.defaults;
		    },
		    url: webRoot+"/page/admin/activiti/getProcessDefinitionList",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd HH:mm:ss");
		        },
		        "commands":function(column,row){
					return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"删除\" name=\"deleteDeployment\" data-deploymentId=\"" + row.deploymentId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"预览流程\" name=\"reviewProcessDefinition\" data-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-tasks\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			grid.find("button[name='deleteDeployment']").on("click",processDefinition.deleteDeployment).end().
			find("button[name='reviewProcessDefinition']").on("click",processDefinition.reviewProcessDefinition);
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
	
	//初始化事件
	function initEvent(){
		$("#id_add_processDefinition").click(function(){
			pdModalStatus("show"); 
			pdModelTitle("流程部署");
			pdIframe(webRoot+"/page/admin/activiti/processDefinitionForm.jsp");
		});
		$("#pdIframe").resizeIframe({extendHeight:20});
	}
	
	//初始化函数
	function init(){
        initTable.call(this);
        initEvent.call(this);
	}
	
	//定义任务对象
	var ProcessDefinition = function(ops){
		this.options = $.extend(true, {},ProcessDefinition.defaults, ops);
		init.call(this);
	}
	
	ProcessDefinition.defaults = {
	};
	
	ProcessDefinition.prototype = {
		constructor:ProcessDefinition,
		deleteDeployment:function(){
			var param = {id:$(this).data("deploymentid")};
			bootbox.confirm("确认删除该流程信息吗?", function(result){
				if(result){ 
					ActivitiAction.deleteDeployment(param,function(data){
						if(data){
							bootbox.alert("删除成功");
							$("#processDefinitionGrid").bootgrid("reload");
						}else{
							alert("删除失败");
						}
					});
				}
			});
		},
		reviewProcessDefinition:function(){
			pdModalStatus("show"); 
			pdModelTitle("流程预览");
			var pdSrc = webRoot+"/page/admin/activiti/reviewProcessDefinition?processDefinitionId="+$(this).data("id");
			var pdTitle = encodeURIComponent(encodeURIComponent("流程预览"));
			pdIframe(webRoot+"/page/admin/activiti/reviewProcessDefinition.jsp?pdTitle="+pdTitle+"&pdSrc="+pdSrc);
		}
	}
	
	_admin.ProcessDefinition = ProcessDefinition;
	$.admin = _admin;
})(jQuery); 

var processDefinition = new $.admin.ProcessDefinition({});

function getTargetObject(){
	return processDefinition;
}
