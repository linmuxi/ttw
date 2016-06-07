<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp"></jsp:include>
  	<link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/gallery/jquery.ad-gallery.css">
	<title>淘桃网-商品搜索</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<main>
		<header class="location-search-header">
			<div class="location-info">				
				<span>当前位置：</span>
				<span>
					<c:choose>
					<c:when test="${not empty modelMap.goodsCategory.path }">
						<span>${fn:replace(modelMap.goodsCategory.path, ",", " > ") } > ${modelMap.goodsCategory.name }</span>
					</c:when>
					<c:otherwise>
						<span>${modelMap.goodsCategory.name }</span>
					</c:otherwise>
				</c:choose>
				</span>
			</div>
		</header>
		
		<section class="goods-detail-info">
			<div class="detail-info-left-wrap float-left">
				<!-- 图片左右切换 -->
				<div id="gallery" class="ad-gallery">
					<!-- 大图 -->
					<div class="ad-image-wrapper"></div>
					<!-- 缩略图 -->
					<div class="ad-nav">
						<div class="ad-thumbs">
							<ul class="ad-thumb-list">
								<c:forEach items="${modelMap.productImage }" var="imageItem" varStatus="stat">
								<li>
									<!-- 大图url -->
									<a href="${pageContext.request.contextPath}${imageItem.url}">
										<!-- 缩略图url -->
										<img src="${pageContext.request.contextPath}${imageItem.url }" width="90" height="60" alt="">
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			      <!-- end 图片左右切换 -->
			</div>

			<div class="detail-info-right-wrap float-right">
				<p class="goods-name font-color-red">${modelMap.product.goodsName }</p>
				<p class="goods-no font-color-red">商品编号：${modelMap.product.serialNumber }</p>
				<div class="goods-price-info-wrap">
					<p>
						SGI价格:<span class="font-color-red goods-sgi-price"><small >￥</small>${modelMap.product.memberPrice }</span>
						<label class="old-price">价格：${modelMap.product.price }</label>
					</p>
					<!-- <p>促销信息：<label class="font-color-red">满999.00另加69.00元，或满9999.00另加1元，即可购买热销商品</label></p>
					<p>月销量：<label class="font-color-red">2655</label></p> -->
				</div>
				<div class="goods-price-operate">
					 <!-- <div class="goods-operate-num-wrap">
						<input class="goods-operate-num" type="text" value="1" readonly>
						<span class="goods-num-add">+</span><span class="goods-num-mul">-</span>
					</div>  -->
					<input class="goods-operate-buy" type="button" value="立即购买">
					<input class="goods-operate-car" type="button" value="加入购物车">
				</div>
				<div class="clear"></div>
				<ul class="goods-pay-wrap">
					<li>支付方式:</li>
					<li>信用卡</li>
					<li>网上银行</li>
					<li>支付宝</li>
					<li>微信支付</li>
					<li>找人代付</li>
					<li><i></i></li>
				</ul>
			</div>
		</section>

		<section class="goods-search-main-left">
			<%-- 所有分类加商品推荐  start --%>
			<jsp:include page="/page/ttw/front/categoryLeft.jsp"></jsp:include>
			<%-- 所有分类  end --%>
			<!-- end 推荐商品 -->
		</section>

		<section class="goods-search-main-right goods-detail">
			<ul class="goods-detail-ul">
				<li class="selected">商品详情</li>
				<!-- <li>配送说明</li> -->
			</ul>
			<section class="goods-detail-descrption">
               	<c:forEach items="${modelMap.attrList }" var="attrItem">
                	<span style="padding-left: 30px;">${attrItem.goodsAttributeName }：${attrItem.attrVal }</span>
               	</c:forEach>
				<div class="clear"></div>
				<hr style="border-top: 1px solid #C9C9C9;margin: 15px 0px;"/> 
	           	<p>
	           		${modelMap.product.intro }
	           	</p>

			</section>
		</section>

	</main>
	
	<dir class="clear"></dir>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- end footer -->

	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/gallery/js/jquery.ad-gallery.js"></script>

	<script type="text/javascript">
		$(function() {
			
			//立即购买
			$('.goods-operate-buy').click(function(){
				location.href="${pageContext.request.contextPath}/page/ttw/frontbg/product/order?serialno=${modelMap.product.serialNumber}";
			});
			
			//添加购物车
			$(".goods-operate-car").click(function(){
				location.href="${pageContext.request.contextPath}/page/ttw/frontbg/cart/insertCart?goodsId=${modelMap.product.id}";
			});

			// 初始化事件
			function _initEvent(){
				// 商品列表鼠标事件
				$(".goods-result-list").find(".cell").mouseover(function(){
					$(this).addClass("goods-box-selected");
				}).mouseleave(function(){
					$(this).removeClass("goods-box-selected");
				});

				// 推荐商品鼠标事件
				$(".goods-recommand-wrap").find("figure").mouseover(function(){
					$(this).addClass("goods-box-selected");
				}).mouseleave(function(){
					$(this).removeClass("goods-box-selected");
				});

				// 商品类别导航菜单鼠标事件
				$(".goods-type-nav .one-level-nav-ul>li").mouseover(function(){
					var idx = parseInt(this.className.substr(this.className.length-2,this.className.length));
					var _two_nav_ul = $(this).find(".two-level-nav-ul");
					var opts ;
					if(idx == $(".one-level-nav-ul>li").length){
						opts = { bottom:"-1px" } ;
					}else{
						opts = { top:((idx-1)*41)-1+"px" };
					}
					_two_nav_ul.css($.extend({display:"block",left:"250px"},opts));
				}).mouseleave(function(){
					$(this).find(".two-level-nav-ul").css("display","none");
				});
				
				//购买商品数量增加减少
				$(".goods-num-add,.goods-num-mul").click(function(){
					var _clsName = this.className;
					var _num = $(".goods-operate-num");
					if(isNaN(_num.val())){
						_num.val(0);
					}else{
						if(_clsName == 'goods-num-add'){
							_num.val(parseInt(_num.val())+1);
						}else if(_clsName == 'goods-num-mul'){
							if(_num.val() > 1 ){
								_num.val(parseInt(_num.val())-1);
							}else{
								_num.val(1);
							}
						}
					}
				});
			}

			// 初始化商品图片滚动
			function _initGallery(){
    			$('.ad-gallery').adGallery({
    				loader_image: '${ctx}/page/ttw/front/plugins/gallery/loader.gif'
    			});
			}


			var goodsDetail = function(opts){
				this.options = $.extend(true, {},opts);
				this._init.call(this);
		    }
		    
			goodsDetail.prototype = {
	    		constructor:goodsDetail,
	    		_init:function(){
	    			//这里做初始化工作
	    			_initEvent();
	    			_initGallery();
	    		}
		    };
		    
		    new goodsDetail();
		});
	</script>
</body>
</html>