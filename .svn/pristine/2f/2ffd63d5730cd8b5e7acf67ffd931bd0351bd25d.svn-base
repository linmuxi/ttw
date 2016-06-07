<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	资源列表
   @author wanglong
   @since  2015年5月24日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资源管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysResourceAction.js"></script>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table id="grid-data" class="table table-condensed table-hover table-striped" >
				    <thead>
				        <tr>
				           <!--  <th data-column-id="resourceId" style="width: 300px;background-color: red;">ID</th> -->  
				           	<th data-column-id="resourceType" data-formatter="resourceType">资源类型</th>
				            <th data-column-id="resourceName">资源名称</th>
				            <th data-column-id="resourceDesc">资源描述</th>
				            <th data-column-id="resourcePath">资源路径</th>
				            <th data-column-id="priority" >优先级</th>
				            <th data-column-id="enable" data-formatter="enable">是否可用</th>
				            <th data-column-id="moduleId" >所属模块</th>
				            <th data-column-id="lastUpdateDate"  data-formatter="dateFormat">最后修改时间</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
	</div>
	
	<!-- 资源编辑 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="resourceForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="resourceFormTitle"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form" id="resourceForm">
				   <div class="form-group">
			         <input type="hidden" id="resourceId" name="resourceId" >
				      <label for="firstname" class="col-sm-3 control-label">资源名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="resourceName" name="resourceName" 
				            placeholder="请输入名称">
				      </div>
				   </div>
				   
				  <div class="form-group">
				      <label for="moduleType" class="col-xs-3 control-label text-right">资源类型：</label>
				      <div class="col-xs-9">
				      	<label class="radio-inline">
						  <input type="radio" name="resourceType" id="resourceType1" value="1" checked="checked">URL
						</label>
						<label class="radio-inline">
						  <input type="radio" name="resourceType" id="resourceType2" value="2">METHOD
						</label>
				      </div>
				   </div>
				   
				    <div class="form-group">
				      <label for="parent" class="col-xs-3 control-label text-right">所属模块：</label>
				      <div class="col-xs-9">
				        <select id="parent" name="parent"></select>
				      </div>
				   </div>
				   
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">资源描述：</label>
				      <div class="col-sm-9">
    					 <textarea class="form-control" rows="3" placeholder="请输入描述"
    					 id="resourceDesc" name="resourceDesc" ></textarea>   
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
	            <button type="button" class="btn btn-primary" id="btn_resource_submit">提交</button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>

	
	<script type="text/javascript">
	/* (function($){
		var grid = $("#grid-data").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
		    templates: {
		    	actions:"<div class=\"{{css.actions}}\"><button type=\"button\" class=\"btn btn-default\" id=\"id_add_resource\">新增</button></div>"
		    },
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
		            resourceId: ""
		        };
		    },
		    url: webRoot+"/page/admin/resource/index",
		    formatters: {
		        "enable": function(column, row)
		        {
		            return (row.enable == 1)?"可用":"禁用";
		        },
		        "resourceType": function(column, row)
		        {
		            return (row.resourceType == 1)?"URL":"METHOD";
		        },
		        "dateFormat": function(column, row)
		        {
		        	var updateDate = row.lastUpdateDate;
		        	if(updateDate == '' || updateDate == null){
		        		return '';
		        	}else{
		        		var lastUpdate = new Date(updateDate);
		        		return lastUpdate.format("yyyy年MM月dd日hh小时mm分ss秒");
		        	}
		        },
		        
		        
		        "commands":function(column,row){
		            return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-resourceId=\"" + row.resourceId + "\" data-resourceName=\"" + row.resourceName + "\" data-resourceDesc=\"" + row.resourceDesc + "\" data-enable=\"" + row.enable + "\"><span class=\"glyphicon glyphicon-edit\"></span></button> " + 
		                "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-resourceId=\"" + row.resourceId + "\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			    grid.find(".command-edit").on("click", upateResource).end().find(".command-delete").on("click", delResource);
			});
		
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
		//资源添加
		$("#id_add_resource").click(function(){
			$("#resourceForm").html("创建新资源");
			resourceFormModalStatus('show');
			clearForm();
			type = 1;
		});
		
		//资源修改
		var upateResource = function(e){
			$("#resourceForm").html("修改资源");
			resourceFormModalStatus('show');
			type = 2;
			$("#resourceId").val($(this).data("resourceid"));
			$("#resourceName").val($(this).data('resourcename'));
			$("#resourceDesc").val($(this).data('resourcedesc'));
			$("#enable").val($(this).data('enable'));
			$("#enable").prop('checked',$(this).data('enable'));
		}
		
		var delResource = function(e){
			SysResourceAction.delResource({resourceId:$(this).data("resourceid")},function(data){
				if(data){
					$("#grid-data").bootgrid("reload");
				}else{
					alert("删除失败");
				}
			});
		}
		
		//提交
		$("#btn_resource_submit").click(function(){
			//校验
			if(validateForm()){return};
			if(type == 1){
				SysResourceAction.addResource({resourceName:$("#resourceName").val(),resourceType:$("resourceType").val(),resourceDesc:$("#resourceDesc").val(),
					enable:$("#enable").is(":checked")?1:0},function(data){
					if(data){
						resourceFormModalStatus('hide');
						$("#grid-data").bootgrid("reload");
					}else{
						alert("创建失败");
					}
				});
			}else if(type == 2){
				SysResourceAction.updateResource({resourceId:$("#resourceId").val(),resourceName:$("#resourceName").val(),resourceType:$("resourceType").val(),resourceDesc:$("#resourceDesc").val(),
					enable:$("#enable").is(":checked")?1:0},function(data){
					if(data){
						resourceFormModalStatus('hide');
						$("#grid-data").bootgrid("reload");
					}else{
						alert("修改失败");
					}
				});
			}
		});
		
		var validateForm = function(){
			var resourceName = $("#resourceName").val();
			if(isEmpty(resourceName)){
				alert("资源名称不能为空。");
				return true;
			}
			return false;
		}
		
		var resourceFormModalStatus = function(status){
			$("#myModal").modal(status);
		}
		
		var clearForm = function(){
			$("#resourceName").val("");
			$("#resourceDesc").val("");
		}
		
		var isEmpty = function(str){
			return (str == undefined || str == null || str.toUpperCase() == 'NULL' || str.trim() == '');
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
	})(jQuery); */
	
	
	</script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/admin/js/resource/resourceList.js"></script>
</body>
</html>