$(function(){

	reloadPage = function(){
		window.location.href = webRoot+'/page/platform/dict/dictList.jsp';
	},

	/*addTableRow = function(num){
		var html = "<tr id='rowNum"+num+"'>";
		html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"hidden\" name=\"id\">";
		html += "	<input type=\"text\" class=\"form-control\" name=\"type\" placeholder=\"请输入数据字典类型\">";
		html += "</td></tr>";
		html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"hidden\" name=\"id\">";
		html += "	<input type=\"text\" class=\"form-control\" name=\"defaultKey\" placeholder=\"请输入数据字典键\">";
		html += "</td></tr>";
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"defaultValue\" placeholder=\"请输入数据字典值\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"sort\" placeholder=\"请输入排列顺序\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"expand1\" placeholder=\"请输入扩展字段1\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"expand2\" placeholder=\"请输入扩展字段2\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"expand3\" placeholder=\"请输入扩展字段3\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"expand4\" placeholder=\"请输入扩展字段4\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"expand5\" placeholder=\"请输入扩展字段5\">";
        html += "</td></tr>";
        
        html += "<tr><td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"remark\" placeholder=\"请输入描述\">";
        html += "</td></tr>";
        
		html += "<tr><td  class=\"text-left\">";
		html += "		<input  class='attribute btn btn-success delCommandRow' type='button' rowId='rowNum"+num+"' value='删除' />";
		html += "</td>";
        html += "</tr>";
        $('#dictForm tbody').append(html);
	},
	
	addTableRowNum = function(count){
		var rowNum = $('#dictForm tbody').children().length;
		for(var i=0; i < count; i++){
			addTableRow(rowNum + i);
		}
	},
	
	delTableRow = function(rowId){
		$("#"+rowId).remove();
	},*/
	
	delDict = function(idVal){
		SysDictAction.delDict({id:id},function(data){
			if(data){
				reloadPage();
			}else{
				alert("删除失败");
			}
		});
	},
	
	//初始化行数
	/*initTableRow = function (){
		var rowCount = $('#rows').val();
		if(rowCount == 0){
			addTableRowNum(1);
		}
	},*/
	
	

	
	saveDict = function(){
		var defaultValueType= $('input:radio[name=defaultValueType]:checked').val();
		var id = $('#id').val();
		var type = $('#type').val();
		var defaultKey = $('#defaultKey').val();
		var defaultValue = $('#defaultValue').val();
		var sort = $('#sort').val();
		var expand1 = $('#expand1').val();
		var expand2 = $('#expand2').val();
		var expand3 = $('#expand3').val();
		var expand4 = $('#expand4').val();
		var expand5 = $('#expand5').val();
		var remark = $('#remark').val();
		
		if(type == ""){
			lhgdialog.alert("数据字典类型必须填写，不能为空");
			return false;
		}
		
		//排序
		if(sort == ""){
			lhgdialog.alert("排序序号必须填写，不能为空");
			return false;
		}
		
		 
		var sortRegexp = /^[0-9]*$/;
		if(!sortRegexp.test(sort)){    
			lhgdialog.alert("排序只能是数字");
			return false;  
        }
	
		//支持同步调用
		dwr.engine.setAsync(false);
		$("body").mask("处理中...");
		if(type != ""){
			SysDictAction.saveDict({
						id:id,
						defaultValueType:defaultValueType,
						type:type,
						defaultKey:defaultKey,
						defaultValue:defaultValue,
						sort:sort,
						expand1:expand1,
						expand2:expand2,
						expand3:expand3,
						expand4:expand4,
						expand5:expand5,
						remark:remark
					},
					function(data){
						if(data){
							
						}else{
							alert("创建失败");
						}
					}
			);
		}
		$("body").unmask();
		//刷新页面
		reloadPage();
	};
	
	//初始化事件
	initEvent = function(){
		
		//返回
		$("#btnback").click(function(){
			window.location.href = webRoot+'/page/platform/dict/dictList.jsp';
		});
		
		/*//增加
		$("#btn_add_row").click(function(){
			addTableRowNum(1);
		});
		
		//删除新增的行（数据还没有保存到数据库的行）
		$(".delCommandRow").live("click", function(){
			var rowId = $(this).attr('rowId');
			delTableRow(rowId);
		});
		
		//删除新增的行（包含数据）
		$(".delCommandData").on("click", function(){
			var rowId = $(this).attr('rowId');
			delTableRow(rowId);
			//
			var idVal = $(this).attr("id");
			delDict(idVal);
		});*/
		
		
		/**
		 * 提交属性
		 */
		$('#submitattrs').click(function(){
			saveDict();
		});
		
		$('#updateattrs').click(function(){
			saveDict();
		});
	}
	
	
});
/*===========================================Gorgeous split-line==============================================*/
$(function(){
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	if (operate == "add") {
		//initTableRow();
        initEvent();
	}else if(operate=="edit"){
		//addTableRowNum();
        initEvent();		
	}
});