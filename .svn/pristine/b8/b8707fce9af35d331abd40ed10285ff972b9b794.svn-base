/**
 * flexigrid list
 */
$(function() {
	//权限列表数据加载
	$("#authoritylist").flexigrid({
		url : webRoot + '/page/admin/authority/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '权限标识',
			name : 'authorityMark',
			width : 130,
			sortable : true,
			align : 'left'
		}, {
			display : '权限名称',
			name : 'authorityName',
			width : 200,
			sortable : true,
			align : 'left'
		},{
			display : '权限说明',
			name : 'authorityDesc',
			width : 150,
			sortable : true,
			align : 'left'
		},{
			display : '提示信息',
			name : 'message',
			width : 200,
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
			display : '最后修改时间',
			name : 'lastUpdateDate',
			width : 160,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy年MM月dd日hh小时mm分");
        		return lastUpdateStr;
			}
		}, {
			display : '操作',
			name : 'operating',
			width : 130,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='edituser' rowId='"+row.authorityId
					 +"' href='"+webRoot+"page/admin/authority/getAuthorityResourceInfo?authorityId="+row.authorityId+"&authorityName="+row.authorityName+"' name='edituser'>[赋资源]</a>"+
					 "   <a id='edituser' rowId='"+row.authorityId 
					 +"' href='authority.jsp?operate=edit&folder=setting&authorityId="+row.authorityId+"' name='edituser'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加权限',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑权限',
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
			display : '权限名称',
			name : 'authorityName'
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
		if (com == '添加权限') {
			window.location.href = webRoot + "/page/platform/authority/authority.jsp?operate=add&folder=authority";
			return;

		}else if (com == '编辑权限') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/authority/authority.jsp?operate=edit&folder=authority&authorityId="
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
				$(".trSelected td:nth-child(2) div", $('#authoritylist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#authoritydelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#authoritybtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除权限
					SysAuthorityAction.delAuthority({authorityId:str},function(data){
						if(data){
							$("#authoritydelModal").modal('hide');
							$('#authoritylist').flexReload();
							forminfo("#alertinfo", "删除权限成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#authoritybtnclose").click(function(){
					$("#authoritydelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
