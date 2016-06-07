;(function($){
	
	//初始化表单验证器
	function initFormValidator(){
		$('#pdForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	processFile: {
                    validators: {
                        notEmpty: {
                            message: '流程文件不能为空'
                        },
                        regexp: {
                            regexp: /\.*\.bpmn$/,
                            message: '文件格式只能是bpmn'
                        }
                    }
                }
            }
        });
	}
	
    $(function(){
    	initFormValidator.call(this);
    });
})(jQuery);