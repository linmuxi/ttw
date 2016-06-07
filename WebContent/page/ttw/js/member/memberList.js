/**
 * flexigrid list
 */
$(function() {
	//产品属性列表数据加载
	$("#memberlist").flexigrid({
		url : webRoot + 'page/business/manage/member/memberList',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '会员名称',
			name : 'name',
			width : 280,
			sortable : false,
			align : 'center'
		}, {
			display : '登陆账号',
			name : 'account',
			width : 210,
			sortable : false,
			align : 'center'
		}, {
			display : '会员等级',
			name : 'rankName',
			width : 80,
			sortable : false,
			align : 'center'
		}, {
			display : '性别',
			name : 'gender',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				if(row.name!=''){
					if(row[column] == "0"){
						formatterStr = "女";
					}else if(row[column] == "1"){
						formatterStr = "男";
					}
				}
				return formatterStr;
			}
		}, {
			display : '状态',
			name : 'enabled',
			width : 80,
			sortable : true,
			align : 'center',
			formatter : function(column, row) {
				if(row[column]){
					return "<a href='#' title='正常'><span class='truestatue icon-ok'></span></a>";
				}else if(row.enabled==false){
					return "<a href='#' title='锁定'><span class='truestatue icon-lock'></span></a>";
				}else{
					return "<a href='#' title='禁用'><span class='truestatue icon-remove'></span></a>";
				}
			}
		}, {
			display : '创建时间',
			name : 'createDate',
			width : 110,
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
			display : '最后登录时间',
			name : 'lastLoginDate',
			width : 110,
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
			width : 90,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var userid = row.user.userId;
				var view = "<a href='"+webRoot+"page/business/manage/member/memberDetail?userId="+userid+"'>[查看]</a>&nbsp;";
				if(row.enabled == 0){
					view+="<a href='javascript:void(0);' onclick='enabledChange(\""+userid+"\",1);'>[启用]</a>";
				}else{
					view+="<a href='javascript:void(0);' onclick='enabledChange(\""+userid+"\",0);'>[禁用]</a>";
				}
				return view;
			}
		}],
		sortname : "t1.CREATE_DATE",	//排序字段  必须是数据库的字段名
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
