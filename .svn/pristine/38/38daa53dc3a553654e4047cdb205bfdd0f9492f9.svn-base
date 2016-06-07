$(function() {

	initFormValidator = function (){
		//业务表单名称不能为空
		var formName = $("#formName").val();
		if(formName == ""){
			formwarning("#alerterror", "业务表单名称不能为空");
			return false;
		}
		
		return true;
	},
	
	initProcessDefinitionDS = function (){
		 $('#prodefId').multiselect('dataprovider', getProcessDefinitionDS());
	},
	
	getProcessDefinitionDS = function (){
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/activiti/getProcessDefinitionList",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.name+":"+obj.version,value:obj.id});
				});
			}
		});
	    return ds;
	},
	
	//提交表单
	submitForm = function (){
		var arr = $("#formprocessForm").serializeObject();
		dwr.engine.setAsync(false);
		FormProcessAction.formProcess(arr,function(data){
			if(data && data.result){
				forminfo("#alertinfo", "操作成功");
			}else{
				formwarning("#alerterror", "操作失败");
			}
		});
	},
	
	preUpdateFormProcess = function (){
		var id = $('#id').val();
		if(isNotEmpty(id)){
			FormProcessAction.getFormProcess({id:id},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$('#prodefId').multiselect('select', vo.prodefId);
        			$("#formprocessForm").fillFormData(vo);
        		}
        	});
        }
	}
	
	//
	initProcessDefinitionDS();
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//加载编辑数据
		preUpdateFormProcess();
	}
	
	//按钮“提交”事件
	$("#fpFormBtn").click(function(){
		if(initFormValidator()){
			submitForm();
		}
	});
});

