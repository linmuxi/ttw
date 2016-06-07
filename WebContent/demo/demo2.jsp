<%--

表格插件：http://www.jquery-bootgrid.com/
下拉框插件：http://davidstutz.github.io/bootstrap-multiselect
日期插件：http://www.daterangepicker.com/
富文本插件：http://summernote.org/   ps:问题在ie9下，无法上传本地图片
表单验证插件：http://formvalidation.io/

 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有控件用法</title>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script src="${pageContext.request.contextPath}/dwr/interface/SysRoleAction.js"></script>

<!-- 表格组件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/bootgrid/jquery.bootgrid.min.css">
<script src="${pageContext.request.contextPath}/page/common/js/bootgrid/jquery.bootgrid.js"></script>
<!-- 表格组件 -->

<!-- 下拉框组件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/multiselect/css/bootstrap-multiselect.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/multiselect/js/bootstrap-multiselect.js"></script>
<!-- 下拉框组件 -->

<!-- 日期组件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/daterangepicker/css/daterangepicker-bs3.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/daterangepicker/js/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/daterangepicker/js/daterangepicker.js"></script>
<!-- 日期组件 -->

<!-- 富文本组件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/summernote/css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/summernote/css/summernote.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/summernote/js/summernote.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/summernote/lang/summernote-zh-CN.js"></script>
<!-- 富文本组件 -->

<!-- 表单验证 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/page/common/js/validation/css/formValidation.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/validation/js/formValidation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/common/js/validation/js/framework/bootstrap.js"></script>
<!-- 表单验证 -->

