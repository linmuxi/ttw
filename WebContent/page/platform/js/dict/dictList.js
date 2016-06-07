/**
 * flexigrid list
 */
$(function() {
	//数据字典列表数据加载
	$("#dictlist").flexigrid({
		url : webRoot + '/page/admin/dict/index',
		dataType : 'json',
		cache : false,
		colModel : [ /*{
			display : 'id',
			name : 'id',
			width : 200,
			sortable : true,
			align : 'center'
		},*/{
			display : '数据字典描述',
			name : 'remark',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '默认key',
			name : 'defaultKey',
			width : 200,
			sortable : true,
			align : 'left'
		}, {
			display : '默认value',
			name : 'defaultValue',
			width : 250,
			sortable : true,
			align : 'left'
		}, {
			display : '排序',
			name : 'sort',
			width : 100,
			sortable : true,
			align : 'left'
		},{
			display : '操作',
			name : 'operating',
			width : 230,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//var html = "<a id='formRole' href='"+webRoot+"page/admin/user/getUserRoleInfo?userId="+row.userId+"&account="+row.account+"' name='formRole'>[授权]</a>";
				
				var html = "<a id='edituser' href='"+webRoot +"/page/platform/initEditDict?operate=edit&id="+row.id+"'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加数据字典',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑数据字典',
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
			display : '数据字典类型',
			name : 'type'
		} ],
		sortname : "t.sort",	//排序字段  必须是数据库的字段名
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
		if (com == '添加数据字典') {
			window.location.href = webRoot + "/page/platform/initAddDict?operate=add";
			return;

		}else if (com == '编辑数据字典') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/initEditDict?operate=edit&id="+str;
				return;
			} else {
				formwarning("#alerterror", "请选择一条信息");
				return false;
			}
		}else if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#dictlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#dictModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#dictbtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						str += this.id.substr(3) + ",";
					});
					//dwr批量删除数据字典
					SysDictAction.delDict({id:str},function(data){
						$("body").unmask();
						if(data){
							$("#dictModal").modal('hide');
							$('#dictlist').flexReload();
							forminfo("#alertinfo", "删除数据字典成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#dictbtnclose").click(function(){
					$("#dictModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
