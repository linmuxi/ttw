$(function() {
	
	/**
	 * 获取产品属性值
	 */
	var getgoodsAttrVals = function(goodsTypeId){
		var goodsAttrsVals = "";
		if(goodsTypeId != ""){
			$("select[name='goodsAttrVal']").each(function(){
				goodsAttrsVals += this.value + ",";
			});
		}
		goodsAttrsVals = goodsAttrsVals.toString().substring(0, goodsAttrsVals.length-1);
		return goodsAttrsVals;	
	}
	
	//初始化 产品分类下拉框
	var initCategory = function(){
		GoodsAction.initGoodsCategory(
			{},
			function(data){
				if(data){
					var html = "";
					for(var i=0; i<data.CATEGORY.length; i++){
						var gategoryObj = data.CATEGORY[i];
						var grade = gategoryObj.grade;
						var nameStartChar = "";
						
						if(grade != ""){
							var gradeNum = parseInt(grade);
							for(var j=0; j<gradeNum; j++){
								
								nameStartChar += "　";
								
								if(j == (gradeNum - 1)){
									nameStartChar += " └";
								}
							}
						}
						
						html += "<option value=\""+gategoryObj.id+"\">";
						html += nameStartChar + gategoryObj.name;
						html += "</option>";
					}
					$('#goodsCategoryId').append(html);
				}else{
					alert("加载失败");
				}
			}
		);
	}
	
	//初始化 品牌下拉框
	var initBrand = function(){
		GoodsAction.initBrand(
			{},
			function(data){
				if(data){
					var html = "";
					for(var i=0; i<data.BRAND.length; i++){
						var brandObj = data.BRAND[i];
						html += "<option value=\""+brandObj.id+"\">";
						html += brandObj.brandName;
						html += "</option>";
					}
					$('#brandId').append(html);
				}else{
					alert("加载失败");
				}
			}
		);
	}
	
	//根据数据初始化产品属性
	var initGoodsAttribute = function(rows){
		$('#gat').text("");
		var gathtmlheader="<div class='well'><h4>商品属性选择区域</h4></div>";
		var gathtml = "";
		var gathtmlfooter="</div>";
		var option = "";
		var attributelist = new Array();
		var length;
		if (rows != null) {
			$.each(rows, function(i, item) {
				var attrDefId = item.id;
				var attrVal = item.attrVal;
				attributelist = item.attributeList.split(",");
				
				length = attributelist.length;
				option = "<option value='0'>---请选择---</option>";
				for (var j = 0; j <length; j++) {
					var selected = "";
					if(attrVal == attributelist[j]){
						selected = " selected ";
					}
					var attrItemVal = attributelist[j];
					option += "<option value='" + attrDefId + "#" + attrItemVal + "' "+selected+" >" + attributelist[j] + "</option>";
				}
				gathtml += "<div class='form-inline'>"
						+ "<span class='label label-required'>"
						+ item.goodsAttributeName + "</span>"
						+ "<select id='goodsAttrVal" + i
						+ "' name='goodsAttrVal' disabled='disabled'>" + option
						+ "</select>" + "</div>";
				option = "";
			});
			$('#gat').append(gathtmlheader).append(gathtml).append(gathtmlfooter).show();
		}
	}
	
	//根据goodsId查询产品
	var findGoodsById = function(){
		var goodsId = getUrlParam('id');
		if(isNotEmpty(goodsId)){
			GoodsAction.getGoods({id:goodsId},function(data){
        		if(data && data.result){
        			var vo = data.result;
        			
        			$("#id").val(goodsId);
        			$("#goodsName").val(vo.goodsName ? vo.goodsName : '');
        			$("#goodsCategoryId").val(vo.goodsCategoryId ? vo.goodsCategoryId : '');
        			$("#brandId").val(vo.brandId ? vo.brandId : '');
        			$("#cost").val(vo.cost ? vo.cost : '');
        			$("#price").val(vo.price ? vo.price : '');
        			$("#memberPrice").val(vo.memberPrice ? vo.memberPrice : '');
        			$("#quantity").val(vo.quantity ? vo.quantity : '');
        			$("#unitName").val(vo.unitName ? vo.unitName : '');
        			//是否新品
        			if("1" == vo.isNew){
						$("input[name='isNew']").get(0).checked=true;
					}else{
						$("input[name='isNew']").get(1).checked=true;
					} 
					//是否上架
        			if("1" == vo.isSpecificationsOpen){
						$("input[name='isSpecificationsOpen']").get(0).checked=true;
					}else{
						$("input[name='isSpecificationsOpen']").get(1).checked=true;
					}
        			$("#sort").val(vo.sort ? vo.sort : '');
        			$("#keywordName").val(vo.keywordName ? vo.keywordName : '');
        			
        			//商品介绍  富文本编辑器
        			//KE.html("intro", vo.intro ? vo.intro : '');
        			$('#introView').html(vo.intro ? vo.intro : '');
        			

        			
        			//获取产品品图片路径集合  附件
					var pcpath="";
					var pcurl = vo.pcurl + "";
					var htm="";
					var checkpc="";
					var temp = pcurl.split(',');
					var allpcpath="";
					$.each(temp,function(n,value){
						if(""==value){
							return;
						}
						var pcItem = value.split('#');
						if(pcItem.length == 2){
							pcpath=pcItem[1];
							pcid = pcItem[0];
							htm="<img id='"+pcid+"' src='"+webRoot+pcpath+"'></img>";
							checkpc="<input id='"+pcid+"' name='pcpath' type='checkbox' value='"+pcid+"' checked/>";
							allpcpath=htm+checkpc;
							$('#triggers').append(allpcpath);
						}
					});
					
					var attrList = data.attrList;
					//初始化产品属性
        			initGoodsAttribute(attrList);
        		}
        		
        	});
        }
	}
	
	//根据goodsTypeId查询产品属性
	var queryGoodsAttributeListByGoodsTypeId = function(goodsTypeId){
		GoodsAction.queryGoodsAttributeListByGoodsTypeId({goodsTypeId:goodsTypeId},function(data){
       		if(data){
       			var rows = data.rows;
       			//初始化产品属性
       			initGoodsAttribute(rows);
       		}
       	});
	}
	
	
	$('#goodsCategoryId').change(function(){
		//
		queryGoodsAttributeListByGoodsTypeId($(this).val());
	});
	
	
	//支持同步调用
	dwr.engine.setAsync(false);
	
	//加载分类下拉框选项
	initCategory();
	
	//加载品牌下拉框选项
	initBrand();
	
	//dwr调用
	dwr.engine.setAsync(true);
	
	//绑定产品数据        ps:不能放在  同步调用里面，否则ckeditor加载不出数据
	findGoodsById();
	
});

