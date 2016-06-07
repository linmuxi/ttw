/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
/**
 * 
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月8日 下午6:27:52
 * 
 */
(function($) {
	// 定义命名空间
	_admin = $.extend({}, $.admin);

	var resourceFormValidation;

	var resourceFormModalStatus = function(status) {
		$("#myModal").modal(status);
	}

	// 清空表单信息
	var clearForm = function() {
		$("#resourceName").val("");
		$("#resourceDesc").val("");
	}

	// 重置表单验证器
	var resetFormValidation = function() {
		resourceFormValidation.updateStatus("resourceName", "NOT_VALIDATED");
	}
	
	

	//资源添加
	var addResource = function(e){
		$("#resourceFormTitle").html("创建新资源");
		resourceFormModalStatus('show');
		clearForm();
		Resource.defaults.type = 1;
	};
	

	// 修改资源
	var updateResource = function(e) {
		$("#resourceFormTitle").html("修改资源");
		resourceFormModalStatus('show');
		Resource.defaults.type = 2;
		clearForm();

		
		var resource = $(this).data("resourceid");
		if(isNotEmpty(resource)){
			SysResourceAction.getResource({resourceId:resource},function(data){
	        		if(data && data.sucflag){
	        			var vo = data.bean;
	        			$("#resourceId").val(resource);
	        			$("#resourceName").val(vo.resourceName);
	        			var type = vo.resourceType;
	        			$("input[name='resourceType']:eq("+(vo.resource-1)+")").attr("checked","checked");
	        			$('#parent').multiselect('select', vo.moduleId);
	        			$("#resourceDesc").val(vo.resourceDesc);
	        			var del = vo.enable;
	        			$("#enable").prop('checked', del);
	        		}
	        	});
	        }
	}

	// 删除资源
	var delResource = function(e){
		var param={resourceId:$(this).data("resourceid")};
		lhgdialog.confirm('你确定要删除此条数据吗？', function(){
			SysResourceAction.delResource(param,function(data){
				if(data){
					lhgdialog.tips('删除成功');
					$("#grid-data").bootgrid("reload");
				}else{
					lhgdialog.alert("删除失败");
				}
			});
		}, function(){
			lhgdialog.tips('执行取消操作');
		});
	
	}

	// 转换请求参数
	function convertParam(request) {
		var paramObj = request;
		paramObj.pageNo = request.current;
		paramObj.pageSize = (request.rowCount == -1) ? 99999999
				: request.rowCount;
		if (request.sort) {
			for ( var key in request.sort) {
				if (key) {
					paramObj.sortFieldName = key;
					paramObj.sortType = request.sort[key];
					break;
				}
			}
		}
		return paramObj;
	}

	// 初始化事件
	function initEvent() {
		// 添加角色
		$("#id_add_resource").click(addResource);
		// 提交表单
		$("#btn_resource_submit").click(function() {
			$("#resourcetForm").submit();
		});
	}
	
	
	Date.prototype.format = function(format){
		var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(), //day
		"h+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter
		"S" : this.getMilliseconds() //millisecond
		}

		if(/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
		}

		for(var k in o) {
		if(new RegExp("("+ k +")").test(format)) {
		format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
			}
		}
		return format;
	} 

	// 初始化表格
	function initTable() {
		var grid = $("#grid-data")
				.bootgrid(
						{
							ajax : true,
							ajaxSettings : {
								method : "POST",
								cache : false
							},
							templates : {
								actions : "<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_resource\">新增</button></div>"
							},
							navigation : 3,
							searchSettings : {
								delay : 100,
								characters : 2
							},
							labels : {
								all : "全部",
								infos : "显示 {{ctx.start}} to {{ctx.end}} 共 {{ctx.total}} 条",
								loading : "加载中...",
								noResults : "没有结果",
								refresh : "刷新",
								search : "查询"
							},
							post : function() {
								return {
									resourceId : ""
								};
							},
							url : webRoot + "/page/admin/resource/index",
							formatters : {
								"enable" : function(column, row) {
									return (row.enable == 1) ? "可用" : "禁用";
								},
								"dateFormat" : function(column, row) {
									var updateDate = row.lastUpdateDate;
									if (updateDate == '' || updateDate == null) {
										return '';
									} else {
										var lastUpdate = new Date(updateDate);
										return lastUpdate.format("yyyy年MM月dd日hh小时mm分ss秒");
									}
								},
								 
								"commands" : function(column, row) {
									return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-resourceId=\""
											+ row.resourceId
											+ "\" data-resourceName=\""
											+ row.resourceName
											+ "\" data-resourceDesc=\""
											+ row.resourceDesc
											+ "\"><span class=\"glyphicon glyphicon-edit\"></span></button> "
											+ "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-resourceId=\""
											+ row.resourceId
											+ "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
								}
							},
							requestHandler : function(request) {
								return convertParam(request);
							},
							responseHandler : function(response) {
								return response;
							}
						}).on(
						"loaded.rs.jquery.bootgrid",
						function() {
							grid.find(".command-edit").on("click",updateResource).end().find(".command-delete").on("click",delResource);
						});
	}
	

	// 初始化表单验证器
	function initFormValidator() {
		$('#resourceForm').formValidation({
			message : 'This value is not valid',
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				resourceName : {
					message : 'The resourcename is not valid',
					validators : {
						notEmpty : {
							message : '资源名称必须填写，不能为空'
						},
						stringLength : {
							min : 6,
							max : 30,
							message : '长度必须大于6小于30'
						}
					}
				}
			}
		}).on('success.form.fv', function(e) {
			submitForm();
			resetFormValidation();
		});
		resourceFormValidation = $("#resourceForm").data("formValidation");
	}

	//提交
	$("#btn_resource_submit").click(function(){
		var arr = $("#resourceForm").serializeObject();
		arr.moduleId = arr.parent;
		arr.enable = (arr.enable == 'on')?1:0;
		if(Resource.defaults.type == 1){
		SysResourceAction.addResource(arr,function(data){
				if(data){
					resourceFormModalStatus('hide');
					lhgdialog.tips('新增资源成功');
					$("#grid-data").bootgrid("reload");
				}else{
					lhgdialog.tips('新增资源失败');
				}
			});
		}else if(Resource.defaults.type == 2){
			SysResourceAction.updateResource(arr,function(data){
				if(data){
					resourceFormModalStatus('hide');
					lhgdialog.tips('修改资源成功');
					$("#grid-data").bootgrid("reload");
				}else{
					lhgdialog.tips('修改资源失败');
				}
			});
		}
	});
	
	
	//初始化部门下拉框数据 
	function initModelDS(){
		 $('#parent').multiselect('dataprovider', getModelDS());
	}
	
	function getModelDS(){ 
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/module/index",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.moduleName,value:obj.moduleId});
				});
			}
		});
	    return ds;
	 }

	function init() {
		//初始化表格
		initTable.call(this);
		initModelDS.call(this);
		//初始化表单验证器
		initFormValidator.call(this);
		//初始化事件
		initEvent.call(this);
	}

	var Resource = function(ops) {
		this.options = $.extend(true, {}, Resource.defaults, ops);
		init.call(this);
	}

	Resource.defaults = {
		type : 1
	};

	_admin.Resource = Resource;
	$.admin = _admin;
})(jQuery);
new $.admin.Resource({});