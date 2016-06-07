$(function(){
	initFormValidator = function (){
		//流程文件不能为空
		var processFile = $("#processFile").val();
		if(processFile == ""){
			formwarning("#alerterror", "流程文件不能为空");
			return false;
		}
		return true;
	}
	
	//按钮“提交”事件
	$("#pdFormBtn").click(function(){
		$("body").mask("处理中...");
		if(initFormValidator()){
			$('#pdForm').submit();
		}
	});
})