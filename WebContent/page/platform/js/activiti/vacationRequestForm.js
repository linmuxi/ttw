;(function($){
	function initEvent(){
		//提交表单
		$("#vqFormBtn").click(function(){
			$('#vqForm').submit();
		});
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#vqForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	days: {
                    validators: {
                        notEmpty: {
                            message: '天数不能为空'
                        },
                        regexp: {
                            regexp: /^[0-9_\.]+$/,
                            message: '只能是数字'
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
		var arr = $("#vqForm").serializeObject();
		VacationRequestAction.addVacationRequest($.extend(arr,{actFormService:"",actFormPage:""}),function(data){
			if(data && data.result){
				bootbox.alert("操作成功");
				parent.getTargetObject().formVRHandler();
			}else{
				bootbox.alert("操作失败,"+data.remark);
			}
		});
	}
	
    $(function(){
    	initFormValidator.call(this);
        initEvent.call(this);
    });
})(jQuery);