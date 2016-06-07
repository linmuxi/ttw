/*TMODJS:{"version":3,"md5":"4b30678352fef0a92ec9f804ba0f318e"}*/
template('header',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$each=$utils.$each,list=$data.list,value=$data.value,i=$data.i,$string=$utils.$string,Hlink=$data.Hlink,$out='';$out+='<div class="header container"> <div class="h-nav"> <div class="container wid1000"> <ul class="fl leftsidebar"> <li><a href="/ttw/page/ttw/portal/index.jsp">首页</a></li> <li><a href="/ttw/page/ttw/portal/html/Design.jsp">平面设计</a></li> <li><a href="/ttw/page/ttw/portal/html/Station.jsp">建站营销</a></li> <li><a href="/ttw/page/ttw/portal/html/Virtual.jsp">虚拟主机</a></li> <li><a href="/ttw/page/ttw/portal/html/Domain.jsp">域名注册</a></li> <li><a href="/ttw/page/ttw/portal/html/Mailbox.jsp">企业邮箱</a></li> <li><a href="/ttw/page/ttw/portal/html/Project.jsp">项目案例</a></li> </ul> <ul class="fr rightsidebar"> <li>[<a href="/ttw/page/ttw/portal/html/Et.jsp"> 登录</a> |<a href="/ttw/page/ttw/portal/html/Ef.jsp"> 免费注册</a> ] </li> <li><a href="/ttw/page/ttw/portal/html/NewPro/Submit.jsp">我的订单</a></li> </ul> </div> </div> <div class="h-sl"> <div class="container wid1000"> <a href="/ttw/page/ttw/portal/index.jsp"> <div class="logo fl"> </div> </a> <div class="search fr"> <div class="search-k fl"> <input class="search-input" placeholder="尊贵型设计" /> </div> <div class="search-xl fl"> <div class="dropdownContainer fl"> <div class="dropdownDefault">分类</div> <span class="downArrow1 arrow sx-icon"></span> <ul class="dropdrown-menu" style="display: none;"> <li>分类</li> <li>2</li> <li>6</li> <li>8</li> </ul> </div> </div> <div class="search-word fl"> 搜 索 </div> </div> </div> </div> <div class="h-menu"> <div class="container wid1000"> <ul class="leftsidebar2"> ';
$each(list,function(value,i){
$out+=' ';
if(i===0){
$out+=' <a href = ';
$out+=$string(Hlink[i]+'?t='+value);
$out+='><li><i></i>';
$out+=$string(value);
$out+='</li></a> ';
}else{
$out+=' <a href = ';
$out+=$string(Hlink[i]+'?t='+value);
$out+='><li>';
$out+=$string(value);
$out+='</li></a> ';
}
$out+=' ';
});
$out+=' </ul> </div> </div> </div> ';
return new String($out);
});