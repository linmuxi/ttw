<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="common.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${ctx}/page/ttw/front/plugins/jPaginate/css/style.css" media="screen"/>
	<link href="${ctx}/page/common/js/loadmask/jquery.loadmask.css" type="text/css"></link>
	<title>淘桃网-${modelMap.goodsCategory.name }</title>
	<style>
	.loadmask-msg div{
		background:url("/ttw/page/ttw/front/plugins/layer/skin/default/xubox_loading0.gif") no-repeat !important;
	}
	.loadmask-msg{
		border:0px!important;
		background:0!important;
	}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<main>
		<header class="location-search-header">
			<div class="location-info">				
				<span>当前位置：</span>
				<c:choose>
					<c:when test="${not empty modelMap.goodsCategory.path }">
						<span>${fn:replace(modelMap.goodsCategory.path, ",", " > ") } > ${modelMap.goodsCategory.name }</span>
					</c:when>
					<c:otherwise>
						<span>${modelMap.goodsCategory.name }</span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="goods-search-wrap">
				<input class="goods-search-key" type="text" placeholder="商品名称搜索">
				<input class="goods-search-btn" type="button" value="搜索">
			</div>
		</header>

		<%-- 所有分类  start --%>
		<jsp:include page="/page/ttw/front/categoryLeft.jsp"></jsp:include>
		<%-- 所有分类  end --%>

		<section class="goods-search-main-right">
			<!-- 属性选择 -->
			<section class="goods-type-attr-table">
				
				<c:forEach items="${modelMap.attrList }" var="attrItem" varStatus="attrStatus">
					<c:set var="attrNames" value="${attrItem.attributeList }"></c:set>
					<div class="row">
						<div class="cell label">${attrItem.goodsAttributeName }</div>
						<div class="cell">
							<c:forEach items="${attrNames }" var="attrNameItem" varStatus="itemStatus">
								<input class="attrBox" type="checkbox" name="attrBox" id="price-attr-${attrStatus.index }-${itemStatus.index }" value="${attrItem.id }#${attrNameItem }">
								<label class="attrBoxLabel" for="price-attr-${attrStatus.index }-${itemStatus.index }">${attrNameItem }</label>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
				<%--
				<c:if test="${empty modelMap.attrList }">
					<div class="row" style="height: 100px;">
						<div class="cell label">&nbsp;</div>
						<div class="cell">
							&nbsp;
						</div>
					</div>
				</c:if>
				--%>
			</section>
			<!-- end 属性选择 -->

			<!-- 查询结果列表 -->
			<section class="goods-search-result-wrap">
				<!-- 排序  翻页 -->
				<header class="goods-result-header">
					<input type="hidden" name="sortField" id="sortField"/>
					<input type="hidden" name="sortField" id="sortType"/>
					
					<p class="float-left" id="sortButton">
						<span>排序：</span>
						<%--
						<input class="selected" type="button" value="销售">
						--%>
						<input type="button" value="会员价"  onclick="reloadPaginationBySort('memberPrice', this);">
						<input type="button" value="价格" onclick="reloadPaginationBySort('price', this);">
						<span id="sortDes">(默认排序)</span>
					</p>
					<p class="float-right">
						<span class="font-color-red">共<font id="productCount">${modelMap.count }</font>件商品
							<c:choose>
								<c:when test="${modelMap.count ne 0}">
									<small><font color="red" id="currPageNumber">1</font>/<font id="totalPage"><fmt:parseNumber var="pageNumber" integerOnly="true" value="${modelMap.count/12 + (modelMap.count%12 != 0 ? 1 : 0) }" />${pageNumber eq 0 ? 1 : pageNumber }</font></small>
								</c:when>
								<c:otherwise>
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
						</span>
						<!--  
						 onclick="$('.paginate-ui').paginate('previous')" 
						 onclick="$('.paginate-ui').paginate('next')"
						-->
						<input type="button" id="previousBtn" value="上一页"/>
						<input type="button" id="nextBtn" value="下一页">
					</p>
				</header>
				<!-- end 排序 翻页 -->
				<section class="goods-result-list goods-recommand-wrap">
				    <c:forEach items="${modelMap.goodsList }" var="goodsItem" varStatus="goodsStatus">
						<div class="cell">
							<figure>
								<img src="${ctx}${goodsItem.pictureUrl}" alt="${goodsItem.goodsName }"  onerror="this.src='${ctx}/page/ttw/front/images/default_goods_210_130.png'" width="221" height="130"
									onclick="window.location.href='${pageContext.request.contextPath}/page/portal/product?goodsCategoryId=${param.goodsCategoryId }&productId=${goodsItem.id }'"  >
								<figcaption>
									<p>
										<span class="">￥${empty goodsItem.memberPrice ? 0.00 : goodsItem.memberPrice }</span>
										<span class="float-right">原价：￥${empty goodsItem.price ? 0.00 : goodsItem.price }</span>
									</p>
									<p>
										<span class="">${goodsItem.goodsName }</span>
									</p>
									<p>
										<span class="">商品编号:${goodsItem.serialNumber }</span>
									</p>
								</figcaption>
							</figure>
						</div>
					</c:forEach>
					<c:if test="${empty modelMap.goodsList }">
						<center>没有数据</center>
					</c:if>
				</section>
				<div class="clear"></div>
				<!-- 翻页 -->
				<footer class="goods-result-footer">
	                <div class="paginate-ui"></div>
				</footer>
				<!-- end 翻页 -->
			</section>
			<!-- end 查询结果列表 -->
		</section>

	</main>
	
	<dir class="clear"></dir>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- end footer -->

	<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/jPaginate/jquery.paginate.js"></script>
	<script src="${pageContext.request.contextPath}/page/common/js/loadmask/jquery.loadmask.js"></script>
	<script type="text/javascript" src="${ctx}/page/ttw/front/js/jquery_extend.js"></script>
	
	<script type="text/javascript">
		var pageNum = 1;
		var pageCount = ${empty pageNumber || pageNumber eq 0 ? 1 : pageNumber };
	
		$(function() {

			// 初始化事件
			function _initEvent(){
				// 商品列表鼠标事件
				$(".goods-result-list").find(".cell").live('mouseover', function(){
					$(this).addClass("goods-box-selected");
				}).live('mouseleave', function(){
					$(this).removeClass("goods-box-selected");
				});

				
				$('.attrBox').click(function(){
					//加载数据
					loadProductData(1);
				});
				
				//上一页
				$('#previousBtn').click(function(){
					var previousNum = 1;
					if((pageNum-1) > 1 && pageNum < pageCount){
						previousNum = pageNum - 1;
					}
					_initPaginate(previousNum, pageCount);
					loadProductData(previousNum);
				});
				
				//下一页
				$('#nextBtn').click(function(){
					var nextNum = pageNum + 1;
					if(nextNum >= pageCount){
						nextNum = pageCount;
					}
					_initPaginate(nextNum, pageCount);
					loadProductData(nextNum);
				});
				
				//搜索
				$('.goods-search-btn').click(function(){
					//加载数据
					loadProductData(1);
				});
			}
			
			
		    
		    var goodsSearch = function(opts){
				this.options = $.extend(true, {},opts);
				this._init.call(this);
		    }
		    
		    goodsSearch.prototype = {
	    		constructor:goodsSearch,
	    		_init:function(){
	    			//这里做初始化工作
	    			_initEvent();
	    			if('${pageNumber }' != '0' && '${pageNumber }' != ''){
		    			_initPaginate(1, pageCount);
	    			}
	    		},
	    		_loadGoodsList:function(){
	    			//这里查询商品列表
	    		}
		    };
			new goodsSearch();
		});
		
		
		
		// 初始化分页 pageIndex: 查询第几页；pageNum: 总页数
		function _initPaginate(pageIndex, pageNum){
			$(".paginate-ui").paginate({
				count 		: pageNum,//计算多少页
				start 		: pageIndex,
				display     : 10,
				border					: true,
				border_color			: '#fff',
				text_color  			: '#fff',
				background_color    	: 'black',	
				border_hover_color		: '#ccc',
				text_hover_color  		: '#FFF',
				background_hover_color	: '#0096DC', 
				images					: false,
				mouse					: 'press',
				onChange: function(page){
					pageNum = page;
					//加载产品数据
					loadProductData(page);
					
				}
			});
			$(".jPag-first").html("首页");
			$(".jPag-last").html("尾页");
		}
		
		//加载数据 page: 查询第几页
		function loadProductData(page){
			var loadDataUrl = '${pageContext.request.contextPath}/page/portal/productData?goodsCategoryId=${param.goodsCategoryId}';
	    	//拼接搜索关键字
	    	loadDataUrl += '&search=' + encodeURI(encodeURI($('.goods-search-key').val()));//+ search.encodeURI()
	    	//排序
	    	loadDataUrl += '&sortField='+$('#sortField').val();
	    	loadDataUrl += '&sortType='+$('#sortType').val();
	    	//获取属性
	    	var attrNames = "";
	    	$('input[name="attrBox"]:checked').each(function(){
	    		if(attrNames == ""){
	    			attrNames += $(this).val();
	    		}else{
	    			attrNames += "," + $(this).val();
	    		}
	    	});
	    	loadDataUrl += '&attrNames=' + encodeURIComponent(encodeURIComponent(attrNames));//encodeURI(encodeURI(attrNames));
	    	
	    	//一页显示12条
	    	var pageSize = 12;
	    	
	    	loadDataUrl += '&pageNumber=' + page;
	    	loadDataUrl += '&pageSize=' + pageSize;
	    	//开启锁屏
	    	$(".goods-search-result-wrap").mask("");
	    	$.ajax({
			   type: "POST",
	  		   url: loadDataUrl,
	  		   async: false,
	  		   success: function(data){
	  				if(data){
	  					var totalNumber = data.count;
	  					pageCount = (data.count/pageSize) == 0 ? 1 : Math.ceil(data.count/pageSize);
	  	    	        //搜索关键字回写文本框
	  	    	        $('.goods-search-key').val(data.search);
						//回显页面信息
	  	    	        $('#productCount').html(totalNumber);//总商品数
	  	    	        $('#currPageNumber').html(page);//当前页值
	  	    	        $('#totalPage').html(pageCount);//总分页数
	  	    	        _initPaginate(page, pageCount);//重新初始化分页
	  	    	        createDataHtml(data.productList);//显示商品列表
	  				}
	  		   }
	    	});
	    	//解除锁屏
			//layer.close(loadLayerId);
	    	$(".goods-search-result-wrap").unmask();
		}
		
		//根据数据拼接商品列表信息
		function createDataHtml(data){
			var html = "";
			for(var i=0; i<data.length; i++){
	    		var id = data[i].id;
	    		var serialNumber = data[i].serialNumber;
	    		var goodsName = data[i].goodsName;
	    		var memberPrice = data[i].memberPrice ? parseFloat(data[i].memberPrice).toFixed(1) : '0.0'; 
	    		var price = data[i].price ? parseFloat(data[i].price).toFixed(1) : '0.0';
	    		var pcurl = data[i].pictureUrl;
	    		html += '<div class="cell">' +
				        '	<figure>'+
						'		<img src="${ctx}'+pcurl+'" alt="'+goodsName+'" width="221" height="130" onclick="window.location.href=\'${pageContext.request.contextPath}/page/portal/product?goodsCategoryId=${param.goodsCategoryId }&productId='+id+'\'"   onerror="this.src=\'${ctx}/page/ttw/front/images/default_goods_210_130.png\'" >' +
						'   	<figcaption>'+
					    '		<p>'+
						'			<span class="">￥'+memberPrice+'</span>'+
						'			<span class="float-right">原价：￥'+price+'</span>'+
						'		</p>'+
						'		<p>'+
						'			<span class="">'+goodsName+'</span>'+
						'		</p>'+
						'		<p>'+
						'			<span class="">商品编号:'+serialNumber+'</span>'+
						'		</p>'+
						'		</figcaption>'+
						'	</figure>'+
						'</div>';
	    		
			}
			if(html == ''){
				if($('.paginate-ui')){
					$.paginate(".paginate-ui").destroy();
				}
				$('.goods-result-list').html("<center>没有数据</center>");
			}else{
				$('.goods-result-list').html(html);
			}
		}
		
		
		//排序 field: 排序字段；obj：点击的对象
	    function reloadPaginationBySort(field, obj){
	    	//排序字段
			var sortField = $('#sortField').val();    	
	    	//排序类型DESC或ASC
	    	var sortType = $('#sortType').val();
	    	
	    	//排序说明
	    	var sortDes = $(obj).val()+":";
	    	
	    	//判断排序字段是否变更
	    	if(sortField == field){
	    		if(sortType == ''){
		    		$('#sortType').val('DESC')
		    		sortDes += "倒序";
		    	}else if(sortType == 'DESC'){
		    		$('#sortType').val('ASC')
		    		sortDes += "升序";
		    	}else if(sortType == 'ASC'){
		    		$('#sortType').val('')
		    		sortDes = "默认";
		    	}
	    	}else{
	    		$('#sortType').val('DESC');
	    		sortDes += "倒序";
	    	}
	    	
	    	$('#sortField').val(field);
	    	//设置排序备注
	    	$('#sortDes').html('('+sortDes+')');
	    	
	    	$('#sortButton').find('input').each(function(){
	    		$(this).removeAttr('class');
	    	});
	    	
	    	if(sortDes != '无序'){
		    	$(obj).attr('class','selected');
	    	}
	    	//加载数据
	    	loadProductData(1);
	    }
		    
	</script>
</body>
</html>