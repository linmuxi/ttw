/**
 * flexigrid list
 */
$(function() {
	//待办任务列表数据加载
	$("#tasklist").flexigrid({
		url : webRoot + '/page/admin/activiti/getTaskList',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '任务名称',
			name : 'name',
			width : 300,
			sortable : true,
			align : 'center'
		}, {
			display : '流程名称',
			name : 'processDefinitionName',
			width : 100,
			sortable : true,
			align : 'left'
		}, {
			display : '优先级',
			name : 'priority',
			width : 50,
			sortable : true,
			align : 'left'
		}, {
			display : '创建时间',
			name : 'createTime',
			width : 150,
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
			width : 100,
			sortable : false,
			align : 'left'
		},  {
			display : '操作',
			name : 'operating',
			width : 200,
			sortable : false,
			align : 'center',
			formatter : function(column, row){
				//查看审批流程
				var taskSrc = webRoot+"/page/admin/activiti/reviewNowProcess?taskId="+row.id;
				var taskTitle = encodeURIComponent(encodeURIComponent("流程预览"));
				var viewLinkUrl = webRoot + "/page/platform/activiti/reviewProcessDefinition.jsp?pdTitle="+taskTitle+"&pdSrc="+taskSrc;
				
				//审批
				var src = webRoot+row.formKey+"?id="+row.businessId+"&taskId="+row.id;
				var approvalLinkUrl = webRoot+"/page/platform/activiti/approvalForm.jsp?src="+src;
				
				var html = "<a id='formRole' href='"+viewLinkUrl+"' name='formRole' target='_blank'>[查看审批流程]</a>";
				html += "&nbsp;&nbsp;";
				html += "<a id='edituser' rowId='"+row.processInstanceId 
					 +"' href='"+approvalLinkUrl+"' name='edituser' target='_blank'>[审批]</a>";
				return html;
			}
		} ],
		
		buttons : [ {
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
			display : '任务名称',
			name : 'name'
		}, {
			display : '流程名称',
			name : 'processDefinitionName'
		} ],
		sortname : "CREATE_TIME_",	//排序字段  必须是数据库的字段名
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
		if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#flextasklist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在taskList.jsp中编写
				$("#contentp").text(str);
				$("#taskdelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#taskbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					//dwr批量删除角色
					/**/
					ActivitiAction.delTask({id:str},function(data){
						if(data){
							$("#taskdelModal").modal('hide');
							$('#tasklist').flexReload();
							forminfo("#alertinfo", "删除待办任务成功");
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
