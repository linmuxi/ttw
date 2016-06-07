$(function() {
	/**
	 * 获取产品属性值
	 */
	getgoodsAttrVals = function(goodsTypeId){
		var goodsAttrsVals = "";
		if(goodsTypeId != ""){
			$("select[name='goodsAttrVal']").each(function(){
				goodsAttrsVals += this.value + ",";
			});
		}
		goodsAttrsVals = goodsAttrsVals.toString().substring(0, goodsAttrsVals.length-1);
		return goodsAttrsVals;	
	},
	
	/**
	 * 增加产品
	 */
	saveGoods = function(){
		//产品分类
		var goodsCategoryNameVal = $("#goodsCategoryId option:selected").text() == '--请选择--' 
										? '' : $("#goodsCategoryId option:selected").text();
		//品牌
		var brandNameVal = $("#brandId option:selected").text() == '--请选择--' 
								? '' : $("#brandId option:selected").text() ;
		//产品分类不能为空						
		if(goodsCategoryNameVal == ""){
			formwarning("#alerterror", "请选择产品分类");
			return false;
		}
		
		$("body").mask("处理中...");
		//dwr新增产品
		GoodsAction.addGoods(
			{
				id:$("#id").val(),
				goodsName:$("#goodsName").val(),
				goodsCategoryId:$("#goodsCategoryId").val(),
				goodsCategoryName:goodsCategoryNameVal,
				brandId:$("#brandId").val(),
				brandName:brandNameVal,
				pictureUrl:$('#pictureUrl').val(),
				cost:$("#cost").val(),
				price:$("#price").val(),
				memberPrice:$("#memberPrice").val(),
				quantity:$("#quantity").val(),
				unitName:$("#unitName").val(),
				isNew:$("#isNew").is(":checked") ? 1 : 0,
				recommended:$("#recommended").is(":checked") ? 1 : 0,
				hotsSale:$("#hotsSale").is(":checked") ? 1 : 0,
				//isSpecificationsOpen:$("#isSpecificationsOpen").is(":checked") ? 1 : 0,
				intro:$('#intro').val(),
				sort:$("#sort").val(),
				keywordName:$("#keywordName").val(),
				goodsAttrsVals:getgoodsAttrVals($("#goodsCategoryId").val())
			},
			function(data){
				if(data){
					//跳转到产品列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/goodsList.jsp";
				}else{
					lhgdialog.alert("新增产品失败");
				}
				$("body").unmask();
			}
		);
	},
	

	/**
	 * 更新商品
	 */
	updateGoods = function(){
		//产品分类
		var goodsCategoryNameVal = $("#goodsCategoryId option:selected").text() == '--请选择--' 
										? '' : $("#goodsCategoryId option:selected").text();
		//品牌
		var brandNameVal = $("#brandId option:selected").text() == '--请选择--' 
								? '' : $("#brandId option:selected").text() ;
								
		//产品分类不能为空			
		if(goodsCategoryNameVal == ""){
			formwarning("#alerterror", "请选择产品分类");
			return false;
		}
		//dwr修改产品
		GoodsAction.updateGoods(
			{
				id:$("#id").val(),
				goodsName:$("#goodsName").val(),
				goodsCategoryId:$("#goodsCategoryId").val(),
				goodsCategoryName:goodsCategoryNameVal,
				brandId:$("#brandId").val(),
				brandName:brandNameVal,
				pictureUrl:$('#pictureUrl').val(),
				cost:$("#cost").val(),
				price:$("#price").val(),
				memberPrice:$("#memberPrice").val(),
				quantity:$("#quantity").val(),
				unitName:$("#unitName").val(),
				isNew:$("#isNew").is(":checked") ? 1 : 0,
				recommended:$("#recommended").is(":checked") ? 1 : 0,
				hotsSale:$("#hotsSale").is(":checked") ? 1 : 0,
				//isSpecificationsOpen:$("#isSpecificationsOpen").is(":checked") ? 1 : 0,
				intro:$('#intro').val(),
				sort:$("#sort").val(),
				keywordName:$("#keywordName").val(),
				goodsAttrsVals:getgoodsAttrVals($("#goodsCategoryId").val())
			},
			function(data){
				if(data){
					//跳转到产品列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/goodsList.jsp";
				}else{
					lhgdialog.alert("修改产品失败");
				}
			}
		);
	},
	
	//按钮“提交”事件
	$("#submit").click(function(){
		saveGoods();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		updateGoods();
	});
	
	
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
					lhgdialog.alert("加载失败");
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
					lhgdialog.alert("加载失败");
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
				
				var viewAttr = "";
				//if(operate=="editprice" || operate=="view"){
					//编辑可以修改商品属性
				//}else 
				if(operate=="editprice" || operate=="view"){
					viewAttr = " disabled='disabled' style='background-color: #eeeeee;' ";
				}
				
				gathtml += "<div class='form-inline'>"
						+ "<span class='label label-required'>"
						+ item.goodsAttributeName + "</span>"
						+ "<select id='goodsAttrVal" + i
						+ "' name='goodsAttrVal' "+viewAttr+">" + option
						+ "</select>" + "</div>";
				option = "";
			});
			$('#gat').append(gathtmlheader).append(gathtml).append(gathtmlfooter).show();
		}
	}
	
	//根据goodsId查询产品
	var findGoodsById = function(){
		var goodsId = getUrlParam('goodsId');
		if(isNotEmpty(goodsId)){
			GoodsAction.getGoods({id:goodsId},function(data){
        		if(data && data.result){
        			var vo = data.result;
        			
        			$("#id").val(goodsId);
        			$("#goodsName").val(vo.goodsName ? vo.goodsName : '');
        			$("#goodsCategoryId").val(vo.goodsCategoryId ? vo.goodsCategoryId : '');
        			$("#brandId").val(vo.brandId ? vo.brandId : '');
        			$("#pictureUrl").val(vo.pictureUrl ? vo.pictureUrl : '');
        			//alert(vo.pictureUrl);
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
        			//是否热销产品
        			if("1" == vo.recommended){
						$("input[name='recommended']").get(0).checked=true;
					}else{
						$("input[name='recommended']").get(1).checked=true;
					}
        			//是否推荐
        			if("1" == vo.hotsSale){
						$("input[name='hotsSale']").get(0).checked=true;
					}else{
						$("input[name='hotsSale']").get(1).checked=true;
					}
					
        			$("#sort").val(vo.sort ? vo.sort : '');
        			$("#keywordName").val(vo.keywordName ? vo.keywordName : '');
        			
        			//商品介绍  富文本编辑器
        			if(operate=="edit"){
        				KE.html("intro", vo.intro ? vo.intro : '');
        			}else{
        				$('#intro').val(vo.intro ? vo.intro : '');
        				$('#introView').html(vo.intro ? vo.intro : '');
        			}
        			
        			
        			
					
					var attrList = data.attrList;
					//初始化产品属性
        			initGoodsAttribute(attrList);
        		}
        		
        	});
        	
			//加载附件图片
        	loadFileSotreFun(goodsId, "goodsImg", "triggers");
        	
        	loadGoodsFileInfo("uploadFileTriggers", goodsId, "goodsFileInfo");
        	
        	_loadApproveRecord(goodsId);
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
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
	
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if (operate == "add") {
		//加载分类下拉框选项
		initCategory();
		
		//加载品牌下拉框选项
		initBrand();
	
	}else if(operate=="edit" || operate=="editprice" || operate=="view"){
		//支持同步调用
		dwr.engine.setAsync(false);
		
		//加载分类下拉框选项
		initCategory();
		
		//加载品牌下拉框选项
		initBrand();
		
		//dwr调用
		dwr.engine.setAsync(true);
		
		//绑定产品数据             ps:不能放在  同步调用里面，否则ckeditor加载不出数据
		findGoodsById();
	}
	
	//加载审批记录
	function _loadApproveRecord(id){
		if(operate=="view"){
			var key = "com.phly.ttw.manage.goods.service.GoodsService;/page/ttw/manage/goods/goodsDetail.jsp;"+id;
			ActivitiAction.queryCommentByBkey({businessKey:key},function(data){
				var list = "";
				if(data && data.length>0){
					$(data).each(function(){
						list += "<div class='row'>"+
									"<div class='cell'>"+this.time+"</div>"+
									"<div class='cell'>"+this.message+"</div>"+
								"</div>";
					});
				}
				$(".approve-record-table").append(list);
			});
			
			$("#open_approve_record_id").click(function(){
		    	reg_layer_idx = layer.open({
				    type: 1,
				    title:"审批记录",
				    area: ['500px', '400px'], //宽高
				    shift: 1,
				    shadeClose: false, //开启遮罩关闭
				    content: $(".approve-record-table")
				});
			});
		}	
	}
	
	
	
	
});

