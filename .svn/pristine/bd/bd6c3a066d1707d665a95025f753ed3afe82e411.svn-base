/**
 * flexigrid list
 */
$(function() {
	//资源列表数据加载
	$("#resourcelist").flexigrid({
		url : webRoot + '/page/admin/resource/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '资源名称',
			name : 'resourceName',
			width : 110,
			sortable : true,
			align : 'left'
		}, {
			display : '资源类型',
			name : 'resourceType',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == "1"){
					formatterStr = "<span class='truestatue'>URL</span>";
				}else if(row[column] == "2"){
					formatterStr = "<span class='truestatue'>METHOD</span>";
				}
				return formatterStr;
			}
		}, {
			display : '资源描述',
			name : 'resourceDesc',
			width : 100,
			sortable : true,
			align : 'left'
		}, {
			display : '资源路径',
			name : 'resourcePath',
			width : 260,
			sortable : true,
			align : 'left'
		}, {
			display : '优先级',
			name : 'priority',
			width : 40,
			sortable : true,
			align : 'center'
		}, {
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
		}, {
			display : '所属模块',
			name : 'moduleId',
			width : 100,
			sortable : true,
			align : 'left'
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
				var html = "<a id='edituser' rowId='"+row.resourceId 
					 +"' href='resource.jsp?operate=edit&folder=setting&resourceId="+row.resourceId+"' name='edituser'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加资源',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑资源',
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
			display : '资源名称',
			name : 'resourceName'
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
		if (com == '添加资源') {
			window.location.href = webRoot + "/page/platform/resource/resource.jsp?operate=add&folder=resource";
			return;

		}else if (com == '编辑资源') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/resource/resource.jsp?operate=edit&folder=resource&resourceId="
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
				$(".trSelected td:nth-child(2) div", $('#resourcelist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#resourcedelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#resourcebtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除资源
					SysResourceAction.delResource({resourceId:str},function(data){
						$("body").unmask();
						if(data){
							$("#resourcedelModal").modal('hide');
							$('#resourcelist').flexReload();
							forminfo("#alertinfo", "删除资源成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#resourcebtnclose").click(function(){
					$("#resourcedelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
