(function ($){
	//var index = 0;
	//标识第一次运行
	//var firstFlag = true;
	
	function initEvent(settings){
		var picObj = settings.bigImg;
		var smallImgArr = settings.smallImg;
		var style = settings.style;
		
		//thumbnail：产品详情页面（缩略图）    simple：首页简单滚动
		if(style == 'thumbnail'){
			smallImgArr.each(function(){
				$(this).bind('mouseover', function(){
					
					//设置所有小图半透明
					smallImgArr.css('opacity', 0.4);
					$(this).animate({opacity:'1'},"slow");
					
					//设置半透明
					$(picObj).css('opacity', 0.3);
					picObj.src = $(this).attr('src');
					//动态效果
					$(picObj).animate({opacity:'1'},"slow");
				});
			});
			
			$('#hbsjLeft').bind('click', function(){
				if(settings.index != 0){
					settings.index--;
				}else{
					settings.index = smallImgArr.length - 1;
				}
				//设置半透明
				$(picObj).css('opacity', 0.3);
				//切换图片
				picObj.src = smallImgArr.get(settings.index).src;
				//动态效果
				$(picObj).animate({opacity:'1'},"slow");
				
				//设置所有小图半透明
				smallImgArr.css('opacity', 0.4);
				$(smallImgArr.get(settings.index)).animate({opacity:'1'},"slow");
			});
			
			$('#hbsjRight').bind('click', function(){
				if(settings.index != (smallImgArr.length - 1)){
					settings.index++;
				}else{
					settings.index = 0;
				}
				//设置半透明
				$(picObj).css('opacity', 0.3);
				//切换图片
				picObj.src = smallImgArr.get(settings.index).src;
				//动态效果
				$(picObj).animate({opacity:'1'},"slow");
				
				//设置所有小图半透明
				smallImgArr.css('opacity', 0.4);
				$(smallImgArr.get(settings.index)).animate({opacity:'1'},"slow");
			});
		}else if(style == 'simple'){
			
			
			smallImgArr.each(function(){
				var smallImgObj = $(this);
				$(this).parent().bind('mouseover', function(){
					//设置半透明
					$(picObj).css('opacity', 0.3);
					picObj.src = smallImgObj.attr('src');
					
					//去除所有点的选中样式
					smallImgArr.each(function(){
						$(this).parent().removeAttr('class');
					});
					//设置当前选中的样式
					$(this).attr('class', 'active');
				});
			});
		}
		
	};
	
	function startFun(settings){
		var picObj = settings.bigImg;
		var smallImgArr = settings.smallImg;
		var style = settings.style;
		
		//第一次运行不切换图片
		if(!settings.firstFlag){
			//判断轮训的下标是否达到最大值
			if(settings.index == (smallImgArr.length -1)){
				settings.index = 0;
			}else{
				settings.index++;
			}
			//设置半透明
			$(picObj).css('opacity', 0.3);
			
			//切换图片
			picObj.src = smallImgArr.get(settings.index).src;
			
			//保存图片id
			picObj.setAttribute("bid",smallImgArr.get(settings.index).getAttribute("bid"));
			
			//动态效果
			$(picObj).animate({opacity:'1'},"slow");
			
			//thumbnail：产品详情页面（缩略图）    simple：首页简单滚动
			if(style == 'thumbnail'){
				//设置所有小图半透明
				smallImgArr.css('opacity', 0.4);
				$(smallImgArr.get(settings.index)).animate({opacity:'1'},"slow");
			}else if(style == 'simple'){
				//设置点选中样式
				smallImgArr.each(function(){
					$(this).parent().removeAttr('class');
				});
				$(smallImgArr.get(settings.index)).parent().attr('class', 'active');
			}
		}
		settings.firstFlag = false;
	};
	
	$.mySlider = function(settings){
		var defaultSettings = {
			index:0,	//记录滚动图片的下标
			firstFlag:true,	//第一次执行，不需要滚动
			bigImg:{},		//大图片对象
			smallImg:{},	//缩略图数组对象
			style:'',		//thumbnail：产品详情页面（缩略图）    simple：首页简单滚动
			timeVal:3000	//滚动间隔时间
		};
		
		settings = $.extend(defaultSettings, settings);
		
		//定时滚动
		setInterval(function(){
			startFun(settings)
		}, settings.timeVal);
		
		
		initEvent(settings);
	}
	
	
})(jQuery);