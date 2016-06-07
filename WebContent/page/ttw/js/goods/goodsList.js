/**
 * flexigrid list
 */
$(function() {
	//角色标识
	var roleFlag = $("#roleFlag").val();
	
	//初始化操作按钮
	var defButtons = initButtons();
	
	//商品缓存
	var goodsCache = new Array();
	
	
	//产品列表数据加载
	$("#goodsmanagement").flexigrid({
		url : webRoot + 'page/business/goods',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '商品名称',
			name : 'goodsName',
			width : 130,
			sortable : true,
			align : 'center'
		}, {
			display : '商品分类',
			name : 'goodsCategoryName',
			width : 90,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var formatterStr = row[column];
				var rowJson = "{approvalState:'"+row['approvalState']+"',isSpecificationsOpen:'"+row['isSpecificationsOpen']+"'}";
				formatterStr += "<input id=\"rowId"+row['id']+"\" type=\"hidden\" value=\""+rowJson+"\" />";
				return formatterStr;
			}
		}, {
			display : '品牌',
			name : 'brandName',
			width : 90,
			sortable : true,
			align : 'center'
		}, {
			display : '销售价格',
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
			width : 30,
			sortable : true,
			align : 'center'
		}, {
			display : '审核状态',
			name : 'approvalState',
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var rowId = "row" + row['id'];
				
				var goodsRow = new Object();
				goodsRow.rowId = rowId;
				goodsRow.approvalState = row['approvalState'];
				goodsCache.push(goodsRow);
				
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
			width : 50,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				//自定义列表中显示的格式
				var formatterStr = "";
				/*
				if(row[column] == "1"){
					formatterStr = "<span class='truestatue icon-ok' title='上架'></span>";
				}else if(row[column] == "2"){
					formatterStr = "<span class='truestatue icon-remove' title='下架'></span>";
				}else if(row[column] == "3"){
					formatterStr = "<font color='grad'>上架中</font>";
				}else if(row[column] == "4"){
					formatterStr = "<font color='grad'>下架中</font>";
				}else{
					formatterStr = "<font color='red'>临时保存</font>";
				}
				*/
				if(row[column] == "1"){
					formatterStr = "<font color='green'>是</font>";
				}else{
					formatterStr = "<font color='red'>否</font>";
				}
				return formatterStr;
			}
		}, {
			display : '新品',
			name : 'isNew',
			width : 30,
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
			display : '关键字',
			name : 'keywordName',
			width : 100,
			sortable : true,
			align : 'center'
		}, {
			display : '排序',
			name : 'sort',
			width : 30,
			sortable : true,
			align : 'center'
		}, {
			display : '操作',
			name : 'operating',
			width : 160,
			sortable : true,
			align : 'center',
			formatter : function(column, row){
				var html = "";
				
				if(roleFlag == "default"){
					html = operationBtn(row);
				}else if(roleFlag == "sgjl"){//商管经理
					html += html += "<a id='editgoods' href='goods.jsp?operate=editprice&folder=setting&goodsId="+row.id+"' name='editgoods'>[编辑]</a>&nbsp;";
				}
				/*else if(roleFlag == "shjl"){//审核经理
					html += "<a id='viewgoods' href='goods.jsp?operate=view&folder=setting&goodsId="+row.id+"' name='viewgoods'>[查看]</a>&nbsp;&nbsp;";
				}
				*/
				html += "<a id='viewgoods' href='goods.jsp?operate=view&folder=setting&goodsId="+row.id+"' name='viewgoods'>[查看]</a>&nbsp;";
				return html; 
			}
		} ],
		buttons : defButtons,

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
		checkbox : true,
		onSuccess : function(){
			
			//控制审核中的商品不能编辑、删除
			for(var i=0; i<goodsCache.length; i++){
				var rowId = goodsCache[i].rowId;
				var approvalState = goodsCache[i].approvalState;
				
				if(approvalState == "1" || approvalState == "2"){
					//商管经理需要多选框，操作上架、下架
					if(roleFlag != "sgjl"){
						$('#'+rowId).children('th').eq(0).html("&nbsp;");
					}
				}
			}
		}
	});
	function action(com, grid) {
		if (com == '添加产品') {
			window.location.href = webRoot + "/page/ttw/manage/goods/goods.jsp?operate=add&folder=goods";
			return;

		}else if (com == '编辑产品') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				$('.trSelected', grid).each(function() {
					str = this.id.substr(3);
				});
				window.location.href = webRoot + "/page/ttw/manage/goods/goods.jsp?operate=edit&folder=goods&goodsId="
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
				$(".trSelected td:nth-child(2) div", $('#goodsmanagement')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#goodsdelModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认删除”按钮事件
				$("#goodsbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						str += this.id.substr(3) + ",";
					});
					
					//dwr批量删除产品
					GoodsAction.delGoods({id:str},function(data){
						if(data){
							$("#goodsdelModal").modal('hide');
							$('#goodsmanagement').flexReload();
							forminfo("#alertinfo", "删除商品成功");
						}
					});
				});
				//关闭“删除提示框”
				$("#goodsbtnclose").click(function(){
					$("#goodsdelModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		} else if (com == '上架') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				var price = "";
				var memberPrice = "";
				$(".trSelected", $('#goodsmanagement')).each(function(i){
					var cells = $(this).find("td div");
					str+=cells[0].innerHTML+"  ";//商品名称
					price += cells[3].innerHTML;//价格
					memberPrice += cells[4].innerHTML;//会员价
				});
				
				if(isNaN(price) || isNaN(memberPrice)){
					formwarning("#alerterror", "您选择的产品未填写销售价格或会员价格，不允许上架");
					return;
				}
				
				//上架提示框--在goodsList.jsp中编写
				$("#shelvesContentp").text(str);
				$("#goodsShelvesModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认上架”按钮事件
				$("#goodsShelvesbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						var operId = this.id.substr(3);
						var rowJson = $('#rowId'+operId).val();
						var rowJsonObj = eval('('+rowJson+')');
						
						if(rowJsonObj.approvalState != '1'){
							formwarning("#alerterror", "您选择的产品在未审核通过，不允许上架");
							return false;
						}
						
						if(rowJsonObj.isSpecificationsOpen == '1'){
							formwarning("#alerterror", "您选择的产品已上架，不允许重复操作");
							return false;
						}
						
						str += this.id.substr(3)+",";
					});
					
					//dwr批量上架产品
					GoodsAction.shelvesGoods({id:str},function(data){
						if(data){
							$("#goodsShelvesModal").modal('hide');
							$('#goodsmanagement').flexReload();
							forminfo("#alertinfo", "产品上架成功");
						}
					});
				});
				//关闭“删除提示框”
				$("#goodsShelvesbtnclose").click(function(){
					$("#goodsShelvesModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要上架的产品");
				return false;
			}

		}else if (com == '下架') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#goodsmanagement')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				
				//删除提示框--在goods.jsp中编写
				$("#fromShelvesContentp").text(str);
				$("#goodsFromShelvesModal").modal({
					keyboard:true,
					show:true,
				});
				
				//“确认下架”按钮事件
				$("#goodsFromShelvesbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						var operId = this.id.substr(3);
						var rowJson = $('#rowId'+operId).val();
						var rowJsonObj = eval('('+rowJson+')');
						
						if(rowJsonObj.approvalState != '1'){
							formwarning("#alerterror", "您选择的产品未审核通过，不允许下架");
							return false;
						}
						
						if(rowJsonObj.isSpecificationsOpen == '2'){
							formwarning("#alerterror", "您选择的产品已下架，不允许重复操作");
							return false;
						}
						
						str += this.id.substr(3) + ",";
					});
					
					//dwr批量上架产品
					GoodsAction.fromShelvesGoods({id:str},function(data){
						if(data){
							$("#goodsFromShelvesModal").modal('hide');
							$('#goodsmanagement').flexReload();
							forminfo("#alertinfo", "产品下架成功");
						}
					});
					
				});
				//关闭“上架提示框”
				$("#goodsFromShelvesbtnclose").click(function(){
					$("#goodsFromShelvesModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要下架的产品");
				return false;
			}

		}

	}
	/**
	 * 拼接操作列按钮
	 */
	function operationBtn(row){
		var html = "";
		if(row['approvalState'] == "-1" || row['approvalState'] == ""){
			html += "<a id='editgoods' href='goods.jsp?operate=edit&folder=setting&goodsId="+row.id+"' name='editgoods'>[编辑]</a>";
		}
		//提交审核
		if(row['approvalState'] == "-1"){
			html += "<a href='javascript:void(0);' onclick='startGoodsWorkflow(\""+row.id+"\",\""+row.goodsName+"\")'>[提交审核]</a>";
		}
		return html;
	}
	
	/**
	 * 初始化操作按钮
	 * @returns {Array}
	 */
	function initButtons(){
		//定义操作按钮
		var defButtons = new Array();
		
		var addGoods = {
			name : '添加产品',
			bclass : 'add',
			onpress : action
		};
		var editGoods = {
			name : '编辑产品',
			bclass : 'edit',
			onpress : action
		};
		var delGoods = {
			name : '删除',
			bclass : 'del',
			onpress : action
		};
		var sjGoods = {
			name : '上架',
			bclass : 'add',
			onpress : action
		};
		
		var xjGoods = {
			name : '下架',
			bclass : 'add',
			onpress : action
		};
		var separatorObj = {
			separator : true
		};
		if(roleFlag == "default"){
			defButtons.push(addGoods);
			defButtons.push(editGoods);
			defButtons.push(delGoods);
		}else if(roleFlag == "sgjl"){
			defButtons.push(sjGoods);
			defButtons.push(xjGoods);
		}else if(roleFlag == "shjl"){
			//没有操作按钮
		}
		
		defButtons.push(separatorObj);
		
		return defButtons;
	}
});
