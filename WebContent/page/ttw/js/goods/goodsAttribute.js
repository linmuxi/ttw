(function($){
	//定义命名空间
	_admin = $.extend({},$.admin);
	
	//初始化表格
	function initTable(){
		var grid = $("#grid-data").bootgrid({
		    ajax: true,
		    ajaxSettings:{
		    	method:"POST",
		    	cache:false
		    },
		    templates: {
		    	actionButton:"<button class=\"btn btn-default\" type=\"button\" " +
		    				" title=\"{{ctx.text}}\" style=\"height:34px;\">{{ctx.content}}</button>",
		    	actions:"<div class=\"{{css.actions}}\">" +
					    	"<button type=\"button\" class=\"btn btn-default\" " +
							"id=\"id_back\">返回</button>" +
			    			"<button type=\"button\" class=\"btn btn-default\" " +
			    			"id=\"id_add_goodsAttribute\">新增</button>" +
		    			"</div>"
		    },
		    navigation:3,
		    searchSettings:{
		    	delay:100,
		    	characters:2
		    },
		    labels:{
		    	all:"全部",
		    	infos:"显示 {{ctx.start}} to {{ctx.end}} 共 {{ctx.total}} 条",
		    	loading:"加载中...",
		    	noResults:"没有结果",
		    	refresh:"刷新",
		    	search:"查询"
		    },
		    post: function ()
		    {
		        return {
		            id: ""
		        };
		    },
			selection: true,
			multiSelect: true,
		    url: webRoot+"/page/business/goodsAttribute",
		    formatters: {
		    	"num": function(column, row)
		        {
		        	GoodsAttribute.defaults.num += 1;
		        	return GoodsAttribute.defaults.num;
		        },
		        "dateFormat": function(column, row)
		        {
		        	var updateDate = row.updateTime;
		        	if(updateDate == '' || updateDate == null){
		        		return '';
		        	}else{
		        		var lastUpdate = new Date(updateDate);
		        		var lastUpdateStr = lastUpdate.format("yyyy年MM月dd日hh小时mm分ss秒");
		        		return "<font title='"+lastUpdateStr+"'>"+lastUpdateStr+"</font>";
		        	}
		        },
		        
		        
		        "commands":function(column,row){
		            return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\"" +
		            		" data-id=\"" + row.id + "\"" +
		            		" data-goodsattributename=\"" + row.goodsAttributeName + "\"" +
		            		" data-goodstypeid=\"" + row.goodsTypeId +"\"" +
		            		" data-goodstypename=\"" + row.goodsTypeName +"\"" +
		            		" data-sort=\"" + row.sort +"\"" +
		            		" data-attributelist=\"" + row.attributeList +"\"" +
		            		"><span class=\"glyphicon glyphicon-edit\"></span></button> " + 
		            		"<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-id=\"" + row.id + 
		            		"\"><span class=\"glyphicon glyphicon-remove\"></span></button>";
		        }
		    },
		    requestHandler:function(request){
		    	return convertParam(request);
		    },
		    responseHandler:function(response){
		    	GoodsAttribute.defaults.num = 0;
		    	return response;
		    }
		}).on("loaded.rs.jquery.bootgrid", function(){
			    grid.find(".command-edit").on("click", upateGoodsAttribute).end().find(".command-delete").on("click", delGoodsAttribute);
		}).on("selected.rs.jquery.bootgrid", function(e, rows){
		    var rowIds = [];
		    for (var i = 0; i < rows.length; i++)
		    {
		        rowIds.push(rows[i].id);
		    }
		    alert("Select: " + rowIds.join(","));
		}).on("deselected.rs.jquery.bootgrid", function(e, rows){
		    var rowIds = [];
		    for (var i = 0; i < rows.length; i++)
		    {
		        rowIds.push(rows[i].id);
		    }
		    alert("Deselect: " + rowIds.join(","));
		});
	}
	
	//转换请求参数
	function convertParam(request){
		var paramObj = request;
    	paramObj.pageNo = request.current;
    	paramObj.pageSize = (request.rowCount == -1)?99999999:request.rowCount;
    	if(request.sort){
    		for(var key in request.sort){
    			if(key){
    				paramObj.sortFieldName = key;
    				paramObj.sortType = request.sort[key];
    				//删除paramObj对象的sort属性，避免与VO中的属性冲突
    				delete paramObj.sort;
    				break;
    			}
    		}
    	}
    	return paramObj;
	}
	
	//初始化事件
	function initEvent(){
		//var type = -1;
		//商品属性添加
		$("#id_add_goodsAttribute").click(function(){
			window.location.href = webRoot+'/page/business/initGoodsAttribute';
		});
		
		//返回
		$("#id_back").click(function(){
			history.go(-1);
		});
	}
	
	
	
	
	
	//商品属性修改
	var upateGoodsAttribute = function(e){
		window.location.href = webRoot+'/page/business/initGoodsAttribute?goodsTypeId='+$(this).data("goodstypeid");
	}
	
	var delGoodsAttribute = function(e){
		GoodsAttributeAction.delGoodsAttribute({id:$(this).data("id")},function(data){
			if(data){
				$("#grid-data").bootgrid("reload");
			}else{
				alert("删除失败");
			}
		});
	}
	
	
	
	
	var isEmpty = function(str){
		return (str == undefined || str == null || str.toUpperCase() == 'NULL' || str.trim() == '');
	}
	
	Date.prototype.format = function(format){
		var o = {
			"M+" : this.getMonth()+1, //month
			"d+" : this.getDate(), //day
			"h+" : this.getHours(), //hour
			"m+" : this.getMinutes(), //minute
			"s+" : this.getSeconds(), //second
			"q+" : Math.floor((this.getMonth()+3)/3), //quarter
			"S" : this.getMilliseconds() //millisecond
		}

		if(/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
		}

		for(var k in o) {
			if(new RegExp("("+ k +")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
			}
		}
		return format;
	} 
	
	function init(){
        initTable.call(this);
        initEvent.call(this);
	}
	
	var GoodsAttribute = function(ops){
		this.options = $.extend(true, {}, GoodsAttribute.defaults, ops);
		init.call(this);
	}
	
	GoodsAttribute.defaults = {
		num:0
	};
	
	_admin.GoodsAttribute = GoodsAttribute;
	$.admin = _admin;
})(jQuery);

new $.admin.GoodsAttribute({});