;(function($){
	function initEvent(){
		var $bussniessIframe = $("#bussniessIframe");
		$bussniessIframe.load(function(){
			//自适应iframe高度
			$bussniessIframe.attr("height",$bussniessIframe[0].contentDocument.documentElement.offsetHeight+"px");
		});

		//提交表单
		$("#approvalFormBtn").click(function(){
			$('#approvalForm').submit();
		});
	}
	
	//初始化表单验证器
	function initFormValidator(){
		$('#approvalForm').formValidation({
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	approved: {
                    validators: {
                        notEmpty: {
                            message: '请选择是否同意'
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
		//任务id、审批信息、业务表单信息
		var param = $.extend({id:taskId},{vars:$.extend($("#approvalForm").serializeObject(),
				document.getElementById('bussniessIframe').contentWindow.getFormData())});
		ActivitiAction.completeTask(param,function(data){
			if(data){
				//bootbox.alert("审批成功");
				parent.getTargetObject().taskHandler();
				//taskModalStatus("hide");
			}else{
				//bootbox.alert("审批失败");
			}
		});
	}
	
    $(function(){
    	initFormValidator.call(this);
        initEvent.call(this);
    });
})(jQuery);