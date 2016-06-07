/**
 * 首页 js
 */

$(function() {
	//清除banner节点选中状态
	function _clearUnsliderJumpSelected(className){
		$(className).find("a").each(function(){
			$(this).removeClass("selected");
		});
	}
	
    var home = function(opts){
		this.options = $.extend(true, {},opts);
		this._init.call(this);
    }
    
    home.prototype = {
		constructor:home,
		_init:function(){
			//初始化首页推荐banner
			this._initRecommandBanner();
			//加载平面设计、建站营销、项目案例、广告数据 --  考虑性能这里可以在鼠标滚动的时候动态加载。
			this._loadContentData();
			//绑定事件
			this._bindEvent();
		},
		_bindEvent:function(){
			//绑定产品类型更多查询
			$(".more").click(function(){
				var _this = $(this);
				//跳转到产品类别页面
				forward(_this.attr("data-goodscategory-url")+"?goodsCategoryId="+_this.attr("data-goodscategory-id"));
			});
		},
		_initRecommandBanner:function(){
			//初始化首页推荐banner
			unslider01 = $('#unslider-01').unslider({
				dots: true,
				complete:function(obj,targetObj){
					var _id = targetObj.attr("id");
					//清除jump选中样式
					_clearUnsliderJumpSelected(".unslider01-jump");
					$(".unslider01-jump-"+_id.substr(_id.length-2,_id.length)).addClass("selected");
				}
		    }).data('unslider');
			
			//生成切换节点
		    $("#recommand_image_list").find("li").each(function(idx){
		    	var _id = this.id.substr(this.id.length-2,this.id.length);
		    	$(".unslider01-jump").append("<a href='javascript:void(0);' class='unslider01-jump-"+_id+(idx==0?" selected":"")+"'></a>");
		    });
			
			//绑定banner节点切换事件
			$(".unslider01-jump").find("a").click(function(idx){
				var _className = this.className;
				unslider01["to"]((parseInt(_className.substr(_className.length-2,_className.length))-1));
			});
			
			//绑定banner左右滑动事件
			$('.unslider-arrow01').click(function() {
		        var fn = this.className.split(' ')[1];
		        unslider01[fn]();
		    });
			
		},
		_ajaxGoodsCategoryInfo:function(opts){
			//异步请求产品类型信息
			$.ajax({
			   type: "POST",
			   url: webRoot+"/page/front/home/queryGoodsCategoryInfo",
			   data:opts.data,
			   success: function(data){
				   if(data && data.goodsCategoryInfo){
					   //设置产品类型背景图
					   $(opts.picTarget).css("background","url("+webRoot+data.goodsCategoryInfo.pcurl+") no-repeat scroll 0 0 / 100% 100%").
						   click(function(){
							   forward(data.goodsCategoryInfo.picHref);
						   });
					   var gcList = data.goodsCategoryInfo.childGoodsCategoryList;
					   var cellList = "";
					   for(var i = 0;i<gcList.length;i++){
							if(i+1 > opts.maxSize){
								//生成的子类型个数不能大于指定的
							 	break;
							}
							cellList += "<div class='cell'><a href='"+webRoot+gcList[i].url+"?goodsCategoryId="+gcList[i].id+"' title='"+gcList[i].name+"'>"+gcList[i].name+"</a></div>";
					   }
					   //添加子产品类型
					   $(opts.listTarget).append(cellList);
					   
					   //设置产品类型ID和跳转URL
					   $(opts.goodsCategoryId).attr({
						   "data-goodscategory-id":data.goodsCategoryInfo.id,
						   "data-goodscategory-url":data.goodsCategoryInfo.url
					   });
					   
				   }
			   }
			});
		},
		_ajaxBannerList:function(opts){
			//异步请求首页显示的banner信息
			var _self = this;
			$.ajax({
			   type: "POST",
			   url: webRoot+"/page/front/queryBanner",
			   data:opts.data,
			   success: function(data){
				   if(data && data.bannerList){
						var bannerList = "";
						var bList = data.bannerList;
						for(var i =1;i <= bList.length;i++){
							bannerList += '<li id="pic_0'+i+'"><img src="'+webRoot+bList[i-1].picUrl+
								'" width="100%" height="197px" style="cursor:pointer;" onclick="forward(\''+bList[i-1].href+'\')"></li>';
						}
						//生成banner数据
						$(opts.target).append(bannerList);
						
						//初始化unslier
						$(opts.sliderTargetId).unslider({
							dots: true,
							complete:function(obj,targetObj){
								var _id = targetObj.attr("id");
								//清除jump选中样式
								_clearUnsliderJumpSelected(opts.sliderTargetJump);
								$(opts.sliderTargetJump+"-"+_id.substr(_id.length-2,_id.length)).addClass("selected");
							}
					    });
						
		    			//生成切换节点
					    $(opts.target).find("li").each(function(idx){
					    	var _id = this.id.substr(this.id.length-2,this.id.length);
					    	$(opts.sliderTargetJump).append("<a href='javascript:void(0);' class='"+opts.sliderTargetJump.substr(1,opts.sliderTargetJump.length)
					    		+"-"+_id+(idx==0?" selected":"")+"'></a>");
					    });
		    			
		    			//绑定banner节点切换事件
						$(opts.sliderTargetJump).find("a").click(function(idx){
							var _className = this.className;
							$(opts.sliderTargetId).data("unslider")["to"]((parseInt(_className.substr(_className.length-2,_className.length))-1));
						});
				   }
			   }
			});
		},
		_ajaxGoodsList:function(opts){
			//异步请求热门商品列表数据
			$.ajax({
			   type: "POST",
			   url: webRoot+"/page/front/home/queryGoodsInfo",
			   data:opts.data,
			   success: function(data){
				   if(data && data.hotGoodsList){
						var hotGoodsList = data.hotGoodsList;
						var targetWrap = $(opts.targetWrap);
						var imgList = targetWrap.find(".content figure img");
						var contentList = targetWrap.find(".content figure figcaption");
						for(var i = 0;i<hotGoodsList.length;i++){
							var hotGoods = hotGoodsList[i];
							if(i >= imgList.length){
								//加载数据过多，只显示页面上需要展示的
								break;
							}
							$(imgList[i]).attr({alt:hotGoods.goodsName,src:webRoot+hotGoods.pictureUrl,onerror:"this.src='"+webRoot+"/page/ttw/front/images/default_goods.png'"})
								.css("cursor","pointer").click(hotGoods,function(event){
								forward("/page/portal/product?productId="+event.data.id+"&goodsCategoryId="+event.data.goodsCategoryId);
							});
							$(contentList[i]).find("span:first-child").text(hotGoods.goodsName);
							$(contentList[i]).find("span:last-child").html("<small>￥</small>"+hotGoods.memberPrice);
						}
				   }
			   }
			});
		},
		_loadPmsjData:function(){
			//左侧区域平面设计类别图片、子类型数据
			this._ajaxGoodsCategoryInfo({
				data:{type:"goodscategory_id",defaultKey:"pmsj"},
				picTarget:".content-main-pmsj",
				listTarget:".content-main-pmsj .children-goodsCategory-list",
				maxSize:12,
				goodsCategoryId:"#goodsCategory_pmsj_id"
			});
			
			//右侧热门商品数据、banner数据
			//banner数据
			this._ajaxBannerList({
				data:{page:"HOME",pageIdx:"PMSJ"},
				target:"#pmsj_unslider02_image_list",
				sliderTargetId:"#unslider-02",
				sliderTargetJump:".unslider02-jump"
			});
			
			//热门商品数据
			this._ajaxGoodsList({
				data:{type:"goodscategory_id",defaultKey:"pmsj"},
				targetWrap:".pmsj-content"
			});
			
			
		},
		_loadJzyxData:function(){
			//左侧建站营销类别图片、子类型数据
			this._ajaxGoodsCategoryInfo({
				data:{type:"goodscategory_id",defaultKey:"jzyx"},
				picTarget:".content-main-jzyx",
				listTarget:".content-main-jzyx .children-goodsCategory-list",
				maxSize:3,
				goodsCategoryId:"#goodsCategory_jzyx_id"
			});
			
			//右侧热门商品数据、banner数据
			//banner数据
			this._ajaxBannerList({
				data:{page:"HOME",pageIdx:"JZYX"},
				target:"#jzyx_unslider03_image_list",
				sliderTargetId:"#unslider-03",
				sliderTargetJump:".unslider03-jump"
			});

			//热门商品数据
			this._ajaxGoodsList({
				data:{type:"goodscategory_id",defaultKey:"jzyx"},
				targetWrap:".jzyx-content"
			});
			
		},
		_loadXmalData:function(){
			//左侧项目案例类别图片、子类型数据
			this._ajaxGoodsCategoryInfo({
				data:{type:"goodscategory_id",defaultKey:"xmal"},
				picTarget:".content-main-xmal",
				listTarget:".content-main-xmal .children-goodsCategory-list",
				maxSize:6,
				goodsCategoryId:"#goodsCategory_xmal_id"
			});
			
			//右侧热门商品数据、banner数据
			//banner数据
			this._ajaxBannerList({
				data:{page:"HOME",pageIdx:"XMAL"},
				target:"#xmal_unslider04_image_list",
				sliderTargetId:"#unslider-04",
				sliderTargetJump:".unslider04-jump"
			});
			
			//热门商品数据
			this._ajaxGoodsList({
				data:{type:"goodscategory_id",defaultKey:"xmal"},
				targetWrap:".xmal-content"
			});
		},
		_loadAd:function(){
			//加载广告信息
			$.ajax({
			   type: "POST",
			   url: webRoot+"/page/front/queryAdvertisement",
			   data:{type:"advertisement_home"},
			   success: function(data){
				   if(data && data.advertisementList){
					   for(var i = 1;i <= data.advertisementList.length;i++){
						   var ad = data.advertisementList[i-1];
						   $(".ad"+i).css(
						   {
							   "background":'#0096dc url('+(webRoot+ad.defaultValue)+') no-repeat scroll 0 0',
							   "cursor":"pointer"
							}).click(ad,function(event){
								var ad = event.data;
			   					if(ad.expand2 == 0){
			   						//跳转本站系统
			   						forward(ad.expand1);
			   					}else if(ad.expand2 == 1){
			   						//跳转外部网站
			   						forwardWWW(ad.expand1);
			   					}
			   				});
					   }
				   }
			   }	    				
			});
		},
		_loadContentData:function(){
			// 这里的数据用ajax异步去请求
	    	//平面设计
	    	this._loadPmsjData();
	    	//建站营销
	    	this._loadJzyxData();
	    	//项目案例
	    	this._loadXmalData();
	    	//广告
	    	this._loadAd(); 
		}
    };
    
	new home({});  
});