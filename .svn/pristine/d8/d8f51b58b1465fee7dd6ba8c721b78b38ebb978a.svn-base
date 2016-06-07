/**
 * flexigrid list
 */
$(function() {
	//流程定义列表数据加载
	$("#processdefinitionlist").flexigrid({
		url : webRoot + '/page/admin/activiti/getProcessDefinitionList',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '流程名称',
			name : 'name',
			width : 100,
			sortable : true,
			align : 'left'
		}, {
			display : 'key',
			name : 'key',
			width : 110,
			sortable : true,
			align : 'left'
		}, {
			display : '版本',
			name : 'version',
			width : 110,
			sortable : true,
			align : 'left'
		}, {
			display : '类别',
			name : 'category',
			width : 260,
			sortable : true,
			align : 'left'
		}, {
			display : '部署名称',
			name : 'deploymentName',
			width : 100,
			sortable : true,
			align : 'left'
		}, {
			display : '部署时间',
			name : 'deploymentTime',
			width : 160,
			sortable : true,
			align : 'left',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy年MM月dd日hh小时mm分");
        		return lastUpdateStr;
			}
		}, {
			display : '描述',
			name : 'description',
			width : 200,
			sortable : true,
			align : 'left'
		}, {
			display : '操作',
			name : 'operating',
			width : 100,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='edituser' rowId='"+row.deploymentId 
					 +"' href='"+webRoot+"/page/admin/activiti/reviewProcessDefinition?operate=edit&folder=setting&processDefinitionId="+row.id+"' name='edituser' target='_blank'>[预览流程]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加流程',
			bclass : 'add',
			onpress : action
		}, {
			name : '删除',
			bclass : 'del',
			onpress : action
		}, {
			separator : true
		} ],
		/*
		searchitems : [ {
			display : '请选择搜索条件',
			name : 'searchPhrase',
			isdefault : true
		}, {
			display : '流程定义名称',
			name : 'processdefinitionName'
		} ],
		*/
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
		if (com == '添加流程') {
			window.location.href = webRoot + "/page/platform/activiti/processDefinitionForm.jsp?operate=add&folder=processdefinition";
			return;

		}else if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#processdefinitionlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#processdefinitiondelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#processdefinitionbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowId') + ",";
					});

					$("body").mask("处理中...");
					//dwr批量删除流程定义
					ActivitiAction.dropTask({id:str},function(data){
						if(data){
							$("#processdefinitiondelModal").modal('hide');
							$('#processdefinitionlist').flexReload();
							forminfo("#alertinfo", "删除流程定义成功");
						}
						$("body").unmask();
					});
				});
				
				//关闭“删除提示框”
				$("#processdefinitionbtnclose").click(function(){
					$("#processdefinitiondelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
