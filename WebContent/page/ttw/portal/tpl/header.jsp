<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	String ctx = request.getContextPath();
	if ("/".equals(ctx)) {
		ctx = "";
	}
	request.setAttribute("ctx", ctx);
%>
<style>
<!--
.carCount{
 	background-color: red;
    border-radius: 50%;
    color: #fff;
    display: inline;
    height: 60%;
    line-height: 20px;
    position: absolute;
    right: -18px;
    text-align: center;
    top: 2px;
    width: 30%;
    font-weight: bold;
}
-->
</style>
<div class="header container">
    <div class="h-nav">
        <div class="container wid1000">
            <ul class="fl leftsidebar">
                <li><a href="/ttw/page/ttw/portal/index.jsp">首页</a></li>
                <li><a href="/ttw/page/ttw/portal/html/Design.jsp">平面设计</a></li>
                <li><a href="/ttw/page/ttw/portal/html/Station.jsp">建站营销</a></li>
                <!-- <li><a href="/ttw/page/ttw/portal/html/Virtual.jsp">虚拟主机</a></li>
                <li><a href="/ttw/page/ttw/portal/html/Domain.jsp">域名注册</a></li>
                <li><a href="/ttw/page/ttw/portal/html/Mailbox.jsp">企业邮箱</a></li> -->
                <li><a href="/ttw/page/ttw/portal/html/Project.jsp">项目案例</a></li>
            </ul>
            <ul class="fr rightsidebar">
                <li>[<a href="/ttw/page/ttw/portal/html/Et.jsp"> 登录</a> |<a href="/ttw/page/ttw/portal/html/Ef.jsp"> 免费注册</a> ] </li>
                <li>
                	<div style="position: relative;"><a href="${ctx}/page/portal/cart"><span class="carCount">0</span>我的订单</a></div>
                </li>
            </ul>
        </div>
    </div>
    <div class="h-sl">
        <div class="container wid1000">
            <a href="/ttw/page/ttw/portal/index.jsp">
                <div class="logo fl">
                </div>
            </a>
            <div class="search fr">
                <div class="search-k fl">
                    <input class="search-input" placeholder="尊贵型设计" />
                </div>
                 <div class="search-xl fl">
                    
                    <div class="dropdownContainer fl">
        <div class="dropdownDefault">分类</div>
        <span class="downArrow1 arrow sx-icon"></span>
        <ul class="dropdrown-menu" style="display: none;">
          <li>分类</li>
          <li value="C16A8392492D11E5B93902004C4F4F50">平面设计</li>
          <li value="25995D783F7911E5B93902004C4F4F50">建站营销</li>
          <li value="BF111F684AFE11E59E3802004C4F4F50">项目案例</li>
        </ul>
      </div>             
                </div>
                <div class="search-word fl">
                    搜 索
                </div>
            </div>
        </div>
    </div>
    <div class="h-menu">
        <div class="container wid1000">
            <ul class="leftsidebar2">
                
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
//查询的产品分类id和搜索关键字
var goodsCategoryId = "${param.goodsCategoryId}",search = "${param.search}";

