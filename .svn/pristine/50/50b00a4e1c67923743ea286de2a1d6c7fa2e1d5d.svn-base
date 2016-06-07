/**
 * flexigrid list
 */
$(function() {
	//品牌列表数据加载
	$("#selectCategorylist").flexigrid({
		url : webRoot + 'page/business/goodsSortCategory',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '产品分类名称',
			name : 'name',
			width : 200,
			sortable : true,
			align : 'center'
		}, {
			display : '父分类',
			name : 'parentId',
			width : 150,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				
				return row.parentGoodsCategory ? row.parentGoodsCategory.name : '根分类';
			}
		}, {
			display : '排序',
			name : 'sort',
			width : 50,
			sortable : true,
			align : 'center'
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
});
