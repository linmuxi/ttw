;(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);

	var fpModalStatus = function(status){
		$("#fpModel").modal(status);
	}
	
	var fpModelTitle = function(title){
		$("#fpTitle").html(title);
	}
	
	var fpIframe = function(src){
		$("#fpIframe").attr("src",src);
	}
	
	//初始化表格
	function initTable(){
		var grid = $("#formProcessGrid").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
	        templates: {  
	        	actionButton:"<button class=\"btn btn-default\" type=\"button\" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
			    actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_formProcess\">新增</button></div>"
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
		    	search:"表单名称或流程名称"
		    },
		    post: function()
		    {
		        return FormProcess.defaults;
		    },
		    url: webRoot+"/page/admin/activiti/queryFormProcessList",
		    formatters: {
		        "date": function(column, row)
		        {
		            return new Date(row[column.id]).pattern("yyyy/MM/dd HH:mm:ss");
		        },
		        "commands":function(column,row){
					return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"删除\" name=\"deleteFormProcess\" data-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>"+
					"<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"修改\" name=\"updateFormProcess\" data-id=\"" + row.id + "\"><span class=\"glyphicon glyphicon-edit\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			grid.find("button[name='deleteFormProcess']").on("click",formProcess.deleteFormProcess).end().
			find("button[name='updateFormProcess']").on("click",formProcess.updateFormProcess);
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
		$("#id_add_formProcess").click(function(){
			fpModalStatus("show"); 
			fpModelTitle("表单流程配置");
			fpIframe(webRoot+"/page/admin/activiti/formProcessForm.jsp");
		});

		$("#fpIframe").resizeIframe({extendHeight:20});
	}
	
	//初始化函数
	function init(){
        initTable.call(this);
        initEvent.call(this);
	}
	
	var FormProcess = function(ops){
		this.options = $.extend(true, {},FormProcess.defaults, ops);
		init.call(this);
	}
	
	FormProcess.defaults = {
	};
	
	FormProcess.prototype = {
		constructor:FormProcess,
		formProcessHandler:function(){
			fpModalStatus("hide");
			$("#formProcessGrid").bootgrid("reload");
		},
		deleteFormProcess:function(){
			var id = $(this).data("id");
			bootbox.dialog({
			  message: "确认删除该条数据吗？",
			  title: "删除确认",
			  buttons: {
			    success: {
			      label: "是",
			      className: "btn-success",
			      callback: function() {
			    	  FormProcessAction.deleteFormProcess({id:id},function(data){
							if(data && data.result){
								bootbox.alert("删除成功")
								$("#formProcessGrid").bootgrid("reload");
							}else{
								bootbox.alert("删除失败")
							}
						});
			      }
			    },
			    danger: {
			      label: "否",
			      className: "btn-danger",
			      callback: function() {
			      }
			    }
			  }
			});
		},
		updateFormProcess:function(){
			fpModalStatus("show"); 
			fpModelTitle("业务表单流程修改");
			fpIframe(webRoot+"/page/admin/activiti/formProcessForm.jsp?id="+$(this).data("id"));
		}
	}
	
	_admin.FormProcess = FormProcess;
	$.admin = _admin;
})(jQuery); 

var formProcess = new $.admin.FormProcess({});

function getTargetObject(){
	return formProcess;
}
