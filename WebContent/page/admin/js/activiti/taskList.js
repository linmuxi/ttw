;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	var taskModalStatus = function(status){
		$("#taskModel").modal(status);
	}
	
	var taskModelTitle = function(title){
		$("#taskTitle").html(title);
	}
	
	var taskIframe = function(src){
		$("#taskIframe").attr("src",src);
	}
	
	//初始化表格
	function initTable(){
		var grid = $("#myTaskGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
	        	search:""
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
		    	search:"任务名称或描述"
		    },
		    post: function()
		    {
		        return Task.defaults;
		    },
		    url: webRoot+"/page/admin/activiti/getTaskList",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd hh:mm:ss");
		        },
		        "commands":function(column,row){
					return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"查看审批流程\" name=\"reviewProcess\" data-taskid=\"" + row.id + "\"><span class=\"glyphicon glyphicon-check\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"审批\" name=\"approval\" data-taskid=\"" + row.id + "\" data-id=\"" + row.id + "\" data-businessid=\"" + row.businessId + "\" data-formkey=\"" + row.formKey + "\"  ><span class=\"glyphicon glyphicon-check\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			grid.find("button[name='reviewProcess']").on("click",myTask.reviewProcess).end().
				find("button[name='approval']").on("click", myTask.approval);
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
		/**
		var $taskIframe = $("#taskIframe");
		$taskIframe.load(function(){
			//自适应iframe高度
			var doc = $taskIframe[0].contentDocument.documentElement;
			$taskIframe.attr("height",doc.offsetHeight+"px");
			$taskIframe.attr("width",doc.offsetWidth+"px");
			$(".modal-dialog").width(doc.offsetWidth+100);
			$(".modal-dialog").height(doc.offsetHeight+100);
		});
		**/

		$("#taskIframe").resizeIframe({extendHeight:20});
	}
	
	//初始化函数
	function init(){
        initTable.call(this);
        initEvent.call(this);
	}
	
	//定义任务对象
	var Task = function(ops){
		this.options = $.extend(true, {},Task.defaults, ops);
		init.call(this);
	}
	
	Task.defaults = {
	};
	
	Task.prototype = {
		constructor:Task,
		taskHandler:function(){
			taskModalStatus("hide");
			$("#myTaskGrid").bootgrid("reload");
		},
		reviewProcess:function(){
			taskModalStatus("show"); 
			taskModelTitle("流程预览");
			var taskSrc = webRoot+"/page/admin/activiti/reviewNowProcess?taskId="+$(this).data("taskid");
			var taskTitle = encodeURIComponent(encodeURIComponent("流程预览"));
			taskIframe(webRoot+"/page/admin/activiti/reviewProcessDefinition.jsp?pdTitle="+taskTitle+"&pdSrc="+taskSrc);
		},
		approval:function(){
			taskModalStatus("show"); 
			taskModelTitle("流程审批");
			var src = webRoot+$(this).data("formkey")+"?id="+$(this).data("businessid")+"&taskId="+$(this).data("taskid");
			taskIframe(webRoot+"/page/admin/activiti/approvalForm.jsp?src="+src);
		}
	}
	
	_admin.Task = Task;
	$.admin = _admin;
})(jQuery); 

var myTask = new $.admin.Task({});

function getTargetObject(){
	return myTask;
}
