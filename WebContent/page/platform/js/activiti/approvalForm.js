;(function($){
	function initEvent(){
		var $bussniessIframe = $("#bussniessIframe");
		$bussniessIframe.load(function(){
			//自适应iframe高度
			$bussniessIframe.attr("height",$bussniessIframe[0].contentDocument.documentElement.offsetHeight+"px");
		});

		//提交表单
		$("#submit").click(function(){
			
			if($('#opinion').val() == ""){
				formwarning("#alerterror", "请输入意见");
				return false;
			}
			
			$("body").mask("正在提交中....请稍后....");
			
			try{
				//审核提交时修改业务数据
				document.getElementById("bussniessIframe").contentWindow.saveData();
			}catch(e){}
			//提交
			submitForm();
		});
	}
	

	//提交表单
	function submitForm(){
		var opinionVal = $('#opinion').val();
		var approvedVal = $("#approved").is(":checked") ? 1 : 0;
		//任务id、审批信息、业务表单信息
		var param = {id:taskId,vars:{opinion:opinionVal,approved:approvedVal}};
		var _maskBody = $("#approvalForm");
		_maskBody.mask("处理中...");
		ActivitiAction.completeTask(param,function(data){
			if(data){
				//bootbox.alert("审批成功");
				//parent.getTargetObject().taskHandler();
				//taskModalStatus("hide");
				
				//跳转到代办任务列表页面
				window.location.href = webRoot +"page/platform/activiti/taskList.jsp";
			}else{
				//bootbox.alert("审批失败");
			}
			_maskBody.unmask();
		});
		
	}
	
    $(function(){
        initEvent.call(this);
    });
})(jQuery);