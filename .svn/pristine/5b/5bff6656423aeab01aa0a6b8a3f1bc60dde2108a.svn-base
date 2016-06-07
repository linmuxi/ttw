$(function() {

	getModelDS = function (){ 
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
	},

	//初始化部门下拉框数据 
	initModelDS = function (){
		 $('#parent').multiselect('dataprovider', getModelDS());
	},

	initFormValidator = function (){
		//资源名称必须填写
		var resourceName = $("#resourceName").val();
		if(resourceName == ""){
			formwarning("#alerterror", "资源名称必须填写，不能为空");
			return false;
		}
		
		//优先级最多三位
		var priority = $("#priority").val();
		
		//长度必须大于6小于30
		if(priority.length > 3){
			formwarning("#alerterror", "优先级长度不能大于3位数");
			return false;
		}
		
		return true;
	},
	
	addResourceFun = function (){
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		SysResourceAction.addResource({
				moduleId:$("#parent").val(),
				resourceName:$("#resourceName").val(),
				resourceType:$("input[name='resourceType']:checked").val(),
				resourceDesc:$("#resourceDesc").val(),
				resourcePath:$("#resourcePath").val(),
				priority:$("#priority").val(),
				enabled:$("#enable").is(":checked")
			}, function(data){
				$("body").unmask();
			if(data){
				//跳转到资源列表页面
				window.location.href = webRoot +"page/platform/resource/resourceList.jsp";
			}else{
				formwarning("#alerterror", "新增资源失败");
			}
		});
	},
	
	uppResourceFun = function (){
		if(!initFormValidator()){
			return false;
		}
		
		$("body").mask("处理中..");
		SysResourceAction.updateResource({
			    resourceId:$('#resourceId').val(),
				moduleId:$("#parent").val(),
				resourceName:$("#resourceName").val(),
				resourceType:$("input[name='resourceType']:checked").val(),
				resourceDesc:$("#resourceDesc").val(),
				resourcePath:$("#resourcePath").val(),
				priority:$("#priority").val(),
				enabled:$("#enable").is(":checked")
			}, function(data){
				$("body").unmask();
			if(data){
				//跳转到资源列表页面
				window.location.href = webRoot +"page/platform/resource/resourceList.jsp";
			}else{
				formwarning("#alerterror", "修改资源失败");
			}
		});
	}
	
	
	
	//按钮“提交”事件
	$("#submit").click(function(){
		addResourceFun();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		uppResourceFun();
	});
	
	
	//根据resourceId查询资源信息
	var findResourceByResourceId = function(){
		var resourceId = getUrlParam('resourceId');
		if(isNotEmpty(resourceId)){
			SysResourceAction.getResource({resourceId:resourceId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$("#resourceId").val(resourceId);
        			$("#resourceName").val(vo.resourceName);
        			
        			//类型
        			if(vo.resourceType == '1'){
						$("input[name='resourceType']").get(0).checked=true;
					}else if(vo.resourceType == '2'){
						$("input[name='resourceType']").get(1).checked=true;
					}
        			$('#parent').multiselect('select', vo.moduleId);
        			$("#resourceDesc").val(vo.resourceDesc);
        			$("#priority").val(vo.priority);
        			$("#resourcePath").val(vo.resourcePath);
        			//是否可用
        			if(vo.enable == '1'){
						$("input[name='enable']").get(0).checked=true;
					}else{
						$("input[name='enable']").get(1).checked=true;
					}
        		}
        	});
			
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
        }
	}
	
	
	//初始化部门下拉框数据 
	initModelDS();
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//绑定角色数据
		findResourceByResourceId();
	}
});

