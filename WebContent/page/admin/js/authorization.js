;(function($){
	var _noSelfAuth = $("#noSelfAuth");
	var _selfAuth = $("#selfAuth");
	
	_noSelfAuth.bind("dblclick",function(){
		var all_seloption = this.options[this.selectedIndex];
		$(all_seloption).remove();
		_selfAuth.append("<option value='"+all_seloption.value+"'>"+all_seloption.text+"</option>");
	});
	
	_selfAuth.bind("dblclick",function(){
		var all_seloption = this.options[this.selectedIndex];
		$(all_seloption).remove();
		_noSelfAuth.append("<option value='"+all_seloption.value+"'>"+all_seloption.text+"</option>");			
	});
	
	$("#authorization").bind("click",function(){
		var auths = [];
		$("#selfAuth option").each(function(i,obj){
			auths.push({id:obj.value});
		});
		parent.getTargetObject().handAuth({other:other,auths:auths});
	});
	
})(jQuery);