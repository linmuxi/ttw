/**
 * flexigrid list
 */
$(function() {
	var selectTreeNode = "";
	
	//选中指定节点
	selectNode = function (node){
		getDepartMentTree().selectNode(node);
	},
	
	//获取部门树对象
	getDepartMentTree = function (){
		return $.fn.zTree.getZTreeObj("departMentTree");
	},
	
	//点击部门树事件
	departTreeClick = function (event, treeId, treeNode){
		selectTreeNode = treeNode.id;
		
		var url = webRoot + '/page/admin/user/index?orgId=' + treeNode.id;
		$('#userlist').flexReload({url:url});
	},
	
	//初始化部门树			
	initZtree = function(){
		var setting = {
			data: {
				simpleData: {
					enable: true,
					idKey:"id",
					pIdKey:"parent_org", 
					rootPId:"-1"
				},
				key:{
					name:"name"
				}
			},
			callback:{
				onClick:departTreeClick
			}
		};
		SysDepartmentAction.getChildDepartMentByParent({parentId:-1},function(data){
			if(data&&data.result){
				$.fn.zTree.init($("#departMentTree"), setting, data.result);
				selectNode(getDepartMentTree().getNodeByParam("id", 1, null));
			}
		});
	}
	
	//用户列表数据加载
	$("#userlist").flexigrid({
		url : webRoot + '/page/admin/user/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '真实名称',
			name : 'username',
			width : 110,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				return row[column];
			}
		}, {
			display : '登录帐号',
			name : 'account',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '最后登录IP',
			name : 'lastLoginIp',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '最后登录日期',
			name : 'lastLoginDate',
			width : 80,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy/MM/dd");
        		return lastUpdateStr;
			}
		}, {
			display : '所属部门名称',
			name : 'orgName',
			width : 100,
			sortable : true,
			align : 'center'
		},{
			display : '可用',
			name : 'enabled',
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
		},{
			display : '未过期',
			name : 'accountNonExpired',
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
		},{
			display : '未锁定',
			name : 'accountNonLocked',
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
		},{
			display : '未失效',
			name : 'credentialsNonExpired',
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
		},{
			display : '创建日期',
			name : 'createDate',
			width : 80,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy/MM/dd");
        		return lastUpdateStr;
			}
		},{
			display : '注销日期',
			name : 'logoutDate',
			width : 80,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy/MM/dd");
        		return lastUpdateStr;
			}
		}, {
			display : '操作',
			name : 'operating',
			width : 140,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='formRole' href='"+webRoot+"page/admin/user/getUserRoleInfo?userId="+row.userId+"&account="+row.account+"' name='formRole'>[授权]</a>";
				html += "&nbsp;&nbsp;";
				html += "<a id='edituser' rowId='"+row.userId 
					 +"' href='user.jsp?operate=edit&folder=setting&userId="+row.userId+"' name='edituser'>[编辑]</a>";
				html += "&nbsp;&nbsp;";
				html += "<a id='resetpwd' href='#' onclick='resetUserPwd(\""+row.userId+"\");return false;'>[重置密码]</a>";
				
				return html;
			}
		} ],
		buttons : [ {
			name : '添加用户',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑用户',
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
			display : '用户名称',
			name : 'username'
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
		if (com == '添加用户') {
			window.location.href = webRoot + "/page/platform/user/user.jsp?operate=add&folder=user&orgId="+selectTreeNode;
			return;

		}else if (com == '编辑用户') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/user/user.jsp?operate=edit&folder=user&userId="
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
				$(".trSelected td:nth-child(2) div", $('#userlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#userdelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#userbtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除品牌
					SysUserAction.delUser({userId:str},function(data){
						$("body").unmask();
						if(data){
							$("#userdelModal").modal('hide');
							$('#userlist').flexReload();
							forminfo("#alertinfo", "删除用户成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#userbtnclose").click(function(){
					$("#userdelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
	
	
	initZtree();
});
