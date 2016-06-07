;(function($){
	function initEvent(){
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#fpForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	formName: {
                    validators: {
                        notEmpty: {
                            message: '业务表单名称不能为空'
                        },
                        remote: {
                            type: 'POST',
                            url: webRoot+'/page/admin/activiti/getFormNameExists',
                            message: '该业务表单名称已经配置流程',
                            data:{id:id}
                        }
                    }
                }
            }
        }).on('success.form.fv', function(e) {
        	submitForm();
        });
	}

	function initProcessDefinitionDS(){
		 $('#prodefId').multiselect('dataprovider', getProcessDefinitionDS());
	}
	
	function getProcessDefinitionDS(){ 
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/activiti/getProcessDefinitionList",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.name,value:obj.id});
				});
			}
		});
	    return ds;
	 }
	
	//提交表单
	function submitForm(){
		var arr = $("#fpForm").serializeObject();
		dwr.engine.setAsync(false);
		FormProcessAction.formProcess(arr,function(data){
			if(data && data.result){
				alert("操作成功"); 
				parent.getTargetObject().formProcessHandler();
			}else{
				alert("操作失败,"+data.remark);
			}
		});
	}
	
	function preUpdateFormProcess(){
		if(isNotEmpty(id)){
			FormProcessAction.getFormProcess({id:id},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			//$('#prodefId').multiselect('select', vo.prodefId);
        			$("#fpForm").fillFormData(vo);
        		}
        	});
        }
	}
	
    $(function(){
    	initFormValidator.call(this);
        initEvent.call(this);
        initProcessDefinitionDS.call(this);
        preUpdateFormProcess();
    });
    
})(jQuery);