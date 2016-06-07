/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
/**
 * 字符串帮助类
 * @Description: TODO
 * @author linyong
 * @since 2015年6月5日 上午12:25:09
 * 
 */

String.prototype.trim = function(){
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

String.prototype.ltrim = function(){
	return this.replace(/(^\s*)/g,"");
}

String.prototype.rtrim = function(){
	return this.replace(/(\s*$)/g,"");
}

String.prototype.encodeURI = function(){
	return encodeURIComponent(encodeURIComponent(this));
}

String.prototype.decodeURI = function(){
	return decodeURIComponent(this); 
}

function parseDate(str){
	return new Date(str.replace(/-/g,'/'));
}

function isNotEmpty(str){
	if(str != null && str.trim() != '' && str.trim().toUpperCase() != 'UNDEFINED'){  
		return true;
	}
	return false;   
}