/**
 * flexigrid list
 */
$(function() {
	//角色列表数据加载
	$("#rolelist").flexigrid({
		url : webRoot + '/page/admin/role/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '角色名称',
			name : 'roleName',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '角色描述',
			name : 'roleDesc',
			width : 600,
			sortable : true,
			align : 'left'
		}, {
			display : '可用',
			name : 'enable',
			width : 40,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column]){
					formatterStr = "<span class='truestatue icon-ok'></span>";
				}else{
					formatterStr = "<span class='truestatue icon-remove'></span>";
				}
				return formatterStr;
			}
		}, {
			display : '操作',
			name : 'operating',
			width : 130,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='formRole' href='"+webRoot+"page/admin/role/getRoleModuleInfo?roleId="+row.roleId+"&roleName="+encodeURIComponent(encodeURIComponent(row.roleName))+"' name='formRole'>[赋模块]</a>";
				html += "&nbsp;&nbsp;";
				html += "<a id='edituser' rowId='"+row.roleId 
					 +"' href='"+webRoot+"page/admin/role/getRoleAuthInfo?roleId="+row.roleId+"&roleName="+encodeURIComponent(encodeURIComponent(row.roleName))+"' name='edituser'>[授权]</a>";
				html += "&nbsp;&nbsp;";
				html += "<a id='edituser' rowId='"+row.roleId 
					 +"' href='role.jsp?operate=edit&folder=setting&roleId="+row.roleId+"' name='edituser'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加角色',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑角色',
			bclass : 'edit',
			onpress : action
		}, {
			name : '删除',
			bclass : 'del',
			onpress : action
		}, {
			separator : true
		} ],

		searchitems : [ {
			display : '请选择搜索条件',
			name : 'searchPhrase',
			isdefault : true
		}, {
			display : '角色名称',
			name : 'roleName'
		} ],
		sortname : "CREATE_DATE",	//排序字段  必须是数据库的字段名
		sortorder : "desc",
		usepager : true,
		title : '',
		useRp : true,
		rp :20,
		rpOptions : [ 5, 20, 40, 100 ],
		showTableToggleBtn : true,
		showToggleBtn : true,
		width : 'auto',
		height : 'auto',
		pagestat : '显示{from}到{to}条，共{total}条记录',
		procmsg : '正在获取数据，请稍候...',
		checkbox : true
	});
	function action(com, grid) {
		if (com == '添加角色') {
			window.location.href = webRoot + "/page/platform/role/role.jsp?operate=add&folder=role";
			return;

		}else if (com == '编辑角色') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/role/role.jsp?operate=edit&folder=role&roleId="
						+ str;
				return;
			} else {
				formwarning("#alerterror", "请选择一条信息");
				return false;
			}
		}else if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#rolelist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#roledelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#rolebtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除角色
					SysRoleAction.delRole({roleId:str},function(data){
						$("body").unmask();
						if(data){
							$("#roledelModal").modal('hide');
							$('#rolelist').flexReload();
							forminfo("#alertinfo", "删除角色成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#rolebtnclose").click(function(){
					$("#roledelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
