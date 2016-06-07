/**
 * flexigrid list
 */
$(function() {
	$("#bannerlist").flexigrid({
		url : webRoot + 'page/business/banner/queryBannerList',
		dataType : 'json',
		cache : false,
		colModel : [ {
			display : '名称',
			name : 'name',
			width:100,
			sortable : true,
			align : 'center'
		}, {
			display : '描述',
			name : 'descript',
			width:150,
			sortable : true,
			align : 'center'
		}, {
			display : '图片URL',
			name : 'picUrl',
			width:150,
			sortable : true,
			align : 'center'
		}, {
			display : '排序',
			name : 'sort',
			width:50,
			sortable : true,
			align : 'center'
		}, {
			display : '连接地址',
			name : 'href',
			width:160,
			sortable : true,
			align : 'center'
		}, {
			display : '所属页面',
			name : 'page',
			width:100,
			sortable : true,
			align : 'center'
		}, {
			display : '所属页面位置',
			name : 'pageIdx',
			width:100,
			sortable : true,
			align : 'center'
		}, {
			display : '最后修改时间',
			width:80,
			name : 'updateTime',
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
			width:100,
			sortable : false,
			align : 'center',
			formatter : function(column, row){
				return "<a id='editBanner' href='javascript:updateBanner(\""+row.id+"\")' name='editBanner'>[编辑]</a> &nbsp;" +
						"<a id='deleteBanner' href='javascript:deleteBanner(\""+row.id+"\",\""+row.name+"\")' name='deleteBanner'>[删除]</a>";
			}
		} ],
		buttons : [ {
			name : '添加',
			bclass : 'add',
			onpress : action
		}, /*{
			name : '修改',
			bclass : 'edit',
			onpress : action
		}, {
			name : '删除',
			bclass : 'del',
			onpress : action
		},*/ {
			separator : true
		} ],

		searchitems : [ {
			display : '请选择搜索条件',
			name : 'searchPhrase',
			isdefault : true
		}, {
			display : '名称',
			name : 'name'
		} , {
			display : '所属页面',
			name : 'page'
		} , {
			display : '所属页面位置',
			name : 'pageIdx'
		} ],
		sortname : "LAST_UPDATE_DATE",	//排序字段  必须是数据库的字段名
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
		if (com == '添加') {
			window.location.href = webRoot + "page/ttw/manage/banner/addBanner.jsp";
			return;
		}else if (com == '修改') {
			if ($('.trSelected', grid).length == 1) {
				var str = "";
				$('.trSelected', grid).each(function() {
					str = this.id.substr(3);
				});
				
				window.location.href = webRoot + "page/ttw/manage/banner/updateBanner.jsp?id=" + str;
				return;
			} else {
				formwarning("#alerterror", "请选择一条信息");
				return false;
			}
		}else if (com == '删除') {
			//是否选择列表行
			if ($('.trSelected', grid).length > 0) {
				var str="";
				$(".trSelected td:nth-child(2) div", $('#bannerlist')).each(function(i){
					str+=this.innerHTML+"  ";
				});
				//删除提示框--在goods.jsp中编写
				$("#contentp").text(str);
				$("#bannerModal").modal({
					keyboard:true,
					show:true
				});
				
				//“确认删除”按钮事件
				$("#bannerbtnok").click(function(){
					var str = "";
					//获取列表中选中的行
					$('.trSelected', grid).each(function() {
						str += this.id.substr(3) + ",";
					});
					//dwr批量删除品牌
					BannerAction.deleteBanner({id:str},function(data){
						if(data){
							$("#bannerModal").modal('hide');
							$('#bannerlist').flexReload();
							forminfo("#alertinfo", "删除成功");
						}
					});
				});
				//关闭“删除提示框”
				$("#bannerbtnclose").click(function(){
					$("#bannerModal").modal('hide');
				});
				
			} else {
				formwarning("#alerterror", "请选择要删除的信息");
				return false;
			}
		}
	};
});

function updateBanner(id){
	window.location.href = webRoot + "page/ttw/manage/banner/updateBanner.jsp?id=" + id;
};

function deleteBanner(id,name){
	$("#contentp").text(name);
	$("#bannerModal").modal({
		keyboard:true,
		show:true
	});
	//“确认删除”按钮事件
	$("#bannerbtnok").click(function(){
		$("body").mask("处理中...");
		BannerAction.deleteBanner({id:id},function(data){
			if(data){
				$("#bannerModal").modal('hide');
				$('#bannerlist').flexReload();
				forminfo("#alertinfo", "删除成功");
			}
			$("body").unmask();
		});
	});
	//关闭“删除提示框”
	$("#bannerbtnclose").click(function(){
		$("#bannerModal").modal('hide');
	});
}
