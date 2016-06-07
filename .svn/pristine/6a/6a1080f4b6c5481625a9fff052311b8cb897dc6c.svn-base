/**
 * header js
 */

// 浏览器滚动监听事件
$(window).scroll(function(){
	var header_nav = $(".header-nav-wrap");
	if($(document).scrollTop() > 185){
		header_nav.addClass("header-nav-wrap-fixed");
	}else{		    		
		header_nav.removeClass("header-nav-wrap-fixed");
		header_nav.addClass("header-nav-wrap");
	}
});

// 自动适应头部导航菜单宽度
function _autoHeaderNavWidth(){
	var _nav = $(".header-nav-wrap");
    if(_nav.find("li").length >= 12){
    	_nav.find("nav").css("width",(_nav.find("li").length*100)-50+"px");
    };
};

//加载菜单数据
function loadMenuData(){
	//默认没有父节点(加载一级节点),没有子菜单
	var parentId = "",parentName = "",parentUrl = "",isHaveChild = 0,name="",url="";
	
	if(goodsCategoryId != '' && goodsCategoryId != "member_id" && goodsCategoryId != "home_id"){
		//根据产品类型id获取产品类型相关信息
		$.ajax({
			type:"POST",
			url:webRoot+"/page/front/home/getGoodsCategoryById",
			data:{id:goodsCategoryId},
			async:false,
			success:function(data){
				if(data && data.goodsCategory){
					var goodsCategory = data.goodsCategory;
					parentId = goodsCategory.parentId;
					parentName = goodsCategory.parentCategoryName;
					parentUrl = goodsCategory.parentCategoryUrl;
					isHaveChild = goodsCategory.isHaveChild;
					name = goodsCategory.name;
					url = goodsCategory.url;
				}
			}
		});	
	}
	
	//如果当前产品类型没有子类型,则根据当前产品类型的父类型id查询所有子产品类别
	var searchId = (isHaveChild == 0) ? parentId : goodsCategoryId;
	$.ajax({
	   type: "POST",
	   url: webRoot+"/page/portal/menu?parentId="+searchId,
	   success: function(data){
			if(data && data.menu){
				var menuList = data.menu;
			   	for(var i =0;i<menuList.length;i++){
			   		menuList[i].homeUrl = menuList[i].parentCategoryUrl;
			   	}
				
			   	//一级
				if(parentId == '' && isHaveChild == 0){
					menuList.push({
			   			id:"member_id",
			   			name:"会员中心",
			   			url:"/page/ttw/frontbg/member/center"
			   		});
					menuList = [{
			   			id:"home_id",
			   			name:"首页",
			   			url:"/page/front/home"
			   		}].concat(menuList);
				}
			   	//一级以下菜单添加当前层级home菜单
				else if(isHaveChild == 1){
					menuList = [{
			   			id:goodsCategoryId,
			   			name:name+"首页",
			   			url:url
			   		}].concat(menuList);
				}
			   	//点击一级以下菜单下的非home菜单,需要追加此home菜单
				else if(homeUrl != ''){
					menuList = [{
			   			id:parentId,
			   			name:parentName+"首页",
			   			url:homeUrl
			   		}].concat(menuList);					
				}
				
			   	//生成菜单html
		   		var html = template('headerNav', { list: menuList,search:"",contextPath: webRoot,selectedId:goodsCategoryId,iconHref:webRoot+"/page/front/home"});
		   		$(".header-nav-wrap").html(html);
				//自适应菜单宽度
		   		_autoHeaderNavWidth();
			}
	   }
	});
};

function addEvent(){
	$('#indexSearchBtn').bind('click', function(){
		var globalCategory = $('#globalCategory').val();
		globalCategory = globalCategory == '-1' ? '' : globalCategory;
		var globalSearchKey = $('#globalSearchKey').val();
		globalSearchKey = (globalSearchKey == ''? $("#defaultSearchKey").val():globalSearchKey);
		globalSearchKey = encodeURIComponent(encodeURIComponent(globalSearchKey));
		var url = webRoot + "/page/portal/productSearch?goodsCategoryId="+globalCategory+"&search="+globalSearchKey;
		window.location.href = url;
	});
};

function loadTopMenu(){
	$.ajax({
		   type: "POST",
		   url: webRoot+"/page/front/home/getTopMenu",
		   success: function(data){
			   if(data && data.topMenuList){
				   var _ul = $("nav.top-menu ul");
				   $(data.topMenuList).each(function(idx,data){
					   _ul.append('<li><a href="'+webRoot+data.defaultValue+'" title="'+data.defaultValue+'">'+data.defaultKey+'</a></li>');
				   });
			   }
		   }
	});
}

function loadGlobalSearchKey(){
	$.ajax({
		   type: "POST",
		   url: webRoot+"/page/front/queryGlobalSearchKey",
		   success: function(data){
			   if(data && data.globalSearchKey){
				   $("#defaultSearchKey").val(data.globalSearchKey);
				   $("#globalSearchKey").attr("placeholder",data.globalSearchKey);
			   }
		   }
	});
}


function loadGoodsTypeSelectList(){
	$.ajax({
		   type: "POST",
		   url: webRoot+"/page/front/home/getGoodsTypeSelectList",
		   success: function(data){
			   if(data && data.goodsTypeSelectList){
				   var gc = $("#globalCategory");
				  $(data.goodsTypeSelectList).each(function(){
					  if(this.id == goodsCategoryId){
						  gc.append('<option value="'+this.id+'" selected="selected">'+this.name+'</option>');						  
					  }else{
						  gc.append('<option value="'+this.id+'">'+this.name+'</option>');
					  }
				  });
			   }
		   }
	});
}


$(function(){
	//加载菜单数据
	loadMenuData();
	//加载顶部菜单数据
	loadTopMenu();
	loadGlobalSearchKey();
	loadGoodsTypeSelectList();
	addEvent();
});