$(function() {
	//供应商列表数据加载
	$("#flexsupplierlist").flexigrid({
		url : webRoot + '/page/ttw/manage/supplier/supplier',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '供应商编号',
			name : 'supNo',
			width :160,
			sortable : true,
			align : 'center'
		}, {
			display : '合同号码',
			name : 'contractCode',
			width : 160,
			sortable : true,
			align : 'center'
		}, {
			display : '供应商名称',
			name : 'supName',
			width : 160,
			sortable : true,
			align : 'center'
		}, {
			display : '供应商类型',
			name : 'supType',
			width : 100,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == 1){
					formatterStr = "公司";
				}else{
					formatterStr = "个人";
				}
				return formatterStr;
			}
		},{
			display : '供应商状态',
			name : 'supState',
			width : 100,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row[column] == 0){
					formatterStr = "合作";
				}else{
					formatterStr = "中止";
				}
				return formatterStr;
			}
		},{
			display : '最后修改时间',
			name : 'updateTime',
			width : 183,
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
				//自定义列表中显示的格式
				var formatterAtag = "";
				if(row.supState == "0"){
					formatterAtag = "<a href='#'; onclick='stateChange(\""+row.supplierId+"\",\"1\")'>[中止]</a>";
				}else{
					formatterAtag = "<a href='#'; onclick='stateChange(\""+row.supplierId+"\",\"0\")'>[合作]</a>";
				}
				return formatterAtag;
			}
		}],
		searchitems : [ {
			display : '请选择搜索条件',
			name : 'searchPhrase',
			isdefault : true
		}, {
			display : '供应商编号',
			name : 'supNo'
		} ],
		sortname : "CREATEDATE",	//排序字段  必须是数据库的字段名
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

//状态变更
function stateChange(supplierId,supState){
	lhgdialog.confirm("确定要变更此状态？",function(){
		window.location.href=webRoot + "page/ttw/manage/supplier/supplierStateChange?supplierId="+supplierId+"&supState="+supState;
	},null,null);
}

