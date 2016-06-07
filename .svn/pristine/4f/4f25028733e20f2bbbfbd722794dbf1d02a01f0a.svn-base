;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	var vacationRequestModalStatus = function(status){
		$("#vacationRequestModel").modal(status);
	}
	
	var vacationRequestModelTitle = function(title){
		$("#vacationRequestTitle").html(title);
	}
	
	var vacationRequestIframe = function(src){
		$("#vacationRequestIframe").attr("src",src);
	}
	
	//初始化表格
	function initTable(){
		var grid = $("#vacationRequestGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
			    actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_vacationRequest\">新增</button></div>"
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
		    	search:"申请人或天数"
		    },
		    post: function()
		    {
		        return VacationRequest.defaults;
		    },
		    url: webRoot+"/page/admin/activiti/queryVacationRequestList",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd hh:mm:ss");
		        },
		        "status":function(column,row){
		        	if(row[column.id] == 1){
		        		return "待上级主管审批";
		        	}else if(row[column.id] == 2){
		        		return "待部门经理审批";
		        	}else if(row[column.id] == 3){
		        		return "待人力资源审批";
		        	}else if(row[column.id] == 4){
		        		return "处理完成";
		        	}else if(row[column.id] == 5){
		        		return "审批不通过";
		        	}
		        	return "";
		        },
		        "commands":function(column,row){
					return "";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			/*grid.find("button[name='updateModule']").on("click",module.updateModule).end().
				find("button[name='delModule']").on("click", module.delModule);*/
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
		$("#id_add_vacationRequest").click(function(){
			vacationRequestModalStatus("show"); 
			vacationRequestModelTitle("新增请假单");
			vacationRequestIframe(webRoot+"/page/admin/activiti/vacationRequestForm.jsp");
		});

		$("#vacationRequestIframe").resizeIframe({extendHeight:20});
	}
	
	//初始化函数
	function init(){
        initTable.call(this);
        initEvent.call(this);
	}
	
	//定义任务对象
	var VacationRequest = function(ops){
		this.options = $.extend(true, {},VacationRequest.defaults, ops);
		init.call(this);
	}
	
	VacationRequest.defaults = {
	};
	
	VacationRequest.prototype = {
		constructor:VacationRequest,
		formVRHandler:function(){
			vacationRequestModalStatus("hide");
			$("#vacationRequestGrid").bootgrid("reload");
		}
	}
	
	_admin.VacationRequest = VacationRequest;
	$.admin = _admin;
})(jQuery); 

var myVacationRequest = new $.admin.VacationRequest({});

function getTargetObject(){
	return myVacationRequest;
}
