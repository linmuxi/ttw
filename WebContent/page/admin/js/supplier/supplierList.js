/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
/**
 * 
 * @Description: TODO
 * @author wanglong
 * @since 2015年6月9日 下午7:46:52
 * 
 */
(function($) {
	// 定义命名空间
	_admin = $.extend({}, $.admin);

	var supplierFormValidation;

	var supplierFormModalStatus = function(status) {
		$("#myModal").modal(status);
	}
	
	var supDetailModalStatus = function(status){
		$("#supDetail").modal(status);
	}

	// 清空表单信息
	var clearForm = function() {
		$("#supplierId").val("");
		$("#supNo").val("");
		$("#contractCode").val("");
		$("#cmbPeopleName").val("");
		$("#supName").val("");
		$("#supEmail").val("");
		$("#supPhone").val("");
		$("#supFaxes").val("");
		$("#supAddress").val("");
		$("#busLicense").val("");
		$("#bankAccountName").val("");
		$("#bankAccountNo").val("");
		$("#bankAddress").val("");
		$("#linkPeopleName").val("");
		$("#linkPeoplePhone").val("");
		$("#linkPeopleQQ").val("");
		$("#linkPeopleEmail").val("");
		$("#linkPeopleAddress").val("");
		$("#headPeopleCardNo").val("");
		$("#headPeopleName").val("");
		$("#headPeoplePhone").val("");
		$("#headPeopleQQ").val("");
		$("#headPeopleEmail").val("");
		$("#supType").val("");
		$("#remark").val("");
	}

	// 重置表单验证器
	var resetFormValidation = function() {
		supplierFormValidation.updateStatus("cmbPeopleName", "NOT_VALIDATED");
	}
	
	
	
	//供应商详情
	var detailSupplier = function(e){
		supDetailModalStatus("show"); 
		$("#supDetailTitle").html("供应商详情");
		SysSupplierAction.getSupplier({supplierId:$(this).data("supplierid")},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			
        		}
        	});
        
	}

	// 添加供应商
	var addSupplier = function(e) {
		$("#supplierFormTitle").html("添加供应商");
		supplierFormModalStatus('show');
		clearForm();
		sysSupplier.defaults.type = 1;
	}

	// 修改供应商
	var updateSupplier = function(e) {
		$("#supplierFormTitle").html("修改供应商");
		supplierFormModalStatus('show');
		clearForm();
		sysSupplier.defaults.type = 2;
		
		var suppId = $(this).data("supplierid");
		if(isNotEmpty(suppId)){
			SysSupplierAction.getSupplier({supplierId:suppId},function(data){
	        		if(data && data.sucflag){
	        			var vo = data.bean;
	        			$("#supplierId").val(suppId);
	        			$("#contractCode").val(vo.contractCode);
	        			$("#cmbPeopleName").val(vo.cmbPeopleName);
	        			$("#supName").val(vo.supName);
	        			$("#supEmail").val(vo.supEmail);
	        			$("#supPhone").val(vo.supPhone);
	        			$("#supFaxes").val(vo.supFaxes);
	        			$("#supAddress").val(vo.supAddress);
	        			$("#busLicense").val(vo.busLicense);
	        			$("#bankAccountName").val(vo.bankAccountName);
	        			$("#bankAccountNo").val(vo.bankAccountNo);
	        			$("#bankAddress").val(vo.bankAddress);
	        			$("#linkPeopleName").val(vo.linkPeopleName);
	        			$("#linkPeoplePhone").val(vo.linkPeoplePhone);
	        			$("#linkPeopleQQ").val(vo.linkPeopleQQ);
	        			$("#linkPeopleEmail").val(vo.linkPeopleEmail);
	        			$("#linkPeopleAddress").val(vo.linkPeopleAddress);
	        			$("#headPeopleCardNo").val(vo.headPeopleCardNo);
	        			$("#headPeopleName").val(vo.headPeopleName);
	        			$("#headPeoplePhone").val(vo.headPeoplePhone);
	        			$("#headPeopleQQ").val(vo.headPeopleQQ);
	        			$("#headPeopleEmail").val(vo.headPeopleEmail);
	        			if(vo.supType == 0){
	        				$("input[type=radio][name=supType][value=0]").attr("checked",true);  
	        				$("div[id^='gs_']").hide();
	        			}else{
	        				$("input[type=radio][name=supType][value=1]").attr("checked",true);  
	        			    $("div[id^='gs_']").show();
	        			}
	        			//$("#supType").prop('checked', vo.supType);
	        			$("#remark").val(vo.remark);
	        		}
	        	});
	        }
	}

	// 删除供应商
	var delSupplier = function(e) {
		var param={supplierId:$(this).data("supplierid")};
		lhgdialog.confirm('你确定要删除此条数据吗？', function(){
			SysSupplierAction.delSupplier(param,function(data){
				if(data){
					lhgdialog.tips('删除成功');
					$("#supplierGrid").bootgrid("reload");
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
		paramObj.pageSize = (request.rowCount == -1) ? 99999999 : request.rowCount;
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
		// 添加供应商
		$("#id_add_supplier").click(addSupplier);
		// 提交表单
		$("#btn_supplier_submit").click(function() {
			$("#supplierForm").submit();
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
								actions : "<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_supplier\">新增</button></div>"
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
									supplierId : ""
								};
							},
							url : webRoot + "/page/admin/supplier/index",
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
								
								"supType" : function(column, row) {
									return (row.supType == 0) ? "个人" : "公司";
								},

								"commands" : function(column, row) {
									return "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"详情\" name=\"detailSupplier\" data-supplierId=\"" + row.supplierId + "\"><span class=\"glyphicon glyphicon-edit\"></span></button>"+
									       "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"修改\" name=\"updateSupplier\" data-supplierId=\"" + row.supplierId +"\"><span class=\"glyphicon glyphicon-edit\"></span></button>"+
									       "<button type=\"button\" class=\"btn btn-xs btn-default\" title=\"删除\" name=\"delSupplier\" data-supplierId=\"" + row.supplierId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
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
							grid.find("button[name='detailSupplier']").on("click",detailSupplier).end().
							find("button[name='updateSupplier']").on("click",updateSupplier).end().
							find("button[name='delSupplier']").on("click",delSupplier);
						});
	}
	

	// 初始化表单验证器
	function initFormValidator() {
		$('#supplierForm').formValidation({
			message : 'This value is not valid',
			icon : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				supplierName : {
					message : 'The suppliername is not valid',
					validators : {
						notEmpty : {
							message : '供应商名称必须填写，不能为空'
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
		supplierFormValidation = $("#supplierForm").data("formValidation");
	}

	// 提交表单
	function submitForm() {
		var arr = $("#supplierForm").serializeObject();
		arr.supType = arr.supType == 'on';
		if (sysSupplier.defaults.type == 1) {
			SysSupplierAction.addSupplier(arr,function(data){
				if(data){
					supplierFormModalStatus('hide');
					lhgdialog.tips('新增供应商成功');
					$("#grid-data").bootgrid("reload");
				}else{
					lhgdialog.tips('新增供应商失败');
				}
			});
		} else if (sysSupplier.defaults.type == 2) {
			SysSupplierAction.updateSupplier(arr,function(data){
					if(data){
						supplierFormModalStatus('hide');
						lhgdialog.tips('修改供应商成功');
						$("#grid-data").bootgrid("reload");
					}else{
						lhgdialog.tips('修改供应商失败');
					}
				});}
	}

	function init() {
		//初始化表格
		initTable.call(this);
		//初始化表单验证器
		initFormValidator.call(this);
		//初始化事件
		initEvent.call(this);
	}

	var sysSupplier = function(ops) {
		this.options = $.extend(true, {}, sysSupplier.defaults, ops);
		init.call(this);
	}

	sysSupplier.defaults = {
		type : 1
	};

	_admin.sysSupplier = sysSupplier;
	$.admin = _admin;
})(jQuery);
new $.admin.sysSupplier({});