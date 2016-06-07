/**
 * 扩展jQuery方法
 */

//扩展分页方法，提供上一页和下一页方法
$.paginate = function(paginateId){
	var _targetPaginate = $(paginateId);
	if(_targetPaginate.length == 0){
		return;
	}
	return $.extend(_targetPaginate,{
		getCurrentNode:function(){
			return _targetPaginate.find(".jPag-pages li .jPag-current");
		},
		getCurrentIndex:function(){
			return this.getCurrentNode().html();
		},
		nextPage:function(){
			var _parentLi = this.getCurrentNode().parent();
			if(_parentLi.next().length > 0){
				_parentLi.next().click();
			}else{
				//alert("已经最后一页了"); 
			}
		},
		prevPage:function(){
			var _parentLi = this.getCurrentNode().parent();
			if(_parentLi.prev().length > 0){
				_parentLi.prev().click();
			}else{
				//alert("已经首页了");
			}
		},
		destroy:function(){
			$('.jPaginate').children().remove();
		}
	});
};