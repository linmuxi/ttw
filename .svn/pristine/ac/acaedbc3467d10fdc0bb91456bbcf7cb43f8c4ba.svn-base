/**
 * flexigrid list
 */
$(function() {
	//模块列表数据加载
	$("#modulelist").flexigrid({
		url : webRoot + '/page/admin/module/index',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '模块名称',
			name : 'moduleName',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '模块说明',
			name : 'moduleDesc',
			width : 200,
			sortable : true,
			align : 'left'
		}, {
			display : '模块地址',
			name : 'moduleUrl',
			width : 300,
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
		}, {
			display : '操作',
			name : 'operating',
			width : 130,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "<a id='edituser' rowId='"+row.moduleId 
					 +"' href='module.jsp?operate=edit&folder=setting&moduleId="+row.moduleId+"' name='edituser'>[编辑]</a>";
				return html;
			}
		} ],
		buttons : [ {
			name : '添加模块',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑模块',
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
			display : '模块名称',
			name : 'moduleName'
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
		if (com == '添加模块') {
			window.location.href = webRoot + "/page/platform/module/module.jsp?operate=add&folder=module&parent="+selectTreeNode;
			return;

		}else if (com == '编辑模块') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				//获取列表中选中的行
				$('.trSelected', grid).find('#edituser').each(function() {
					str += $(this).attr('rowid');
				});
				window.location.href = webRoot + "/page/platform/module/module.jsp?operate=edit&folder=module&moduleId="
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
				$(".trSelected td:nth-child(2) div", $('#modulelist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#moduledelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#modulebtnok").click(function(){
					$("body").mask("处理中..");
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).find('#edituser').each(function() {
						str += $(this).attr('rowid') + ",";
					});
					
					//dwr批量删除模块
					SysModuleAction.delModule({moduleId:str},function(data){
						$("body").unmask();
						if(data){
							$("#moduledelModal").modal('hide');
							$('#modulelist').flexReload();
							forminfo("#alertinfo", "删除模块成功");
						}
					});
				});
				
				//关闭“删除提示框”
				$("#modulebtnclose").click(function(){
					$("#moduledelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
	
	
	
	//初始化管理模块树			
	var initZtree = function(){
		loadManageModuleTreeData();
	}
	
	var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey:"moduleId",
				pIdKey:"parent", 
				rootPId:"-1"
			},
			key:{
				name:"moduleName"
			}
		},
		callback:{
			onClick:manageModuleTreeClick
		}
	};
	
	var selectTreeNode = "";
	
	//加载树数据
	function loadManageModuleTreeData(){
		SysModuleAction.getModuleTree({parent:-1,moduleType:1},function(data){
			var treeData = [{moduleId:-1,parent:-100,moduleName:"根节点",open:true}];
			if(data&&data.moduleTree){
				treeData = treeData.concat(data.moduleTree);
			}
			$.fn.zTree.init($("#manageModuleTree"), setting, treeData);
			selectNode(getManageModuleTree().getNodeByParam("id", -1, null));
		});
	}
	
	//选中指定节点
	function selectNode(node){
		getManageModuleTree().selectNode(node);
	}
	
	//获取管理模块树对象
	function getManageModuleTree(){
		return $.fn.zTree.getZTreeObj("manageModuleTree");
	}
	
	//点击管理模块树事件
	function manageModuleTreeClick(event, treeId, treeNode){
		selectTreeNode = treeNode.moduleId;
		var url = webRoot + '/page/admin/module/index?parent=' + treeNode.moduleId;
		$('#modulelist').flexReload({url:url});
	}
	
	
	initZtree();
});