</head>
<body>
	<jsp:include page="../page/admin/top.jsp" />
	<!-- 根容器 -->
	<div class="container" style="margin-top:55px;">
		<!-- 第一行 -->
		<div class="row">
			<!-- 第一列 -->
			<div class="col-lg-12">
				<h3>表格</h3>
				<table id="grid-data" class="table table-condensed table-hover table-striped" >
				    <thead>
				        <tr>
				            <th data-column-id="roleId" style="width: 300px;background-color: red;">ID</th>
				            <th data-column-id="roleName" width="600">角色名称</th>
				            <th data-column-id="roleDesc">角色描述</th>
				            <th data-column-id="enable" data-formatter="enable">是否可用</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>下拉框</h3>
				<!-- 多选 -->
				<select id="example-getting-started" multiple="multiple">
				    <option value="cheese">Cheese</option>
				    <option value="tomatoes">Tomatoes</option>
				    <option value="mozarella" selected>Mozzarella</option>
				    <option value="mushrooms">Mushrooms</option>
				    <option value="pepperoni">Pepperoni</option>
				    <option value="onions">Onions</option>
				</select>
				<!-- 单选 -->
				<select id="example-single">
				    <option value="1">Option 1</option>
				    <option value="2" selected>Option 2</option>
				    <option value="3">Option 3</option>
				    <option value="4">Option 4</option>
				    <option value="5">Option 5</option>
				    <option value="6">Option 6</option>
				</select>
				<!-- 分组多选下拉框 -->
				<select id="example-multiple-optgroups"  multiple="multiple">
				    <optgroup label="Group 1">
				        <option value="1-1">Option 1.1</option>
				        <option value="1-2" selected="selected">Option 1.2</option>
				        <option value="1-3" selected="selected">Option 1.3</option>
				    </optgroup>
				    <optgroup label="Group 2">
				        <option value="2-1">Option 2.1</option>
				        <option value="2-2">Option 2.2</option>
				        <option value="2-3">Option 2.3</option>
				    </optgroup>
				</select>
				<!-- 无数据禁用 -->
				<select id="example-disableIfEmpty"></select>
				<select id="example-large-dataprovider" multiple="multiple"></select>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>日期</h3>
				范围选择：<input type="text" name="daterange" value="2015-1-1 - 2015-12-1" />
				<br/>单选：<input type="text" name="birthdate" value="2015/5/25" />
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<h3>富文本</h3>
				<div class="summernote">你好</div>
				<button class="btn btn-primary" id="id_get_text">获取文本</button>
			</div>
		</div>
	</div>
	
	<!-- 这里定义的是一个模态窗体 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="roleForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="roleForm"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form" id="defaultForm">
				   <div class="form-group">
			         <input type="hidden" id="roleId" name="roleId" >
				      <label for="firstname" class="col-sm-3 control-label">角色名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="roleName" name="roleName" 
				            placeholder="请输入名字" required>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">角色描述：</label>
				      <div class="col-sm-9">
    					 <textarea class="form-control" rows="3" placeholder="请输入描述"
    					 id="roleDesc" name="roleDesc" ></textarea>   
				      </div>
				   </div>
				   <div class="form-group">
				      <div class="col-sm-offset-3 col-sm-9">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="enable" id="enable" checked="checked"> 是否可用
				            </label>
				         </div>
				      </div>
				   </div>
				</form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary" id="btn_role_submit">提交</button>
	         </div>
	      </div>
		</div>
	</div>
	<!-- 这里定义的是一个模态窗体 end -->
	
	<script type="text/javascript">
	
	(function($){
		//初始化事件
		initEvent();
		//初始化表格
		initTable();
		//初始化下拉框
		initSelect();
		//初始化日期
		initDatePicker();
		//初始化富文本
		initSummernote();
		//初始化表单验证器
		initFormValidator();

		function initSummernote(){
		  $('.summernote').summernote({
			    lang: 'zh-CN' // default: 'en-US'
		  });
		}
		
		function initDatePicker(){
			$('input[name="daterange"]').daterangepicker({
		        format: 'YYYY-MM-DD',
		        minDate: '2015-1-1',
		        maxDate: '2015-12-1',
		        dateLimit: { days: 6 }
		    });
			
			$('input[name="birthdate"]').daterangepicker({
			        format: 'YYYY/MM/DD',
			        singleDatePicker: true,
			        showDropdowns: true
			   }, function(start, end, label) {
			        var years = moment().diff(start, 'years');
			        //alert("You are " + years + " years old.");
			    });
		}
		
		function initSelect(){
			 $('#example-getting-started').multiselect();
			 $('#example-single').multiselect();
			 $('#example-multiple-optgroups').multiselect();
			 $('#example-disableIfEmpty').multiselect({disableIfEmpty: true});
			
			 $('#example-large-dataprovider').multiselect({
	            maxHeight: 200,
	            enableClickableOptGroups:true
	         });
			 $('#example-large-dataprovider').multiselect('dataprovider', getSelectData());
		}
		
		function initTable(){
			var grid = $("#grid-data").bootgrid({
			    ajaxSettings:{
			    	method:"POST",
			    	cache:false
			    },
			    templates: {
			    	actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_role\">新增</button></div>"
			    },
			    ajax:true,
			    navigation:3,
			    searchSettings:{
			    	delay:100,
			    	characters:2
			    },
			    labels:{
			    	all:"全部",
			    	infos:"显示 {{ctx.start}} to {{ctx.end}} 共 {{ctx.total}} 条",
			    	loading:"加载中...",
			    	noResults:"没有结果",
			    	refresh:"刷新",
			    	search:"查询"
			    },
			    post: function ()
			    {
			        return {
			            roleId: ""
			        };
			    },
			    url: webRoot+"/page/admin/role/index",
			    formatters: {
			        "enable": function(column, row)
			        {
			            return (row.enable == 1)?"可用":"禁用";
			        },
			        "commands":function(column,row){
			            return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-roleId=\"" + row.roleId + "\" data-roleName=\"" + row.roleName + "\" data-roleDesc=\"" + row.roleDesc + "\" data-enable=\"" + row.enable + "\"><span class=\"glyphicon glyphicon-edit\"></span></button> " + 
			                "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-roleId=\"" + row.roleId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
			        }
			    },
			    requestHandler:function(request){
			    	return convertParam(request);
			    },
			    responseHandler:function(response){
			    	return response;
			    }
			}).on("loaded.rs.jquery.bootgrid", function(){
				    grid.find(".command-edit").on("click", upateRole).end().find(".command-delete").on("click", delRole);
				});
		}

		function initEvent(){
			$("#id_get_text").click(function(){
				var sHTML = $('.summernote').code();
				alert(sHTML);
			});
		}
		
		/**
		    格式：无分组：[{label:"key",value:""}]
		    格式：有分组：[{label:"key",children:[{label:"key",value:""}]}]
		**/
		function getSelectData(){
			var data = [];
		    for (var i = 0; i < 10; i++) {
		        var group = {label: 'Group ' + (i + 1), children: []};
		        for (var j = 0; j < 4; j++) {
		            group['children'].push({
		                label: 'Option ' + (i + 1) + '.' + (j + 1),
		                value: i + '-' + j
		            });
		        }
		 
		        data.push(group);
		    }
		    return data;
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
		var type = -1;
		//角色添加
		$("#id_add_role").click(function(){
			$("#roleForm").html("创建新角色");
			clearForm();
			roleFormModalStatus('show');
			type = 1;
		});
		
		//角色修改
		var upateRole = function(e){
			$("#roleForm").html("修改角色");
			roleFormModalStatus('show');
			type = 2;
			$("#roleId").val($(this).data("roleid"));
			$("#roleName").val($(this).data('rolename'));
			$("#roleDesc").val($(this).data('roledesc'));
			$("#enable").val($(this).data('enable'));
			$("#enable").prop('checked',$(this).data('enable'));
		}
		
		//删除角色
		var delRole = function(e){
			SysRoleAction.delRole({roleId:$(this).data("roleid")},function(data){
				if(data){
					$("#grid-data").bootgrid("reload");
				}else{
					alert("删除失败");
				}
			});
		}
		
		//提交按钮事件
		$("#btn_role_submit").click(function(){
			$("#defaultForm").submit();
		});

		function initFormValidator(){
			$('#defaultForm')
	        .formValidation({
	            message: 'This value is not valid',
	            icon: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {
	                roleName: {
	                    message: 'The rolename is not valid',
	                    validators: {
	                        notEmpty: {
	                            message: '角色名称必须填写，不能为空'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 30,
	                            message: '长度必须大于6小于30'
	                        },
	                        /*remote: {
	                            url: 'remote.php',
	                            message: 'The username is not available'
	                        },*/
	                        regexp: {
	                            regexp: /^[a-zA-Z0-9_\.]+$/,
	                            message: '只能以数字、字母、下划线命名'
	                        }
	                    }
	                }
	            }
	        })
	        .on('success.form.fv', function(e) {
	            // Get the form instance
	            var $form = $(e.target);
	            // Get the FormValidation instance
	            var bv = $form.data('formValidation');
				//在这里提交后台处理 $form.serialize();
	            submitForm();
	        });
		}
		
		var submitForm = function(){
			if(type == 1){ 
				SysRoleAction.addRole({roleName:$("#roleName").val(),roleDesc:$("#roleDesc").val(),
					enable:$("#enable").is(":checked")?1:0},function(data){
					if(data.result){
						roleFormModalStatus('hide');
						$("#grid-data").bootgrid("reload");
					}else{
						alert("创建失败,"+data.remark);
					}
				});
			}else if(type == 2){
				SysRoleAction.updateRole({roleId:$("#roleId").val(),roleName:$("#roleName").val(),roleDesc:$("#roleDesc").val(),
					enable:$("#enable").is(":checked")?1:0},function(data){
					if(data.result){
						roleFormModalStatus('hide');
						$("#grid-data").bootgrid("reload");
					}else{
						alert("修改失败,"+data.remark);
					}
				});
			}
		}
		
		var roleFormModalStatus = function(status){
			$("#myModal").modal(status);
		}
		
		var clearForm = function(){
			$("#roleName").val("");
			$("#roleDesc").val("");
		}
		
		var isEmpty = function(str){
			return (str == undefined || str == null || str.toUpperCase() == 'NULL' || str.trim() == '');
		}
		
	})(jQuery);
	</script>
</body>
</html>