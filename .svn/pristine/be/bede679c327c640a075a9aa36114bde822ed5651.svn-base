<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp" flush="true"></jsp:include>
	<title>淘桃网</title>
</head>
<body>
	<!-- 头部信息 -->   
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end 头部信息 -->
	
	<!-- 推荐滚动信息 -->
	<section class="unslider-jump-wrap">
		<a href="#" class="unslider-arrow01 prev"></a>
		<a href="#" class="unslider-arrow01 next"></a>
		<p class="unslider01-jump"></p>
		<div id="unslider-01">
			<!-- 从数据库读取 -->
		    <ul id="recommand_image_list">
		    	<c:forEach var="homeBannerItem" items="${homeBannerList}" varStatus="idx">
		    		<li id="pic_0${idx.count}">
		    			<img src="${ctx}${homeBannerItem.picUrl}"  width="100%" height="360px" style="cursor:pointer;" onclick="forward('${homeBannerItem.href}')">
		    		</li>
		    	</c:forEach>
		    </ul>
		</div>
	</section>
	<!-- end 推荐滚动信息 -->

	<main>
		<!-- 产品分类 -->
		<section class="main-goods-type">
		 	<!-- 商品类型推荐 -->
			<c:forEach var="gtcItem" items="${goodsTypeRecommandList}" varStatus="idx">
				<div class="goods-type">
					<section class="goods-type-bg goods-type-bg-${idx.count}" style="background-color: ${gtcItem.expand2}">
						<figure>
							<a href="javascript:void(0);" title="${gtcItem.defaultKey}" style="background: url('${ctx}${gtcItem.expand1}') no-repeat;"></a>
							<figcaption><span>${gtcItem.defaultKey}</span></figcaption>
						</figure>
					</section>
					<section class="goods-type-wrap">
						<p class="goods-type-price goods-type-price-4">${gtcItem.defaultValue}元<small>起</small></p>
						<p class="goods-type-descript">
							${gtcItem.remark}				
						</p>
					</section>
				</div>
			</c:forEach>
		</section>
		<!-- end 产品分类 -->
		
		<!-- 平面设计 -->
		<section class="main-section">
			<article>
				<header>
					<h3 class="num">1</h3>
					<h3 class="title">平面设计</h3>
					<h5 class="more" id="goodsCategory_pmsj_id" data-goodscategory-id="" >+more</h5>
				</header>
				<div class="clear"></div>
				<div class="content-main pmsj-content">
					<aside class="content-main-pmsj">
						<div class="children-goodsCategory-list table"></div>
					</aside>
					<div class="content">
						<div class="content-1 right-border bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>	
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-2 right-border bottom-border" >
							<div id="pmsj_unslider02" class="unslider-jump-wrap pmsj-jump-wrap">
								<p class="unslider02-jump">
									<!-- 这里的圆点根据banner的li来动态生成 -->
								</p>
								<div id="unslider-02" class="unslider-img-wrap">
									<!-- 从数据库读取 -->
								    <ul id="pmsj_unslider02_image_list">
								    </ul>
								</div>
							</div>
						</div>
						<div class="content-3 bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-4 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-5 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-6 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
					</div>
				</div>
			</article>			
		</section>
		
		<!-- 广告位1 -->
		<section class="ad ad1">
		</section>

		<!-- 建站营销 -->
		<section class="main-section">
			<article>
				<header>
					<h3 class="num">2</h3>
					<h3 class="title">建站营销</h3>
					<h5 class="more" id="goodsCategory_jzyx_id" data-goodscategory-id="">+more</h5>
				</header>
				<div class="clear"></div>
				<div class="content-main jzyx-content">
					<aside class="content-main-jzyx">
						<div class="children-goodsCategory-list table"></div>
					</aside>
					<div class="content">
						<div class="content-1 right-border bottom-border" >
							<div id="jzyx_unslider03" class="unslider-jump-wrap jzyx-jump-wrap">
								<p class="unslider03-jump">
									<!-- 这里的圆点根据banner的li来动态生成 -->
								</p>
								<div id="unslider-03" class="unslider-img-wrap">
									<!-- 从数据库读取 -->
								    <ul id="jzyx_unslider03_image_list">
								    </ul>
								</div>
							</div>	
						</div>
						<div class="content-2 right-border bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png" onerror="this.src=${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-3 bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-4 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-5 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-6 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-7" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
					</div>
				</div>
			</article>			
		</section>

		<!-- 广告位2 -->
		<section class="ad ad2">
		</section>

		<!-- 项目案例 -->
		<section class="main-section">
			<article>
				<header>
					<h3 class="num">3</h3>
					<h3 class="title">项目案例</h3>
					<h5 class="more" id="goodsCategory_xmal_id" data-goodscategory-id="">+more</h5>
				</header>
				<div class="clear"></div>
				<div class="content-main xmal-content">
					<aside class="content-main-xmal">
						<div class="children-goodsCategory-list table"></div>
					</aside>
					<div class="content">
						<div class="content-1 right-border bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-2 right-border bottom-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-3 bottom-border" >
							<figure>	
								<div id="ymal_unslider04" class="unslider-jump-wrap xmal-jump-wrap">
									<p class="unslider04-jump">
										<!-- 这里的圆点根据banner的li来动态生成 -->
									</p>
									<div id="unslider-04" class="unslider-img-wrap">
										<!-- 从数据库读取 -->
									    <ul id="xmal_unslider04_image_list">
									    </ul>
									</div>
								</div>							
							</figure>
						</div>
						<div class="content-4 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-5 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-6 right-border" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
						<div class="content-7" >
							<figure>
								<img class="goods-pic" src="${ctx}/page/ttw/front/images/default_goods.png">
								<figcaption>
									<span>暂时商品</span>
									<span><small>￥</small>0</span>
								</figcaption>									
							</figure>	
						</div>
					</div>
				</div>
			</article>			
		</section>

	</main>
	<div class="clear"></div>
	
	<jsp:include page="footer.jsp"></jsp:include>

	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/unslider/unslider.js"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/js/index.js"></script>
</body>
</html>