$(function(){
	/**
	 * 当表单有错误的时候用来显示提示信息
	 * divid 需要填充的层
	 * msg 提示信息
	 * location 提示后定位页面的div id
	 */
	formwarning=function(divid,msg){
		$(divid).show();
		$(divid+" strong").text(msg);
		window.location.hash = "#navigation";
	},
	forminfo=function(divid,msg){
		$(divid).show();
		$(divid+" strong").text(msg);
		window.location.hash = "#navigation";
	},
	$("#btnback").click(function(){
		history.back(-1);
	});
	$("#myTaskList").click(function(){
		//window.
		window.location.href = webRoot + "page/platform/activiti/taskList.jsp";
	});
	$("#confirmlogout").click(function(){
		window.location.href = webRoot + "page/logout?type=1";
	});
	/**
	 * 动态改变页面标题区域值
	 */
	setdttitle=function(divid,msg){
		$(divid).text(msg);
	}
});


//页面跳转方法
function forward(url){
	window.location.href = url;
}



//构建子表
var ChildTable = {
	initTable: function(id, data){
		
		//获取子表表格配置
		var theadChild = $('#'+id+' thead').find('th');
		
		//主键
		var pkObj = "",tableObj = "",actionUrl = "";
		
		//业务字段数组
		var fieldArr = new Array();
		
		for(var i=0; i<theadChild.length; i++){
			//获取业务字段配置
			var conf = $(theadChild[i]).attr('id');
			var confObj = eval("(" + conf + ")");
			
			//第一个字段，获取pk、table的配置
			if(i == 0){
				pkObj = confObj.pk;
				tableObj = confObj.table;
				
			//最后一个字段，获取action（请求地址）
			}else if(i == (theadChild.length - 1)){
				actionUrl = confObj.action;
			}else{
				fieldArr.push(confObj);
			}
		}
		
		var html = "<tbody>";
			
		for(var i=0; i<data.length; i++){
			html += "<tr>";
			html += "<td>"+(i+1)+"</td>";
			for(var j=0; j<fieldArr.length; j++){
				var attrName = fieldArr[j].name;
				var fieldVal = data[i][attrName];
				
				html += "<td>";
				html += "<input type='text' name='"+fieldArr[j].name+"' value='"+fieldVal+"'/>";
				html += "</td>";
			}
			html += "<td><button type=\"button\" class=\"btn btn-xs btn-default command-edit\"><span class=\"glyphicon glyphicon-edit\"></span></button></td>";
			html += "</tr>";
		}
		
		html += "</tbody>";
		
		$('#'+id).append(html);
	}
}

/***
*	获取url参数值函数
*/
var getUrlParam = function(name){
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null) return unescape(r[2]); return null;
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

