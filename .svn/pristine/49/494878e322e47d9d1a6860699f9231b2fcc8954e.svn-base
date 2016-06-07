<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp"></jsp:include>
	<title>淘桃网-平面设计主页</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 推荐滚动信息 -->
	<section class="unslider-jump-wrap">
		<a href="#" class="unslider-arrow01 prev"></a>
		<a href="#" class="unslider-arrow01 next"></a>
		<p class="unslider01-jump">
			<!-- 这里的圆点根据banner的li来动态生成 -->
		</p>
		<div id="unslider-01">
			<!-- 从数据库读取平面设计推荐产品 -->
		    <ul id="recommand_image_list">
		    </ul>
		</div>
	</section>
	
	<main>
		<img class="pmsj-nav-img" src="${ctx}/page/ttw/front/images/large_run.png">
		<section class="pmsj-project-share-wrap">
			<p>案例分享</p>
			<div class="love-icon-wrap">
				<hr>
				<i></i>
				<hr>
			</div>
			<div class="clear"></div>
			<div class="table">
				<div class="row">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_1.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_2.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_3.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_4.png">
				</div>
				<div class="row">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_5.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_6.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_7.png">
					<img class="cell" src="${ctx}/page/ttw/front/images/des_8.png">
				</div>
			</div>
		</section>
	</main>
	<div class="clear"></div>
	<jsp:include page="footer.jsp"></jsp:include>


	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/unslider/unslider.js"></script>
	<script type="text/javascript">
		$(function() {
			
			function clearUnsliderJumpSelected(className){
				$(className).find("a").each(function(){
					$(this).removeClass("selected");
				})
			}

		    var pmsjHome = function(opts){
				this.options = $.extend(true, {},opts);
				this._init.call(this);
		    }
		    
		    pmsjHome.prototype = {
	    		constructor:pmsjHome,
	    		_init:function(){
	    			//初始化首页推荐banner
	    			this._ajaxBannerList();
	    		},
	    		_initSilder:function(){
					// banner
					unslider01 = $('#unslider-01').unslider({
						dots: true,
						complete:function(obj,targetObj){
							var _id = targetObj.attr("id");
							clearUnsliderJumpSelected(".unslider01-jump");
							$(".unslider01-jump-"+_id.substr(_id.length-2,_id.length)).addClass("selected");
						}
				    }).data('unslider');
	    		},
	    		_initEvent:function(){
					// 初始化banner左右滑动事件
					$('.unslider-arrow01').click(function() {
				        var fn = this.className.split(' ')[1];
				        unslider01[fn]();
				    });

					// 初始化banner跳转事件
					$(".unslider01-jump").find("a").click(function(idx){
						var _className = this.className;
						unslider01["to"]((parseInt(_className.substr(_className.length-2,_className.length))-1));
					});
	    		},
	    		_makeBannerJump:function(){
				    // 循环要展示的banner
				    $("#recommand_image_list").find("li").each(function(idx){
				    	var _id = this.id.substr(this.id.length-2,this.id.length);
				    	$(".unslider01-jump").append("<a href='javascript:void(0);' class='unslider01-jump-"+_id+(idx==0?" selected":"")+"'></a>");
				    });
	    		},
	    		_ajaxBannerList:function(){
	    			var _self = this;
	    			$.ajax({
						   type: "POST",
						   url: webRoot+"/page/front/queryBanner",
						   data:{page:"PMSJ_HOME",pageIdx:"BIG_BANNER",sortFieldName:"sort",sortType:"asc"},
						   success: function(data){
							   if(data && data.bannerList){
									var bannerList = "";
									var bList = data.bannerList;
									for(var i =1;i <= bList.length;i++){
										bannerList += '<li id="pic_0'+i+'"><img src="'+webRoot+bList[i-1].picUrl+
											'" width="100%" height="360px" style="cursor:pointer;" onclick="forward(\''+bList[i-1].href+'\')"></li>';
									}
									//生成banner数据
									$("#recommand_image_list").append(bannerList);
									
									//初始化unslier
									_self._initSilder();
									
					    			//生成切换节点
 								    _self._makeBannerJump();
					    			
					    			//绑定banner节点切换事件
									_self._initEvent();
							   }
						   }
		    			});
	    		}
		    };
		    
		    new pmsjHome({});
		});
	</script>
</body>
</html>