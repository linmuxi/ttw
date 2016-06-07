$(function() {
	//按钮“删除所选图片”事件
	$("#delpc").click(function() {
		var str = "";
		var sum = 0;
		//获取选中的图片拼接id
		$(":checkbox[name='pcpath']").each(function() {
			if ($(this).attr("checked")) {
				sum++;
				str += this.id + ",";
			}
		});
		if (sum == 0) {
			alert('只有在选择图片后才能删除');
			return false;
		}
		//dwr批量删除图片
		FileStoreAction.delFileStore({id:str},function(data){
			if(data){
				var array = new Array();
				array = str.split(",");
				$(array).each(function(k, v) {
					$("#triggers img").remove("img[id=" + v + "]");
					$("#triggers input[name='pcpath']").remove("input[id=" + v + "]");
				});
				forminfo("#alertinfo", "删除图片成功");
			}
		});
		
	});
	
	
	
	/**
	 * 增加品牌
	 */
	saveBrand = function(){
		var brandName = $("#brandName").val();
		
		if(brandName == ""){
			formwarning("#alerterror", "请输入品牌名称");
			return false;
		}
		
		//dwr新增品牌
		BrandAction.addBrand(
			{
				id:$("#id").val(),
				brandName:$("#brandName").val(),
				intro:$("#intro").val(),
				sort:$("#sort").val(),
				url:$("#url").val(),
				enabled:$("#enabled").is(":checked") ? 1 : 0
			},
			function(data){
				if(data){
					//跳转到品牌列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/brandList.jsp";
				}else{
					alert("创建失败");
				}
			}
		);
	},
	

	/**
	 * 更新品牌
	 */
	updateBrand = function(){
		var brandName = $("#brandName").val();
		
		if(brandName == ""){
			formwarning("#alerterror", "请输入品牌名称");
			return false;
		}
		
		//dwr修改品牌
		BrandAction.updateBrand(
			{
				id:$("#id").val(),
				brandName:$("#brandName").val(),
				intro:$("#intro").val(),
				sort:$("#sort").val(),
				url:$("#url").val(),
				enabled:$("#enabled").is(":checked") ? 1 : 0
			},
			function(data){
				if(data){
					//跳转到品牌列表页面
					window.location.href = webRoot +"page/ttw/manage/goods/brandList.jsp";
				}else{
					alert("修改失败");
				}
			}
		);
	},
	
	//按钮“提交”事件
	$("#submit").click(function(){
		saveBrand();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		updateBrand();
	});
	
	
	//根据goodsId查询产品
	var findBrandById = function(){
		var brandId = getUrlParam('brandId');
		if(isNotEmpty(brandId)){
			BrandAction.getBrand({id:brandId},function(data){
        		if(data && data.result){
        			var vo = data.result;
        			
        			
        			$("#id").val(brandId);
        			$("#brandName").val(vo.brandName);
        			
        			$("#sort").val(vo.sort);
        			$("#url").val(vo.url);
        			
        			//品牌介绍  富文本编辑器
        			KE.html("intro", vo.intro ? vo.intro : '');
        			
        			//是否可用
        			if("1" == vo.enabled){
						$("input[name='enabled']").get(0).checked=true;
					}else{
						$("input[name='enabled']").get(1).checked=true;
					}
        			
        			
        			//获取产品品图片路径集合  附件
					var pcpath="";
					var pcurl = vo.logoPath + "";
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
        		}
        	});
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
        }
	}
	
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//绑定产品数据
		findBrandById();
	}
});

