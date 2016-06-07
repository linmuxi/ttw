/**
 * flexigrid list
 */
$(function() {
	//产品属性列表数据加载
	$("#attributelist").flexigrid({
		url : webRoot + 'page/ttw/manage/supplier/order?m=' + method,
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '编号',
			name : 'orderSn',
			width : 230,
			sortable : false,
			align : 'left',
			formatter : function(column, row){
				var id = row.id;
				var url = "<a href='"+webRoot+"page/ttw/manage/order/orderDetail?id="+id+"'>"+row.orderSn+"</a>";
				return url;
			}
		}, {
			display : '会员',
			name : 'creator',
			width : 120,
			sortable : false,
			align : 'center'
		}, {
			display : '订单金额',
			name : 'amount',
			width : 100,
			sortable : false,
			align : 'center',
			formatter : function(colomn, row){
				var amount = new Number(row.amount); 
				amount = amount.toFixed(2); //2为要获取小数后的位数 会自动四舍五入
				return amount;
			}
		}, {
			display : '支付方式',
			name : 'paymentMethodName',
			width : 150,
			sortable : true,
			align : 'center'
		}, {
			display : '支付状态',
			name : 'paymentStatus',
			width : 60,
			sortable : true,
			align : 'center'
		}, {
			display : '开票',
			name : 'isInvoice',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				return (row.isInvoice == 1) ? "开":"否";
			}
		}, {
			display : '订单状态',
			name : 'orderStatus',
			width : 92,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var statusName = "";
				if(row.orderStatus == '0'){
					name = "未确认";
				}
				return name;
			}
		}, {
			display : '下单时间',
			name : 'createDate',
			width : 120,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = row[column];
				var lastUpdate = new Date(formatterStr);
        		var lastUpdateStr = lastUpdate.format("yyyy-MM-dd hh:mm");
        		return lastUpdateStr;
			}
		}, {
			display : '操作',
			name : '',
			width : 80,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var id = row.id;
				return "<a href='"+webRoot+"page/ttw/manage/order/orderDetail?id="+id+"'>[查看]</a>";
			}
		}],
		sortname : "CREATE_TIME",	//排序字段  必须是数据库的字段名
		sortorder : "desc",
		usepager : true,
		title : false,
		useRp : true,
		rp :20,
		rpOptions : [ 5, 20, 40, 100 ],
		showTableToggleBtn : true,
		showToggleBtn : true,
		width : '1080',
		height : '350',
		pagestat : '显示{from}到{to}条，共{total}条记录',
		procmsg : '正在获取数据，请稍候...',
		resizable : false,
		striped : true,
		checkbox : false
	});
});
