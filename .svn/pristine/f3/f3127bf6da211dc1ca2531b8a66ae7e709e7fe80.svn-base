/**
 * flexigrid list
 */
$(function() {
	//品牌列表数据加载
	$("#brandlist").flexigrid({
		url : webRoot + 'page/business/brand',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '品牌名称',
			name : 'brandName',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '官网地址',
			name : 'url',
			width : 250,
			sortable : true,
			align : 'center'
		}, {
			display : '排序',
			name : 'sort',
			width : 50,
			sortable : true,
			align : 'center'
		}, {
			display : '是否可用',
			name : 'enabled',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == "1"){
					formatterStr = "<span class='truestatue icon-ok'></span>";
				}else{
					formatterStr = "<span class='truestatue icon-remove'></span>";
				}
				return formatterStr;
			}
		}, {
			display : '最后修改时间',
			name : 'updateTime',
			width : 180,
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
			width : 150,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				return "<a id='editgoods' href='brand.jsp?operate=edit&folder=setting&brandId="+row.id+"' name='editgoods'>[编辑]</a>";
			}
		} ],
		buttons : [ {
			name : '添加品牌',
			bclass : 'add',
			onpress : action
		}, {
			name : '编辑品牌',
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
			display : '品牌名称',
			name : 'brandName'
		} ],
		sortname : "CREATE_TIME",	//排序字段  必须是数据库的字段名
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
		if (com == '添加品牌') {
			window.location.href = webRoot + "/page/ttw/manage/goods/brand.jsp?operate=add&folder=brand";
			return;

		}else if (com == '编辑品牌') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				$('.trSelected', grid).each(function() {
					str = this.id.substr(3);
				});
				window.location.href = webRoot + "/page/ttw/manage/goods/brand.jsp?operate=edit&folder=brand&brandId="
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
				$(".trSelected td:nth-child(2) div", $('#brandlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#branddelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#brandbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						str += this.id.substr(3) + ",";
					});
					
					//dwr批量删除品牌
					BrandAction.delBrand({id:str},function(data){
						if(data){
							$("#branddelModal").modal('hide');
							$('#brandlist').flexReload();
							forminfo("#alertinfo", "删除品牌成功");
						}
					});
				});
				//关闭“删除提示框”
				$("#brandbtnclose").click(function(){
					$("#branddelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}

	}
});
