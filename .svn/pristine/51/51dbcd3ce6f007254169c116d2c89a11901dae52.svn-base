$(function(){


	
	var rid="";
	
	reloadPage = function(){
		var goodsTypeIdVal = $('#goodsCategorySelect').val();
		window.location.href = webRoot+'/page/business/initGoodsAttribute?operate=edit&goodsTypeId='+goodsTypeIdVal;
	},
	
	validateForm = function(){
		var name = $("#name").val();
		if(isEmpty(name)){
			alert("商品分类名称不能为空。");
			return true;
		}
		return false;
	},
	
	
	addTableRow = function(num){
		
		var html = "<tr id='rowNum"+num+"'>";
		html += "<td  class=\"text-left\">";
        html += "	<input type=\"hidden\" name=\"id\">";
		html += "	<input type=\"text\" class=\"form-control\" name=\"goodsAttributeName\" placeholder=\"请输入属性名称\">";
		html += "</td>";
        html += "<td  class=\"text-left\">";
        html += "	<input type=\"text\" class=\"form-control\" name=\"attributeList\" placeholder=\"请输入属性集合\">";
        html += "</td>";
        html += "<td  class=\"text-left\">";
        html += "<input type=\"text\" class=\"form-control small\" name=\"sort\" placeholder=\"请输入排序号\">";
        html += "</td>";
		html += "<td  class=\"text-left\">";
		html += "		<input  class='attribute btn btn-success delCommandRow' type='button' rowId='rowNum"+num+"' value='删除' />";
		//html += "	<button type=\"button\" class=\"btn btn-xs btn-default command-delete delCommandRow\" rowId=\"rowNum"+num+"\">";
		//html += "		<span class=\"glyphicon glyphicon-remove\"></span>";
		//html += "	</button>";
		html += "</td>";
        html += "</tr>";
        
        $('#goodstypetnattrssarea tbody').append(html);
	},
	
	addTableRowNum = function(count){
		var rowNum = $('#goodstypetnattrssarea tbody').children().length;
		
		for(var i=0; i < count; i++){
			addTableRow(rowNum + i);
		}
	},
	
	delTableRow = function(rowId){
		$("#"+rowId).remove();
	},
	
	delGoodsAttribute = function(idVal){
		GoodsAttributeAction.delGoodsAttribute({id:idVal},function(data){
			if(data){
				reloadPage();
			}else{
				alert("删除失败");
			}
		});
	},
	
	//初始化行数
	initTableRow = function (){
		var rowCount = $('#rows').val();
		if(rowCount == 0){
			addTableRowNum(3);
		}
	},
	
	
	saveGoodsAttribute = function(){
		var goodsTypeIdVal = $('#goodsCategorySelect').val();
		var goodsTypeText = $("#goodsCategorySelect option:selected").text();
		
		if(goodsTypeIdVal == ""){
			alert("商品属性类别不能为空。");
			return false;
		}
		
		$('#goodstypetnattrssarea tbody').children().each(function(){
			var idVal = "";
			var goodsAttributeNameVal = "";
			var attributeListVal = "";
			var sortVal = "";
			//是否继承父类型属性
			var isParentAttr = false;
			
			$(this).find('input').each(function(){
				
				if($(this).attr('readonly') == 'readonly'){
					isParentAttr = true;
				}
				
				var nameAttrVal = $(this).attr('name');
				
				if(nameAttrVal == "id"){
					idVal = $(this).val();
				}else if(nameAttrVal == "goodsAttributeName"){
					goodsAttributeNameVal = $(this).val();
				}else if(nameAttrVal == "attributeList"){
					attributeListVal = $(this).val();
				}else if(nameAttrVal == "sort"){
					sortVal = $(this).val();
				}
			});
			
			//继承父类型的属性不需要修改保存
			if(isParentAttr){
				return true;
			}
			
			if(goodsAttributeNameVal == ""){
				return true;
			}
			
			//支持同步调用
			dwr.engine.setAsync(false);
			GoodsAttributeAction.saveGoodsAttribute(
					{
						id:idVal,
						goodsTypeId:goodsTypeIdVal,
						goodsTypeName:goodsTypeText,
						goodsAttributeName:goodsAttributeNameVal,
						attributeList:attributeListVal,
						sort:sortVal
					},
					function(data){
						if(data){
							
						}else{
							alert("创建失败");
						}
					}
			);
			//dwr调用
			dwr.engine.setAsync(true);
		});
		//刷新页面
		reloadPage();
	}
	
	//初始化事件
	initEvent = function(){
		//商品属性添加
		$("#goodsCategorySelect").change(function(){
			window.location.href = webRoot+'/page/business/initGoodsAttribute?operate=edit&goodsTypeId='+$("#goodsCategorySelect option:selected").val();
		});
		
		//返回
		$("#btnback").click(function(){
			window.location.href = webRoot+'page/ttw/manage/goods/goodsAttributeList.jsp';
		});
		
		//增加
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
			delGoodsAttribute(idVal);
		});
		
		
		/**
		 * 提交属性
		 */
		$('#submitattrs').click(function(){
			saveGoodsAttribute();
		});
		
		$('#updateattrs').click(function(){
			saveGoodsAttribute();
		});
	}
	
	/*
	 * To obtain random rid
	 
	getIdforradom=function(){
		var myDate=new Date();
		rid="1"+myDate.getSeconds().toString()+myDate.getMilliseconds().toString();
	},
	*/
	/*
	 * Delete Page elements According to rid 
	 
	delParamPChild=function(rid){
		$('#add'+rid).remove();
	},
	*/
	/*
	 * Get Goods Type for select elements
	 
	findGoodsTypeTNForSelect=function(){
		$.ajax({
			url:"findGoodsTypeTNForSelect.action",
			type:"post",
			dataType:'json',
			async:false,
			success:function(data){
			if(data.goodstypetnlist!=""){
				$('#goodstypetn').append(data.goodstypetnlist);
				}
			}
		});
	},
	*/
	/**
	 * 根据商品类型绑定属性并显示
	
	findGoodsAttributeTByGoodsTypeName=function(goodsTypeName){
		//这里需要绑定商品类型。有待商榷
		$.ajax({
			url:"findGoodsAttributeTByGoodsTypeName.action",
			type:"post",
			data:{"goodsTypeName":goodsTypeName},
			dataType:'json',
			async:false,
			success:function(data){
				if(data.beanlist.length>0){
					var html="";
					var rid="";
					$.each(data.beanlist,function(n,value){
						if(value.attributeType=="1"){
							rid=value.goodsattributeid;
							html+="<tr id='add"+rid+"'>" +
							"<td class='title'><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute' id='paramlistname"+rid+"' name='paramlistname"+rid+"' value='"+value.goodsattributename+"'/></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><select class='attribute' id='attributetype"+rid+"' name='attributetype"+rid+"'><option value='0'>筛选项</option></select></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='medium' id='attributelists"+rid+"' name='attributelists"+rid+"' value='"+value.attributelist+"'></input></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute small' id='paramlistsort"+rid+"' name='paramlistsort"+rid+"' value='"+value.sort+"'/></div></div></div></div></td>"+
							"<input type='hidden' class='attribute' id='paramattributeid' name='paramattributeid' value='"+value.goodsattributeid+"'></input>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input  class='attribute btn btn-success' id='delbutton"+rid+"' name='delbutton"+rid+"' type='button' value='删除' onClick='delParamPChild("+rid+")' style='display:'';' /></div></div></div></div></td>"+
							"</tr>";
						}else{
							rid=value.goodsattributeid;
							html+="<tr id='add"+rid+"'>" +
							"<td class='title'><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute' id='paramlistname"+rid+"' name='paramlistname"+rid+"' value='"+value.goodsattributename+"'/></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><select class='attribute' id='attributetype"+rid+"' name='attributetype"+rid+"'><option value='0' selected>筛选项</option></select></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute' id='attributelists"+rid+"' name='attributelists"+rid+"' value='"+value.attributelist+"'></input></div></div></div></div></td>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute small' id='paramlistsort"+rid+"' name='paramlistsort"+rid+"' value='"+value.sort+"'/></div></div></div></div></td>"+
							"<input type='hidden' class='attribute' id='paramattributeid' name='paramattributeid' value='"+value.goodsattributeid+"'></input>"+
							"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input  class='attribute btn btn-success' id='delbutton"+rid+"' name='delbutton"+rid+"' type='button' value='删除' onClick='delParamPChild("+rid+")' style='display:'';' /></div></div></div></div></td>"+
							"</tr>";
						}
					});
					var gtid=data.beanlist[0].goodsTypeId;
					$('#goodstypetn').val(gtid);
					$('.table tbody').empty().append(html);
				}
			}
		});
		//显示修改按钮
		$('#updateattrs').show();
		//隐藏增加按钮
		$('#submitattrs').hide();
	},
	 */
	/**
	 * 选择商品类型后加载已经有的属性
	 
	$('#goodstypetn').change(function(){
		var goodsTypeName=$('#goodstypetn').find("option:selected").text();
		//这里需要先读取商品类型下已经有的属性并注入到页面中
		findGoodsAttributeTByGoodsTypeName(goodsTypeName);
	});
	*/
	/**
	 * 增加属性列表
	 
	$('#addattrs').click(function(){
		var goodstypetn=$('#goodstypetn').val();
		if(goodstypetn=="0"){
			formwarning("#alerterror","请选择商品类型");
			return false;
		}
		getIdforradom();
		var html="<tr id='add"+rid+"'>" +
				"<td class='title'><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute' id='paramlistname"+rid+"' name='paramlistname"+rid+"' type='text'/></div></div></div></div></td>"+
				"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><select class='attribute' id='attributetype"+rid+"' name='attributetype"+rid+"'><option value='0'>筛选项</option></select></div></div></div></div></td>"+
				"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute' id='attributelists"+rid+"' name='attributelists"+rid+"'  type='text'></input></div></div></div></div></td>"+
				"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input class='attribute small' id='paramlistsort"+rid+"' name='paramlistsort"+rid+"' type='text' /></div></div></div></div></td>"+
				"<td><div class='form'><div class='fields'><div class='field field-first'><div class='typeinput'><input  class='attribute btn btn-success' id='delbutton"+rid+"' name='delbutton"+rid+"' type='button' value='删除' onClick='delParamPChild("+rid+")'/></div></div></div></div></td>"+
				"</tr>";
		$('.table tbody').append(html);
	});
	

	checkGoodsAttributeForm=function(){
		var check=true;
		var paramlistname="paramlistname";
		var attributelists="attributelists";
		var paramlistsort="paramlistsort";
		var paramattributeid="paramattributeid";
		$(".attribute").each(function(){
				if(this.name.substring(0,13)==paramlistname){
					if(this.value==""){
						formwarning("#alerterror","商品属性名称必须填写");
						check=false;
					}else{
						var str = this.value;
						var reg = /[\-\[\{\}\]:"]+/;
						if((result = reg.exec(str)) !=null){
							formwarning("#alerterror",'商品属性名称有非法字符"[","]","{","}",":","-"');
							check=false;
						}
					}
					
				}
				if(this.name.substring(0,14)==attributelists){
					if(this.value==""){
						formwarning("#alerterror",'商品可选项必须填写');
						check=false;
					}else {
						var str = this.value;
						var reg = /[\-\[\{\}\]:"]+/;
						if((result = reg.exec(str)) !=null){
							formwarning("#alerterror",'商品属性名称有非法字符"[","]","{","}",":","-"');
							check=false;
						}
					}
				}
				if(this.name.substring(0,13)==paramlistsort){
					if(this.value==""){
						formwarning("#alerterror",'商品属性排序必须填写');
						check=false;
					}else{
						var str = this.value;
						var reg = /\D/;
						if((result = reg.exec(str)) !=null){
							formwarning("#alerterror",'商品属性排序只能是数字');
							check=false;
						}
					}
				}
				if(this.name.substring(0,16)==paramattributeid){
					if(this.value==""){
						formwarning("#alerterror",'商品属性ID异常');
						check=false;
					}
				}
		});
		return check;
	},
	
	getGoodsAttributeT=function(){
		var goodstypetn=$('#goodstypetn').val();
		if(goodstypetn=="0"){
			formwarning("#alerterror","请选择商品类型");
			return false;
		}
		var goodsTypeId=$('#goodstypetn').val();
		var goodsTypeName=$('#goodstypetn').find("option:selected").text();
		var paramlistname="paramlistname";
		var attributetype="attributetype";
		var attributelists="attributelists";
		var paramlistsort="paramlistsort";
		var paramattributeid="paramattributeid";
		var delbutton="delbutton";
		var goodsattributename="";
		var attributeType="";
		var attributelist="";
		var goodsattributeid="";
		var sort="";
		var attributeIndex=1;
		var sub="";
		var rjson="";
		if(checkGoodsAttributeForm()){
			$(".attribute").each(function(){
				if(this.name.substring(0,13)==paramlistname){
					goodsattributename=this.value;
				}
				if(this.name.substring(0,13)==attributetype){
					attributeType=this.value;
				}
				if(this.name.substring(0,14)==attributelists){
					attributelist=this.value;
				}
				if(this.name.substring(0,13)==paramlistsort){
					sort=this.value;
				}
				if(this.name.substring(0,16)==paramattributeid){
					goodsattributeid=this.value;
				}
				if(this.name.substring(0,9)==delbutton){
						sub+="{\"goodsattributename\":\""+goodsattributename+"\",\"attributeType\":\""+attributeType+"\",\"attributelist\":\""+attributelist+"\",\"sort\":\""+sort+"\",\"goodsattributeid\":\""+goodsattributeid+"\"},";
						goodsattributename="";
						attributeType="";
						attributelist="";
						goodsattributeid="";
						sort="";
				}
			});
			rjson="["+sub.toString().substring(0, sub.length-1)+"]";
			$.post("updateGoodsAttributeT.action",{"rjson":rjson,"goodsTypeId":goodsTypeId,"goodsTypeName":goodsTypeName,"attributeIndex":attributeIndex},function(data){
				if(data.sucflag){
					sucflag=true;
					window.location.href="goodsattributement.jsp?operate=find&folder=goods";
				}else{
					sucflag=false;
					this.disabled="";
				}
			});
		}
	
			
	
	},
	*/
});
/*===========================================Gorgeous split-line==============================================*/
$(function(){
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if (operate == "add") {
		initTableRow();
        initEvent();
	}else if(operate=="edit"){
		addTableRowNum(1);
        initEvent();		
	}
});