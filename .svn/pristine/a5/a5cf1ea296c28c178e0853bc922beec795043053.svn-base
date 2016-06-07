/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
/**
 * 
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月19日 下午6:27:52
 * 
 */
(function($) {
	// 定义命名空间
	_admin = $.extend({}, $.admin);

	var authorityFormValidation;

	var authorityFormModalStatus = function(status) {
		$("#myModal").modal(status);
	}

	// 清空表单信息
	var clearForm = function() {
		$("#authorityMark").val("");
		$("#authorityName").val("");
		$("#authorityDesc").val("");
		$("#message").val("");
	}

	// 重置表单验证器
	var resetFormValidation = function() {
		authorityFormValidation.updateStatus("authorityMark", "NOT_VALIDATED");
	}
	
	

	// 添加权限
	var addAuthority = function(e) {
		$("#authorityFormTitle").html("创建新权限");
		authorityFormModalStatus('show');
		clearForm();
		Authority.defaults.type = 1;
	}

	// 修改权限
	var updateAuthority = function(e) {
		$("#authorityFormTitle").html("修改权限");
		authorityFormModalStatus('show');
		Authority.defaults.type = 2;
		clearForm();
		
		var authority = $(this).data("authorityid");
		if(isNotEmpty(authority)){
			SysAuthorityAction.getAuthority({authorityId:authority},function(data){
	        		if(data && data.sucflag){
	        			var vo = data.bean;
	        			$("#authorityId").val(authority);
	        			$("#authorityMark").val(vo.authorityMark);
	        			$("#authorityName").val(vo.authorityName);
	        			$("#authorityDesc").val(vo.authorityDesc);
	        			//$('#parent').multiselect('select', vo.parentId);
	        			$("#message").val(vo.message);
	        			$("#enable").attr("checked",vo.enable);
	        		}
	        	});
	        }
	}

	// 删除权限
	var delAuthority = function(e) {
		var param={authorityId:$(this).data("authorityid")};
		lhgdialog.confirm('你确定要删除此条数据吗？', function(){
			SysAuthorityAction.delAuthority(param,function(data){
				if(data){
					lhgdialog.tips('删除成功');
					$("#authorityGrid").bootgrid("reload");
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
		$("#id_add_authority").click(addAuthority);
		// 提交表单
		$("#btn_authority_submit").click(function() {
			$("#authorityForm").submit();
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
		var grid = $("#authorityGrid")
				.bootgrid(
						{
							ajax : true,
							ajaxSettings : {
								method : "POST",
								cache : false
							},
							templates : {
								actions : "<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_authority\">新增</button></div>"
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
									authorityId : ""
								};
							},
							url : webRoot + "/page/admin/authority/index",
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
									return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-authorityId=\""+ row.authorityId+ "\"><span class=\"glyphicon glyphicon-edit\"></span></button> "
										  + "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-authorityId=\""+ row.authorityId+ "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
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
							grid.find(".command-edit").on("click",updateAuthority).end().find(".command-delete").on("click",delAuthority);
						});
	}
	

	// 初始化表单验证器
	function initFormValidator() {
		$('#authorityForm').formValidation({
			message : 'This value is not valid',
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				authorityName : {
					message : 'The authorityname is not valid',
					validators : {
						notEmpty : {
							message : '权限名称必须填写，不能为空'
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
		authorityFormValidation = $("#authorityForm").data("formValidation");
	}

	// 提交表单
	function submitForm() {
		var arr = $("#authorityForm").serializeObject();
		arr.enable = arr.enable == 'on';
		if (Authority.defaults.type == 1) {
			SysAuthorityAction.addAuthority(arr,
				function(data){
				if(data){
					authorityFormModalStatus('hide');
					lhgdialog.tips('新增成功');
					$("#authorityGrid").bootgrid("reload");
				}else{
					lhgdialog.tips('新增失败');
				}
			});
		} else if (Authority.defaults.type == 2) {
			SysAuthorityAction.updateAuthority(arr,
					function(data){
					if(data){
						authorityFormModalStatus('hide');
						lhgdialog.tips('修改成功');
						$("#authorityGrid").bootgrid("reload");
					}else{
						lhgdialog.tips('修改失败');
					}
				});}
	}
	
	
	//初始化权限下拉框数据 
	function initAuthorityDS(){
		 $('#parent').multiselect('dataprovider', getAuthorityDS());
	}
	
	function getAuthorityDS(){ 
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/authority/index",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.orgName,value:obj.authorityId});
				});
			}
		});
	    return ds;
	 }

	function init() {
		//初始化表格
		initTable.call(this);
		//initAuthorityDS.call(this);
		//初始化表单验证器
		initFormValidator.call(this);
		//初始化事件
		initEvent.call(this);
	}

	var Authority = function(ops) {
		this.options = $.extend(true, {}, Authority.defaults, ops);
		init.call(this);
	}

	Authority.defaults = {
		type : 1
	};

	_admin.Authority = Authority;
	$.admin = _admin;
})(jQuery);
new $.admin.Authority({});