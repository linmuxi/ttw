<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/fn.tld" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/fmt.tld" prefix="fmt" %>
<!DOCTYPE html>
<html language="en">
<head>
	<jsp:include page="../common.jsp"></jsp:include>
	<link href="${ctx}/page/ttw/front/css/email.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/page/ttw/front/css/domain.css" type="text/css" rel="stylesheet" />
	<link href="${ctx}/page/ttw/front/css/domain_search.css" type="text/css" rel="stylesheet" />
	<title>淘桃网-域名注册</title>
</head> 
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<main>
		<header class="location-search-header">
			<div class="location-info">				
				<span>当前位置：</span>
				<span>域名注册</span>
			</div>
		</header>

		<section class="goods-search-main-left">
			<!-- 商品类别导航 -->
			<jsp:include page="../productTypeMenu.jsp"></jsp:include>
			
			<!-- 模块1 -->
			<section class="box1 email-left-mk1">
				<ul>
					<li>如何选择域名?</li>
					<li>如何选择域名?</li>
					<li>如何选择域名?</li>
					<li>如何选择域名?</li>
					<li>如何选择域名?</li>
					<li>如何选择域名?</li>
				</ul>
			</section>
			
			<!-- 模块2 -->
			<section class="box1 email-left-mk2">
				<h4>SGI注册域名优势</h4>
				<ul>
					<li>支持多线路解析</li>
					<li>支持多线路解析</li>
					<li>支持多线路解析</li>
					<li>支持多线路解析</li>
				</ul>
			</section>
			<!-- 模块2 -->
			<section class="box1 email-left-mk2">
				<h4>购买空间完美支持以下程序</h4>
				<img src="../images/Service.png" width="188" height="196" style="margin-left: 30px;" />
			</section>
			<!-- 模块2 -->
			<section class="box1 email-left-mk2">
				<h4>购买空间完美支持以下程序</h4>
				<img src="../images/Service.png" width="188" height="196" style="margin-left: 30px;" /> 
			</section>
		</section>
		
		<section class="goods-search-main-right">
			<section class="unslider-jump-wrap"  style="height: 250px">
				<p class="unslider01-jump">
					<!-- 这里的圆点根据banner的li来动态生成 -->
				</p>
				<div id="unslider-01">
				    <ul id="domain_list">
				    </ul>
				</div>
			</section>
            <div class="CR_HostSearch mt14">
               <div class="text_center">域名查询结果</div>
               <div class="CR_ResultBox">
                   <div class="w10 fl">1</div>
                   <div class="w30 fl">baidu.top</div>
                   <div class="w30 fl">已被注册，whois查询</div>
                   <div class="w30 fl">重新查询</div>
                   <div class="cl"></div>
               </div>
           </div>
            <div class="CR_HostTable mt14">
                <table cellspacing="0">
                    <tbody>
                        <tr>
                            <th>
                                类别
                            </th>
                            <th>
                                描述
                            </th>
                            <th>
                                价格
                            </th>
                            <th>
                                购买
                            </th>
                        </tr>
                        <tr>
                            <td>
                                英文国际域名
                            </td>
                            <td>
                                .com/.net
                            </td>
                            <td class="t100">
                                55元/年
                            </td>
                            <td class="t70">
                                <button class="btn1">
                                    订购</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                英文国际域名
                            </td>
                            <td>
                                .com/.net
                            </td>
                            <td class="t100">
                                55元/年
                            </td>
                            <td class="t70">
                                <button class="btn1">
                                    订购</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                英文国际域名
                            </td>
                            <td>
                                .com/.net
                            </td>
                            <td class="t100">
                                55元/年
                            </td>
                            <td class="t70">
                                <button class="btn1">
                                    订购</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                英文国际域名
                            </td>
                            <td>
                                .com/.net
                            </td>
                            <td class="t100">
                                55元/年
                            </td>
                            <td class="t70">
                                <button class="btn1">
                                    订购</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
		</section>

	</main>
	
	<div class="clear"></div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- end footer -->

<script type="text/javascript" src="${ctx}/page/ttw/front/plugins/unslider/unslider.js"></script>
	<script type="text/javascript">
		$(function() {
			
			function clearUnsliderJumpSelected(className){
				$(className).find("a").each(function(){
					$(this).removeClass("selected");
				})
			}

		    var domain = function(opts){
				this.options = $.extend(true, {},opts);
				this._init.call(this);
		    }
		    
		    domain.prototype = {
	    		constructor:domain,
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
					// 初始化banner跳转事件
					$(".unslider01-jump").find("a").click(function(idx){
						var _className = this.className;
						unslider01["to"]((parseInt(_className.substr(_className.length-2,_className.length))-1));
					});
	    		},
	    		_makeBannerJump:function(){
				    // 循环要展示的banner
				    $("#domain_list").find("li").each(function(idx){
				    	var _id = this.id.substr(this.id.length-2,this.id.length);
				    	$(".unslider01-jump").append("<a href='javascript:void(0);' class='unslider01-jump-"+_id+(idx==0?" selected":"")+"'></a>");
				    });
	    		},
	    		_ajaxBannerList:function(){
	    			var _self = this;
	    			$.ajax({
						   type: "POST",
						   url: webRoot+"/page/front/queryBanner",
						   data:{page:"DOMAIN",pageIdx:"BIG_BANNER",sortFieldName:"sort",sortType:"asc"},
						   success: function(data){
							   if(data && data.bannerList){
									var bannerList = "";
									var bList = data.bannerList;
									for(var i =1;i <= bList.length;i++){
										bannerList += '<li id="pic_0'+i+'"><img src="'+webRoot+bList[i-1].picUrl+
											'" width="100%" height="250" style="cursor:pointer;" onclick="forward(\''+bList[i-1].href+'\')"></li>';
									}
									//生成banner数据
									$("#domain_list").append(bannerList);
									
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
		    
		    new domain({});
		});
	</script>
</body>
</html>