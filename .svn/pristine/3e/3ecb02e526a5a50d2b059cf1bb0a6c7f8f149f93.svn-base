$(function() {
	
	var defaultUrl = "/page/portal/productCategory";
	/**
	 * 增加产品分类
	 */
	saveGoodsCategory = function(){
		
		
		//产品分类名称不能为空						
		var name = $("#name").val();
		if(name == ""){
			formwarning("#alerterror", "请输入产品分类名称");
			return false;
		}
		
		//产品分类编号不能为空						
		var categoryCode = $("#categoryCode").val();
		if(categoryCode == ""){
			formwarning("#alerterror", "请输入产品分类编号");
			return false;
		}
		
		//dwr产品分类
		GoodsCategoryAction.addGoodsCategory(
			{
				id:$("#id").val(),
				name:$("#name").val(),
				categoryCode:$("#categoryCode").val(),
				moreParentCategory:$("#moreParentCategory").val(),
				grade:$("#grade").val(),
				metaDes:$("#metaDes").val(),
				parentId:$("#parentId").val(),
				sort:$("#sort").val(),
				picHref:$("#picHref").val(),
				path:$("#path").val(),
				enabled:$("#enabled").is(":checked") ? 1 : 0,
				recommended:$("#recommended").is(":checked") ? 1 : 0,
				scroll:$("#scroll").is(":checked") ? 1 : 0,
				url:($("input[name='url_mark']:checked").val()==1)?defaultUrl:$("#url").val()
			},
			function(data){
				if(data){
					//跳转到产品分类列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/goodsCategoryList.jsp";
				}else{
					alert("创建失败");
				}
			}
		);
	},
	

	/**
	 * 更新产品分类
	 */
	updateGoodsCategory = function(){
		
		//产品分类名称不能为空						
		var name = $("#name").val();
		if(name == ""){
			formwarning("#alerterror", "请输入产品分类名称");
			return false;
		}
		
		//产品分类编号不能为空						
		var categoryCode = $("#categoryCode").val();
		if(categoryCode == ""){
			formwarning("#alerterror", "请输入产品分类编号");
			return false;
		}
		
		//dwr修改产品分类
		GoodsCategoryAction.updateGoodsCategory(
			{
				id:$("#id").val(),
				grade:$("#grade").val(),
				name:$("#name").val(),
				categoryCode:$("#categoryCode").val(),
				moreParentCategory:$("#moreParentCategory").val(),
				metaDes:$("#metaDes").val(),
				parentId:$("#parentId").val(),
				sort:$("#sort").val(),
				picHref:$("#picHref").val(),
				//metaKeywords:$("#metaKeywords").val(),
				//metaDes:$("#metaDes").val(),
				//logo:$("#logo").val(),
				path:$("#path").val(),
				enabled:$("#enabled").is(":checked") ? 1 : 0,
				recommended:$("#recommended").is(":checked") ? 1 : 0,
				scroll:$("#scroll").is(":checked") ? 1 : 0,
				url:($("input[name='url_mark']:checked").val()==1)?defaultUrl:$("#url").val()
			},
			function(data){
				if(data){
					//跳转到产品分类列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/goodsCategoryList.jsp";
				}else{
					alert("修改失败");
				}
			}
		);
	},
	
	//按钮“提交”事件
	$("#submit").click(function(){
		saveGoodsCategory();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		updateGoodsCategory();
	});
	
	$("#contentp").load(webRoot + "/page/ttw/manage/goods/selectCategory.jsp");
	
	//选择更多父分类
	$("#selectCategoryBtn").click(function(){
		$("#selectCategoryModal").modal({
			keyboard:true,
			show:true
		});
		
		//“确认删除”按钮事件
		$("#selectCategoryBtnOk").click(function(){
			var nameArr = $(".trSelected td:nth-child(2) div", $('#selectCategorylist'));
			var parentCategoryVals = "";
			$('.trSelected', $('#selectCategorylist')).each(function(index, ele){
				if(parentCategoryVals == ""){
					parentCategoryVals += this.id.substr(3) + "#" + nameArr[index].innerHTML;
				}else{
					parentCategoryVals += "," + this.id.substr(3) + "#" + nameArr[index].innerHTML;
				}
			});
			//更多父分类名称
			var names = "";
			$(".trSelected td:nth-child(2) div", $('#selectCategorylist')).each(function(){
				if(names == ""){
					names += this.innerHTML;
				}else{
					names += "," +this.innerHTML;
				}
			});
			
			
			$('#moreParentCategoryView').val(names);
			
			$('#moreParentCategory').val(parentCategoryVals);
			
			$("#selectCategoryModal").modal('hide');
			//$('#goodscategorylist').flexReload();
			//forminfo("#alertinfo", "删除品牌成功");
		});
		//关闭“删除提示框”
		$("#selectCategoryBtnClose").click(function(){
			$("#selectCategoryModal").modal('hide');
		});
	});
	
	
	//根据goodsCategoryId查询产品分类
	var findGoodsCategoryIdById = function(){
		var goodsCategoryId = getUrlParam('goodsCategoryId');
		if(isNotEmpty(goodsCategoryId)){
			GoodsCategoryAction.getGoodsCategory({id:goodsCategoryId},function(data){
        		if(data && data.result){
        			var vo = data.result;
        			
        			$("#id").val(vo.id);
					$("#name").val(vo.name);
					$("#categoryCode").val(vo.categoryCode);
					$("#grade").val(vo.grade);
					$("#metaDes").val(vo.metaDes);
					$("#sort").val(vo.sort);
					$("#url").val(vo.url);
					$("#picHref").val(vo.picHref);
					var moreParentCategoryList = vo.moreParentCategoryList;
					if(moreParentCategoryList){
						var moreParentCategory = "";
						var names = "";
						for(var i=0; i< moreParentCategoryList.length; i++){
							if(names == ""){
								names += moreParentCategoryList[i].parentCategoryName;
								moreParentCategory += moreParentCategoryList[i].parentCategoryId + "#" + moreParentCategoryList[i].parentCategoryName;
							}else{
								names += "," + moreParentCategoryList[i].parentCategoryName;
								moreParentCategory += "," + moreParentCategoryList[i].parentCategoryId + "#" + moreParentCategoryList[i].parentCategoryName;
							}
						}
						
						$("#moreParentCategoryView").val(names);
						
						$("#moreParentCategory").val(moreParentCategory);
					}
					
					
					//是否可用
        			if("1" == vo.enabled){
						$("input[name='enabled']").get(0).checked=true;
					}else{
						$("input[name='enabled']").get(1).checked=true;
					}
					
					//是否推荐
        			if("1" == vo.recommended){
						$("input[name='recommended']").get(0).checked=true;
					}else{
						$("input[name='recommended']").get(1).checked=true;
					}
					
					//是否首页滚动
        			if("1" == vo.scroll){
						$("input[name='scroll']").get(0).checked=true;
					}else{
						$("input[name='scroll']").get(1).checked=true;
					}
					
					//
					$("#parentId").val(vo.parentId);
					
					loadParentGoodsCategory(vo.grade ? parseInt(vo.grade) : 1, vo.parentId);
        		}
        	});
        	
        	//加载附件图片
        	loadFileSotreFun(goodsCategoryId, "goodsCategoryImg", "triggers");
        	
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
        }
	}
	
	
	
	//加载父分类下拉框
	var loadParentGoodsCategory = function(num, defaultVal){
		GoodsCategoryAction.getParentGoodsCategory(
			{
				id:defaultVal
			},
			function(data){
				if(data){
					var results = data.result;
					var vo = data.vo;
					var parentSelectHtml = '<select class="form-control categoryParent" id="parentId' + num + '">';
					
					if(vo.parentId == ''){
						parentSelectHtml += '<option value="">根分类</option>';
					}
					
					if(results && results.length > 0){
						for(var i = 0; i< results.length; i++){
							parentSelectHtml += '<option value="'+results[i].id+'">'+results[i].name+'</option>';
						}
					}
					
					parentSelectHtml += '</select>';
					
					$('#goodsCategoryDiv').prepend(parentSelectHtml);
					
					$('#parentId'+num).val(defaultVal);
					
					if(defaultVal != ''){
						var defaultPathVal = $('#path').val();
						if(defaultPathVal != ''){
							defaultPathVal = vo.name + ',' + defaultPathVal; 
						}else{
							defaultPathVal = vo.name;
						}
						$('#path').val(defaultPathVal);
					}
					
					$('#parentId'+num).bind('change', function(){
						//选择“--请选择--”时不加入值
						//if($(this).val() != ''){
							$('#parentId').val($(this).val());
							$('#grade').val(($(this).val()==''?"":num));
							
							var path = "";
							for(var i = num; i >= 1; i--){
								if(path == ''){
									path = $('#parentId'+i+' option:selected').text();
								}else{
									path = $('#parentId'+i+' option:selected').text()+"," + path;
								}
							}
							$('#path').val(path);
							$('#parentId' + (num+1)).remove();								
							
							loadChildGoodsCategory(num+1,$(this).val());
						//}
					});
					
					if(num > 1 && vo.parentId != ''){
						loadParentGoodsCategory(num-1, vo.parentId);
					}
				}else{
					alert("加载父分类失败");
				}
			}
		);
	}
	
	loadChildGoodsCategory = function(num, categoryVal){
		GoodsCategoryAction.getChildGoodsCategory(
			{
				id:categoryVal
			},
			function(data){
				if(data){
					var results = data.result;
					var vo = data.vo;
					
					var parentSelectHtml = '<select class="form-control categoryParent" id="parentId' + num + '">';
					
					if(vo.parentId == ''){
						parentSelectHtml += '<option value="">根分类</option>';
					}else{
						parentSelectHtml += '<option value="">--请选择--</option>';
					}
					
					if(results && results.length > 0){
						for(var i = 0; i< results.length; i++){
							parentSelectHtml += '<option value="'+results[i].id+'">'+results[i].name+'</option>';
						}
					}else{
						return;
					}
					parentSelectHtml += '</select>';
					
					
					$('#goodsCategoryDiv').append(parentSelectHtml);
					
					$('#parentId'+num).bind('change', function(){
						//选择“--请选择--”时不加入值
						if($(this).val() != ''){
							$('#parentId').val($(this).val());
							$('#grade').val(num);

							var path = "";
							for(var i = num; i >= 1; i--){
								if(path == ''){
									path = $('#parentId'+i+' option:selected').text();
								}else{
									path = $('#parentId'+i+' option:selected').text()+"," + path;
								}
							}
							$('#path').val(path);
							
							$('#parentId' + (num+1)).remove();
							loadChildGoodsCategory(num+1, $(this).val());
						}
					});
				}else{
					alert("加载父分类失败");
				}
			}
		);
	}
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//绑定产品分类数据
		findGoodsCategoryIdById();
		
	}else if(operate=="add"){
	
		loadParentGoodsCategory(1, '');
	
	}
	
	$("input[name='url_mark']").change(function(){
		if(this.value == 1){
			$("#url_wrap").hide();
		}else{
			$("#url_wrap").show();
		}
	});
});

