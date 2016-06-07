$(function() {
	/**
	 * 增加产品分类
	 */
	addBanner = function(){
		//dwr产品分类
		
		if(isNaN($("#sort").val())){
			formwarning("#alerterror", "排序只能为数值");
			return;
		}
		
		$("body").mask("处理中...");
		BannerAction.addBanner(
			{
				id:$("#id").val(),
				name:$("#name").val(),
				descript:$("#descript").val(),
				sort:$("#sort").val(),
				href:$("#href").val(),
				page:$("#page").val(),
				pageIdx:$("#pageIdx").val()
			},
			function(data){
				if(data && data.result){
					//跳转到产品分类列表页面
					window.location.href = webRoot +"page/ttw/manage/banner/bannerList.jsp";
				}else{
					alert("创建失败,"+data.remark);
				}
				$("body").unmask();
			}
		);
	},
	//按钮“提交”事件
	$("#submit").click(function(){
		addBanner();
	});
});