function loadMenuData(){
	var parentId = "${modelMap.goodsCategory.parentId}";
	//分类级别，grade值是空表示一级分类；值为1表示二级分类
	var grade = '${modelMap.goodsCategory.grade}';
	//空：一级分类根据goodsCategoryId查询目录。1：二级分类，根据分类父id查询菜单
	//if(grade == '1'){
	//	parentId = '${modelMap.goodsCategory.parentId}';
	//}
	//父分类为空时取当前分类
	if(parentId == ''){
		parentId = '${param.goodsCategoryId}';
	}
	$.ajax({
	   type: "POST",
	   url: webRoot+"/page/portal/menu?parentId="+parentId,
	   success: function(msg){
		   if(msg){
			   //推荐产品分类信息
			   if(msg.menu){
			   		var menuData = msg.menu;
			   		var menuNameArr = new Array();
			   		var menuUrlArr = new Array();
			   		
			   		var isIndex = "${empty param.goodsCategoryId ? true : false }";
			   		//显示菜单数量
			   		var menuNumber = 6;
			   		
			   		//不是首页（产品列表页），第一个菜单是产品列表页
			   		if(isIndex != "true"){
				   		var firstMenuName = '${modelMap.goodsCategory.parentCategoryName}';
				   		var firstMenuUrl = webRoot + '/page/portal/productCategory?goodsCategoryId=${modelMap.goodsCategory.parentId}'+"&search="+search.decodeURI().encodeURI();
				   		
				   		//优先取父分类名称
				   		if(firstMenuName == ''){
				   			firstMenuName = '${modelMap.goodsCategory.name}';
				   			firstMenuUrl = webRoot + '/page/portal/productCategory?goodsCategoryId=${modelMap.goodsCategory.id}'+"&search="+search.decodeURI().encodeURI();
				   		}
				   		
				   		if(firstMenuName != ''){
				   			menuNameArr[0] = firstMenuName;
				   			menuUrlArr[0] = firstMenuUrl;
				   		}
			   			
			   			//非首页显示7个菜单
			   			menuNumber = 7;
			   		}else{
			   			//是首页，第一个菜单应该是“首页”
			   			menuNameArr[0] = "首页";
			   			menuUrlArr[0] = webRoot + '/page/ttw/portal/index.jsp';
			   			
			   			//首页显示7个菜单
			   			menuNumber = 6;
			   		}
			   		
			   		//添加数据库的菜单
			   		for(var i=0; i<menuData.length; i++){
			   			//首页只能显示6个，非首页显示7个菜单
			   			if(i < menuNumber){
			   				menuNameArr[i+1] = menuData[i].name;
				   			menuUrlArr[i+1] = webRoot + '/page/portal/productCategory?goodsCategoryId='+menuData[i].id+"&search="+search.decodeURI().encodeURI();
			   			}
			   		}
					
			   		//是首页，最后一个菜单是“会员中心”
			   		if(isIndex == 'true'){
			   			menuNameArr[menuData.length + 1] = "会员中心";
			   			menuUrlArr[menuData.length + 1] = webRoot + '/page/ttw/portal/html/Member.jsp';
			   		}
			   		
			   		//选中的菜单
			   		var selectLiVal = "";
			   		for(var i=0; i<menuUrlArr.length; i++){
			   			var menuUrl = menuUrlArr[i];
			   			if(menuUrl && menuUrl.indexOf('${param.goodsCategoryId}') > 0){
			   				selectLiVal = menuNameArr[i];
			   			}
			   		}
			   		var currUrl = window.location.href;
			   		if(currUrl.indexOf('Member.jsp') > 0){
		   				selectLiVal = "会员中心";
		   			}else if(currUrl.indexOf('index.jsp') > 0){
		   				selectLiVal = "首页";
		   			}
			   		
			   		var html = template('header', { list: menuNameArr, Hlink: menuUrlArr , selectLi: selectLiVal});
			   		$('.leftsidebar2').html(html);
			   }
		   }
	   }
	});
}

loadMenuData();

//首页搜索
$(function(){
	if(search != null && search != '' && search != 'undefined'){
 		$(".search-input").val(search.decodeURI());
	}	
	if(goodsCategoryId != null && goodsCategoryId != '' && goodsCategoryId != 'undefined'){
		$(".dropdownDefault").text(getNavLabel(goodsCategoryId));
	}
	
	
	$(".search-word").click(function(){
		var searchType = $(".dropdownDefault").text().trim();
		if(searchType == '分类'){
			lhgdialog.alert("请选择分类");
			return false;
		}
		
		var currSearchVal = "";
		$(".search-input").each(function(){
			var currVal = $(this).val();
			if(search.decodeURI() != currVal){
				currSearchVal = currVal;
			}
		});
		currSearchVal = currSearchVal.encodeURI();
		window.location.href = webRoot + "/page/portal/productCategory?goodsCategoryId="+nav[searchType]+"&search="+currSearchVal;
	});
});

//刷新购物车中商品总数量
function refreshCarCount(flag){
	$.ajax({
		   type: "POST",
		   url: webRoot+"/page/portal/cart/getCartProductCount",
		   success: function(msg){
				$(".carCount").html(msg);
				if(flag=="1"){
					$(".carCount").animate({width:'50px',height:'50px',opacity:"0.5"},400,"linear",function(){
						$('.carCount').animate({width:20,height:20,opacity:1},400,"linear");
					});
				}
		   }
		});
}
refreshCarCount();
</script>
