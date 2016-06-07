/*TMODJS:{"version":66,"md5":"6ed2fdeec4e7463479180d6129618454"}*/
template('headerNav',function($data,$filename
/**/) {
'use strict';var $utils=this,$helpers=$utils.$helpers,$escape=$utils.$escape,iconHref=$data.iconHref,$each=$utils.$each,list=$data.list,item=$data.item,i=$data.i,selectedId=$data.selectedId,contextPath=$data.contextPath,search=$data.search,$out='';$out+='<nav> <ul> <li class="nav-home-icon"><a href="';
$out+=$escape(iconHref);
$out+='" title="导航首页图标" ></a></li> ';
$each(list,function(item,i){
$out+=' ';
if(item.id == selectedId){
$out+=' <li class="selected"><a href="';
$out+=$escape(contextPath);
$out+=$escape(item.url);
$out+='?goodsCategoryId=';
$out+=$escape(item.id);
$out+='&homeUrl=';
$out+=$escape(item.homeUrl);
$out+='&search=';
$out+=$escape(search);
$out+='">';
$out+=$escape(item.name);
$out+='</a></li> ';
}else{
$out+=' <li><a href="';
$out+=$escape(contextPath);
$out+=$escape(item.url);
$out+='?goodsCategoryId=';
$out+=$escape(item.id);
$out+='&homeUrl=';
$out+=$escape(item.homeUrl);
$out+='&search=';
$out+=$escape(search);
$out+='">';
$out+=$escape(item.name);
$out+='</a></li> ';
}
$out+=' ';
});
$out+=' </ul> </nav> ';
return new String($out);
});