/**
 * flexigrid list
 */
$(function() {
	//角色列表数据加载
	$("#departmentlist").flexigrid({
		url : webRoot + '/page/admin/department/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '部门名称',
			name : 'orgName',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '上级部门',
			name : 'parentId',
			width : 200,
			sortable : true,
			align : 'left'
		}, {
			display : '备注',
			name : 'orgRemark',
			width : 200,
			sortable : true,
			align : 'left'
		}, {
			display : '可用',
			name : 'isDel',
			width : 140,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == '0'){
					formatterStr = "<span class='truestatue icon-ok'></span>";
				}else{
					formatterStr = "<span class='truestatue icon-remove'></span>";
				}
				return formatterStr;
			}
		}, {
			display : '操作',
			name : 'operating',
			width : 230,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='edituser' rowId='"+row.departmentId 
					 +"' href='department.jsp?operate=edit&folder=setting&departmentId="+row.departmentId+"' name='edituser'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加部门',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑部门',
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
			display : '部门名称',
			name : 'departmentName'
		} ],
		sortname : "t1.CREATE_DATE",	//排序字段  必须是数据库的字段名
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
		if (com == '添加部门') {
			window.location.href = webRoot + "/page/platform/department/department.jsp?operate=add&folder=department";
			return;

		}else if (com == '编辑部门') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/department/department.jsp?operate=edit&folder=department&departmentId="
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
				$(".trSelected td:nth-child(2) div", $('#departmentlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#departmentdelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#departmentbtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除品牌
					SysDepartmentAction.delDepartment({departmentId:str},function(data){
						$("body").unmask();
						if(data){
							$("#departmentdelModal").modal('hide');
							$('#departmentlist').flexReload();
							forminfo("#alertinfo", "删除部门成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#departmentbtnclose").click(function(){
					$("#departmentdelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
