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
	
	var handAuth = function(data){
		if(!data){return;}
		var auths = data.auths;
		if(data.other.type == 3){
			//模块
			$("body").mask("处理中..");
			var modules = [];
			for(var i = 0;i<auths.length;i++){
				modules.push({moduleId:auths[i].id});
			}
			var data = {roleId:data.other.objId,modules:modules};
			SysRoleAction.addRoleModule(data,function(data){
				$("body").unmask();
				if(data && data.result){
					formwarning("#alertinfo", "保存成功");
				}else{
					formwarning("#alerterror", "保存失败");
				}
			});
		}else if(data.other.type == 2){
			//权限
			$("body").mask("处理中..");
			var sysAuths = [];
			for(var i = 0;i<auths.length;i++){
				sysAuths.push({authorityId:auths[i].id});
			}
			var data = {roleId:data.other.objId,auths:sysAuths};
			SysRoleAction.addRoleAuth(data,function(data){
				$("body").unmask();
				if(data && data.result){
					formwarning("#alertinfo", "保存成功");
				}else{
					formwarning("#alerterror", "保存失败");
				}
			});
		}else if(data.other.type == 1){
			//回调处理-保存权限数据
			$("body").mask("处理中..");
			var roles = [];
			for(var i = 0; i < auths.length; i++){
				roles.push({roleId:auths[i].id});
			}
			var data = {userId:data.other.objId,roles:roles};
			SysUserAction.addUserRole(data,function(data){
				$("body").unmask();
				if(data && data.result){
					formwarning("#alertinfo", "保存成功");
				}else{
					formwarning("#alerterror", "保存失败");
				}
			});
		}else if(data.other.type == 4){
			//权限-资源
			$("body").mask("处理中..");
			var authoritys = [];
			for(var i = 0;i<auths.length;i++){
				authoritys.push({resourceId:auths[i].id});
			}
			SysAuthorityAction.addAuthorityAuth({authorityId:data.other.objId,resources:authoritys},function(data){
				if(data && data.result){
					$("body").unmask();
					formwarning("#alertinfo", "保存成功");
				}else{
					formwarning("#alerterror", "保存失败");
				}
			});
		}
	};
	
	$("#authorization").bind("click",function(){
		var auths = [];
		$("#selfAuth option").each(function(i,obj){
			auths.push({id:obj.value});
		});
		handAuth({other:other,auths:auths});
	});
	
})(jQuery);