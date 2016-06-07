/**
 * flexigrid list
 */
$(function() {
	//产品列表数据加载
	$("#goodsmanagement").flexigrid({
		url : webRoot + 'page/business/goods',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '商品名称',
			name : 'goodsName',
			width : 220,
			sortable : true,
			align : 'center'
		}, {
			display : '商品分类',
			name : 'goodsCategoryName',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '品牌',
			name : 'brandName',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '价格',
			name : 'price',
			width : 50,
			sortable : true,
			align : 'center'
		}, {
			display : '会员价格',
			name : 'memberPrice',
			width : 50,
			sortable : true,
			align : 'center'
		}, {
			display : '数量',
			name : 'quantity',
			width : 50,
			sortable : true,
			align : 'center'
		}, {
			display : '单位',
			name : 'unitName',
			width : 50,
			sortable : true,
			align : 'center'
		}, {
			display : '审核状态',
			name : 'approvalState',
			width : 70,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == "1"){
					formatterStr = "<font color='green'>通过</font>";
				}else if(row[column] == "-1"){
					formatterStr = "<font color='red'>不通过</font>";
				}else if(row[column] == "2"){
					formatterStr = "<font color='gray'>审核中</font>";
				}
				return formatterStr;
			}
		}, {
			display : '是否上架',
			name : 'isSpecificationsOpen',
			width : 70,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == "1"){
					//formatterStr = "<span class='truestatue'><img width='20px' height='20px' src='"+webRoot+"/page/platform/ui/assets/img/header/icon-48-apply.png'/></span>";
					formatterStr = "<span class='truestatue icon-ok' title='上架'></span>";
				}else if(row[column] == "-1"){
					//formatterStr = "<span class='falsestatue'><img width='20px' height='20px' src='"+webRoot+"/page/platform/ui/assets/img/header/icon-48-deny.png'/></span>";
					formatterStr = "<span class='truestatue icon-remove' title='下架'></span>";
				}else if(row[column] == "2"){
					//formatterStr = "<span class='falsestatue'><img width='20px' height='20px' src='"+webRoot+"/page/platform/ui/assets/img/header/icon-48-deny.png'/></span>";
					formatterStr = "<font color='grad'>上架中</font>";
				}else{
					formatterStr = "<font color='red'>临时保存</font>";
				}
				return formatterStr;
			}
		}, {
			display : '是否新品',
			name : 'isNew',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == "1"){
					//formatterStr = "<span class='truestatue'><img width='20px' height='20px' src='"+webRoot+"/page/platform/ui/assets/img/header/icon-48-apply.png'/></span>";
					formatterStr = "<span class='truestatue icon-ok'></span>";
				}else{
					//formatterStr = "<span class='falsestatue'><img width='20px' height='20px' src='"+webRoot+"/page/platform/ui/assets/img/header/icon-48-deny.png'/></span>";
					formatterStr = "<span class='truestatue icon-remove'></span>";
				}
				return formatterStr;
			}
		}, {
			display : '关键字',
			name : 'keywordName',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '排序',
			name : 'sort',
			width : 50,
			sortable : true,
			align : 'center'
		}/*, {
			display : '操作',
			name : 'operating',
			width : 110,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				return "<a id='editgoods' href='goods.jsp?operate=edit&folder=setting&goodsId="+row.id+"' name='editgoods'>[编辑]</a>";
			}
		}*/ ],
		buttons : [ {
			name : '查询',
			bclass : 'add',
			onpress : action
		}],
		
		searchitems : [ {
			display : '请选择搜索条件',
			name : 'searchPhrase',
			isdefault : true
		}, {
			display : '商品名称',
			name : 'goodsName'
		} ],
		sortname : "CREATE_TIME",	//排序字段  必须是数据库的字段名
		sortorder : "desc",
		usepager : true,
		title : '',
		useRp : true,
		rp :20,
		rpOptions : [ 10, 20, 40, 100 ],
		showTableToggleBtn : false,
		showToggleBtn : true,
		width : 'auto',
		height : '250',
		pagestat : '显示{from}到{to}条，共{total}条记录',
		procmsg : '正在获取数据，请稍候...',
		nomsg: '没有数据',
		onError: '查询出错请刷新',
		checkbox : true
	});
	function action(com, grid) {
		if (com == '查询') {
			var shelves = $('#shelves').val();
			var url = webRoot + 'page/business/goods?isSpecificationsOpen=' + shelves;
			$('#goodsmanagement').flexReload({url:url});
		}
	}
});
