;(function($){
	function initEvent(){
		//提交表单
		$("#moduleFormBtn").click(function(){
			$('#moduleForm').submit();
		});
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#moduleForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	moduleName: {
                    validators: {
                        notEmpty: {
                            message: '模块名称必须填写，不能为空'
                        }
                    }
                },
                priority: {
                    validators: {
                        notEmpty: {
                            message: '优先级必须填写，不能为空'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '只能是正整数'
                        },
                        stringLength: {
                            min: 1,
                            max: 3,
                            message: '长度必须大于1小于3'
                        }
                    }
                }
            }
        }).on('success.form.fv', function(e) {
            submitForm();
        });
	}

	//提交表单
	function submitForm(){
		$("body").mask("处理中..");
		var arr = $("#moduleForm").serializeObject();
		arr.enable = (arr.enable == 'on')?1:0;
		//目前只支持二级菜单，默认一级是管理模块
		arr.parent = (arr.moduleType == 1?"-1":arr.parent);
		SysModuleAction.formModule(arr,function(data){
			$("body").unmask();
			if(data && data.result){
				lhgdialog.tips('操作成功');
				parent.getTargetObject().formHandler();
			}else{
				lhgdialog.tips('操作失败'+data.remark);
			}
		});
	}
	
	//初始化部门下拉框数据 
	function initModuleDS(){
		 $('#parent').multiselect('dataprovider', getModuleDS());
	}
	
	function getModuleDS(){ 
		var ds = [];
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
	 }
	
    $(function(){
    	initFormValidator.call(this);
        initEvent.call(this);
        initModuleDS.call(this);
        if(isNotEmpty(moduleId)){
        	SysModuleAction.getModule({moduleId:moduleId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$('#parent').multiselect('select', vo.moduleId);
        			$("#moduleName").val(vo.moduleName);
        			$("input[name='moduleType']:eq("+(vo.moduleType-1)+")").attr("checked","checked");
        			$("#moduleUrl").val(vo.moduleUrl);
        			$("#priority").val(vo.priority);
        			$("#moduleDesc").val(vo.moduleDesc);
        			$("#enabled").attr("checked",vo.enabled);
        		}
        	});
        }
    });
})(jQuery);