/**
 * flexigrid list
 */
$(function() {
	//角色列表数据加载
	$("#formprocesslist").flexigrid({
		url : webRoot + '/page/admin/activiti/queryFormProcessList',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '业务表单名称',
			name : 'formName',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '流程定义名称',
			name : 'prodefName',
			width : 600,
			sortable : true,
			align : 'left',
			formatter:function(column,row){
				return row.prodefName+":"+row.version;
			}
		}, {
			display : '操作',
			name : 'operating',
			width : 130,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='formRole'  rowId='"+row.id +"' href='"+webRoot+"page/platform/activiti/formProcessForm.jsp?id="+row.id+"&operate=edit' name='formProcess'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加表单流程配置',
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
			display : '角色名称',
			name : 'roleName'
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
		if (com == '添加表单流程配置') {
			window.location.href = webRoot + "/page/platform/activiti/formProcessForm.jsp?operate=add&folder=formProcessForm";
			return;

		}else if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#formprocesslist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#formprocessdelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#formprocessbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除
					FormProcessAction.deleteFormProcess({id:str},function(data){
						if(data && data.result){
							forminfo("#alertinfo", "删除成功");
							$("#formprocesslist").bootgrid("reload");
						}else{
							forminfo("#alerterror", "删除失败");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#formprocessbtnclose").click(function(){
					$("#formprocessdelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
