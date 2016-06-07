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

	var departmentFormValidation;

	var departmentFormModalStatus = function(status) {
		$("#myModal").modal(status);
	}

	// 清空表单信息
	var clearForm = function() {
		$("#orgName").val("");
		$("#orgRemark").val("");
		$("#isDel").val("");
	}

	// 重置表单验证器
	var resetFormValidation = function() {
		departmentFormValidation.updateStatus("orgName", "NOT_VALIDATED");
	}
	
	

	// 添加部门
	var addDepartment = function(e) {
		$("#departmentForm").html("创建新部门");
		departmentFormModalStatus('show');
		clearForm();
		Department.defaults.type = 1;
	}

	// 修改部门
	var updateDepartment = function(e) {
		$("#departmentForm").html("修改部门");
		departmentFormModalStatus('show');
		Department.defaults.type = 2;
		clearForm();
		/*$("#departmentId").val($(this).data("departmentid"));
		$("#orgName").val($(this).data('orgname'));
		var parent = $(this).data("parentid");alert(parent);
		$('#parent').multiselect('select', parent);
		$("#orgRemark").val($(this).data('orgremark'));
		$("#isDel").prop('checked', $(this).data('isDel'));*/
		
		var department = $(this).data("departmentid");
		if(isNotEmpty(department)){
			 SysDepartmentAction.getDepartment({departmentId:department},function(data){
	        		if(data && data.sucflag){
	        			var vo = data.bean;
	        			$("#departmentId").val(department);
	        			$("#orgName").val(vo.orgName);
	        			$('#parent').multiselect('select', vo.parentId);
	        			$("#orgRemark").val(vo.orgRemark);
	        			var del = vo.isDel == 1 ? 0 : 1;
	        			$("#isDel").prop('checked', del);
	        		}
	        	});
	        }
	}

	// 删除部门
	var delDepartment = function(e) {
		var param={departmentId:$(this).data("departmentid")};
		lhgdialog.confirm('你确定要删除此条数据吗？', function(){
			SysDepartmentAction.delDepartment(param,function(data){
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
		$("#id_add_department").click(addDepartment);
		// 提交表单
		$("#btn_department_submit").click(function() {
			$("#departmentForm").submit();
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
								actions : "<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_department\">新增</button></div>"
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
									departmentId : ""
								};
							},
							url : webRoot + "/page/admin/department/index",
							formatters : {
								"isDel" : function(column, row) {
									return (row.isDel == 0) ? "可用" : "禁用";
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
									return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-departmentId=\""
											+ row.departmentId
											+ "\" data-orgName=\""
											+ row.orgName
											+ "\" data-orgRemark=\""
											+ row.orgRemark
											+ "\"><span class=\"glyphicon glyphicon-edit\"></span></button> "
											+ "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-departmentId=\""
											+ row.departmentId
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
							grid.find(".command-edit").on("click",updateDepartment).end().find(".command-delete").on("click",delDepartment);
						});
	}
	

	// 初始化表单验证器
	function initFormValidator() {
		$('#departmentForm').formValidation({
			message : 'This value is not valid',
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				departmentName : {
					message : 'The departmentname is not valid',
					validators : {
						notEmpty : {
							message : '部门名称必须填写，不能为空'
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
		departmentFormValidation = $("#departmentForm").data("formValidation");
	}

	// 提交表单
	function submitForm() {
		if (Department.defaults.type == 1) {
			SysDepartmentAction.addDepartment({orgName:$("#orgName").val(),parentId:$("#parent").val(),orgRemark:$("#orgRemark").val(),isDel:$("#isDel").val()},
				function(data){
				if(data){
					departmentFormModalStatus('hide');
					lhgdialog.tips('新增部门成功');
					$("#grid-data").bootgrid("reload");
				}else{
					lhgdialog.tips('新增部门失败');
				}
			});
		} else if (Department.defaults.type == 2) {
				SysDepartmentAction.updateDepartment({departmentId:$("#departmentId").val(),orgName:$("#orgName").val(),parentId:$("#parent").val(),orgRemark:$("#orgRemark").val(),isDel:$("#isDel").val()},
					function(data){
					if(data){
						departmentFormModalStatus('hide');
						lhgdialog.tips('修改部门成功');
						$("#grid-data").bootgrid("reload");
					}else{
						lhgdialog.tips('修改部门失败');
					}
				});}
	}
	
	
	//初始化部门下拉框数据 
	function initDepartMentDS(){
		 $('#parent').multiselect('dataprovider', getDepartMentDS());
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

	function init() {
		//初始化表格
		initTable.call(this);
		initDepartMentDS.call(this);
		//初始化表单验证器
		initFormValidator.call(this);
		//初始化事件
		initEvent.call(this);
	}

	var Department = function(ops) {
		this.options = $.extend(true, {}, Department.defaults, ops);
		init.call(this);
	}

	Department.defaults = {
		type : 1
	};

	_admin.Department = Department;
	$.admin = _admin;
})(jQuery);
new $.admin.Department({});