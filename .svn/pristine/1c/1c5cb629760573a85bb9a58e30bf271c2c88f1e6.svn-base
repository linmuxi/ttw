/*
 * Copyright 2015 the original author or phly.
 * 未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 */
/**
 *
 * @Description: 扩展jquery函数
 * @author linyong
 * @since 2015年6月7日 上午12:12:48
 *
 */
;(function($){

	/**
	 * 序列化表单数据为json格式
	 */
	$.fn.serializeObject = function()    
	{    
	   var o = {};    
	   var a = this.serializeArray();    
	   $.each(a, function() {    
	       if (o[this.name]) {    
	           if (!o[this.name].push) {    
	               o[this.name] = [o[this.name]];    
	           }    
	           o[this.name].push(this.value || '');    
	       } else {    
	           o[this.name] = this.value || '';    
	       }    
	   });    
	   return o;    
	};

	/**
	 * 填充表单值
	 */
	$.fn.fillFormData = function(data){
		var _formThis = this;
		$.each(data,function(key){
			var field = _formThis.find("#"+key);
			if(field && field.length > 0){
				var type = field.attr("type");
				if(isNotEmpty(type)){
					if(type.toUpperCase() == "TEXT" || type.toUpperCase() == "HIDDEN"
						 || type.toUpperCase() == "PASSWORD"){
						field.val(data[key]);
					}else if(type.toUpperCase() == "CHECKBOX" || type.toUpperCase() == "RADIO"){
						field.attr("checked", true);
					}else if(type.toUpperCase() == "FILE"){
					}else if(type.toUpperCase() == "IMAGE"){
					}
				}else{
					var tagName = field[0].tagName;
					if(tagName.toUpperCase() == "TEXTAREA"){
						field.val(data[key]);
					}
				}
			}
		});
	};
	
	/**
	   自适应iframe高度
	   @param opts : {extendHeight,extendWidth}
	**/
	$.prototype.resizeIframe = function(opts,callback){
		var defaultOpts = $.extend({extendHeight:0},opts);
		this.load(function(){ 
			var _this = this;
			_this.height = 0;
			_this.height = _this.contentDocument.documentElement.scrollHeight + defaultOpts.extendHeight;
			callback.call(this);
		});
	};
})(jQuery);