$(function() {

	getModuleDS = function(){ 
		var ds = [{label:'根节点',value:'-1',level:1}];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/module/index",{pageNo:1,pageSize:65535,moduleType:1},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.moduleName,value:obj.moduleId,level:obj.level});
				});
			}
		});
		return ds;
	},
	
	//初始化部门下拉框数据 
	initModuleDS = function (){
		$('#parent').multiselect('dataprovider', getModuleDS());
		
		var parent = getUrlParam('parent');
		if(parent){
			$('#parent').multiselect('select', parent);
		}
	},
	
	
	initFormValidator = function (){
		//模块名称必须填写，不能为空
		var moduleName = $("#moduleName").val();
		if(moduleName == ""){
			formwarning("#alerterror", "模块名称必须填写，不能为空");
			return false;
		}
		
		//优先级必须填写，不能为空
		var priority = $("#priority").val();
		if(priority == ""){
			formwarning("#alerterror", "优先级必须填写，不能为空");
			return false;
		}
		
		//只能是正整数
		var priorityRegexp = /^[0-9]+$/;
		if(!priorityRegexp.test(priority)){    
            formwarning("#alerterror", "优先级只能是正整数");
			return false;  
        }
		
		//长度必须大于1小于3
		if(priority.length > 3){
			formwarning("#alerterror", "长度必须大于1小于3");
			return false;
		}
		
		return true;
	},
	
	submitFormFun = function (){
		//表单验证
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		SysModuleAction.formModule({
				moduleId:$('#moduleId').val(),
				parent:$('#parent').val(),
				moduleName:$('#moduleName').val(),
				moduleType:$("input[name='moduleType']:checked").val(),
				moduleUrl:$('#moduleUrl').val(),
				priority:$('#priority').val(),
				moduleDesc:$('#moduleDesc').val(),
				enable:$("#enable").is(":checked") ? 1 : 0
			},function(data){
				$("body").unmask();
			if(data && data.result){
				//跳转到用户列表页面
				window.location.href = webRoot +"page/platform/module/moduleList.jsp";
			}else{
				formwarning("#alerterror", "操作失败");
			}
		});
	
	}
	
	
	//按钮“提交”事件
	$("#submit").click(function(){
		submitFormFun();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		submitFormFun();
	});
	
	
	//根据moduleId查询模块信息
	var findModuleByModuleId = function(){
		var moduleId = getUrlParam('moduleId');
		if(isNotEmpty(moduleId)){
			
			SysModuleAction.getModule({moduleId:moduleId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$('#parent').multiselect('select', vo.parent);
        			$("#moduleName").val(vo.moduleName);
        			//是否可用
        			if(vo.moduleType == '1'){
						$("input[name='moduleType']").get(0).checked=true;
					}else if(vo.moduleType == '2'){
						$("input[name='moduleType']").get(1).checked=true;
					}
        			$("#moduleUrl").val(vo.moduleUrl);
        			$("#priority").val(vo.priority);
        			$("#moduleDesc").val(vo.moduleDesc);
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
	
	initModuleDS();
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//绑定模块数据
		findModuleByModuleId();
	}
});

