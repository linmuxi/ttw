/**
 * flexigrid list
 */
$(function() {
	//产品属性列表数据加载
	$("#attributelist").flexigrid({
		url : webRoot + 'page/ttw/manage/order?m=' + method,
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '订单编号',
			name : 'orderSn',
			width : 130,
			sortable : false,
			align : 'left',
			formatter : function(column, row){
				var id = row.id;
				var url = "<a href='"+webRoot+"page/ttw/manage/order/orderDetail?id="+id+"'>"+row.orderSn+"</a>";
				return url;
			}
		}, {
			display : '商品',
			name : 'goodsName',
			width : 160,
			sortable : false,
			align : 'left'
		}, {
			display : '会员',
			name : 'memberName',
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
			width : 100,
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
				var name = "";
				if(row.orderStatus == '0'){
					name = "未确认";
				}
				if(row.orderStatus == '1'){
					name = "待核实";
				}
				if(row.orderStatus == '2'){
					name = "待制作";
				}
				if(row.orderStatus == '3'){
					name = "制作中";
				}
				if(row.orderStatus == '4'){
					name = "待验收";
				}
				if(row.orderStatus == '5'){
					name = "已验收";
				}
				if(row.orderStatus == '6'){
					name = "待支付尾款";
				}
				if(row.orderStatus == '10'){
					name = "待修改";
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
			width : 130,
			sortable : true,
			align : 'left',
			formatter : function(column, row){
				var id = row.id;
				var url = "<a href='"+webRoot+"page/ttw/manage/order/orderDetail?id="+id+"&m="+method+"'>[查看]</a>";
					url+= "&nbsp;";
				if(row.orderStatus == '1'){
					url+= "<a href='"+webRoot+"page/ttw/manage/order/orderDetail?id="+id+"&m="+method+"' title='核实会员是否按照供应商要求提交资料'>[核实]</a>";
				}
				if(row.orderStatus == '3' && method =='supplier'){
					url+= "<a href='"+webRoot+"page/ttw/manage/order/goAccept?id="+id+"&m="+method+"' title='提交会员验收'>[制作]</a>";
				}
				if(row.orderStatus == '5' && method =='supplier'){
					url+= "<a href='"+webRoot+"page/ttw/manage/order/goAccept?id="+id+"&m="+method+"'>[上传源码]</a>";
				}
				return url;
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
