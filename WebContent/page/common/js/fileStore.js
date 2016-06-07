var loadFileSotreFun = function(businessIdVal, type, container){
	//支持同步调用
	dwr.engine.setAsync(false);
	FileStoreAction.queryFileStoreListByBusinessId(
		{
			businessId:businessIdVal,
			type:type
		},
		function(data){
			if(data){
				//var pathname = window.location.pathname;
				//var projectName= pathname.substring(0,pathname.substr(1).indexOf('/')+1);
			
				var fileArr = data.rows;
				
				var allpcpath="";
				var htm="";
				var checkpc="";
				for(var i=0; i<fileArr.length; i++){
					var file = fileArr[i];
					var pcpath = file.url;
					var pcid = file.id;
					
					htm ="<img id='"+pcid+"' src='"+webRoot+pcpath+"'></img>";
					checkpc = "<input id='"+pcid+"' name='pcpath' type='checkbox' value='"+pcid+"' checked/>";
					allpcpath = htm+checkpc;
					$('#'+container).append(allpcpath);
				}
			}else{
				alert("创建失败");
			}
		}
	);
	//dwr调用
	dwr.engine.setAsync(true);
}

//查询附件
var loadGoodsFileInfo = function(container, businessId, type, flag){
	FileStoreAction.queryFileStoreListByBusinessId({businessId:businessId, type:type}, function(data){
		if(data){
   			var rows = data.rows;
   			var html = "";
   			for(var i=0; i<rows.length; i++){
   				html += "<a href='" + webRoot + rows[i].url + "' style='float: left; margin-right:20px;'>"+rows[i].fileName+"</a>";
   				
   				if(!flag){
   					html += "<a href='javascript:void(0);' onclick='deleteGoodsFileInfo(\""+rows[i].id+"\",\""+container+"\",\""+businessId+"\",\""+type+"\");' style='float:left;  margin-right:20px;'>" +
						"<img src='"+webRoot+"/page/ttw/front/images/delete.png'/>" +
						"</a>";
   				}
   			}
   			
   			$("#"+container).html(html);
   			$("#"+container).show();
   		}
	});
}

var deleteGoodsFileInfo = function (fileId,container, businessId, type){
	FileStoreAction.delFileStore({id:fileId}, function(data){
		loadGoodsFileInfo(container, businessId, type);
	});
}


$(function(){

	//按钮“删除所选图片”事件
	$("#delpc").unbind('click');
	$("#delpc").click(function() {
		var delIds = "";
		var str = "";
		var sum = 0;
		//获取选中的图片拼接id
		$(":checkbox[name='pcpath']").each(function() {
			if ($(this).attr("checked")) {
				sum++;
				delIds += $(this).val() + ",";
				str += this.id + ",";
			}
		});
		if (sum == 0) {
			lhgdialog.alert('只有在选择图片后才能删除');
			return false;
		}
		
		//dwr批量删除图片
		FileStoreAction.delFileStore({id:delIds},function(data){
			if(data){
				var array = new Array();
				array = str.split(",");
				$(array).each(function(k, v) {
					$("#triggers img").remove("img[id=" + v + "]");
					$("#triggers input[name='pcpath']").remove("input[id=" + v + "]");
				});
				
				//商品删除图片时需要重新获取商品第一张图片路径
				try{
					//重新获取第一张图片的路径
					$("#triggers input[name='pcpath']").each(function(index,obj){
						if(index == 0){
							$('#pictureUrl').val($(obj).attr('pcpath'));
						}
					});
				}catch(e){}
				
				forminfo("#alertinfo", "删除图片成功");
			}
		});
		
	});

})




var loadFileSotre = function(businessIdVal, container){
	//支持同步调用
	dwr.engine.setAsync(false);
	FileStoreAction.queryFileStoreListByBusinessId(
		{
			businessId:businessIdVal
		},
		function(data){
			if(data){
				var pathname = window.location.pathname;
				var projectName= pathname.substring(0,pathname.substr(1).indexOf('/')+1);
			
				var fileArr = data.rows;
				
				var html = "";
				for(var i=0; i<fileArr.length; i++){
					var file = fileArr[i];
					html += '<div id="' + file.id + '" class="file-item thumbnail" style="float: left; position:relative;" onclick="downFileFun(this);">';
					html += '<div onclick="deleteFileStore(\"'+file.id+'\");" style="position:absolute; right: 0px; top: 0px; background-color:#0096db; color:white; cursor:pointer">X</div>';
					if(file.suffix == 'jpg' 
						|| file.suffix == 'jpeg' 
						|| file.suffix == 'gif' 
						|| file.suffix == 'png' 
						|| file.suffix == 'bmp'){
						html += '<img src="'+projectName+file.url+'" width="110" height="110">';
					}else if(file.suffix == 'doc' 
						||file.suffix == 'dox'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/docx.png" width="110" height="110">';
					}else if(file.suffix == 'pptx' 
						||file.suffix == 'ppt'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/pptx.png" width="110" height="110">';
					}else if(file.suffix == 'xlsx' 
						||file.suffix == 'xls'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/xlsx.png" width="110" height="110">';
					}else if(file.suffix == 'pdf'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/pdf.png" width="110" height="110">';
					}else if(file.suffix == 'mp3'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/mp3.png" width="110" height="110">';
					}else if(file.suffix == 'avi'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/avi.png" width="110" height="110">';
					}else if(file.suffix == 'rar'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/rar.png" width="110" height="110">';
					}else if(file.suffix == 'vsd'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/vsd.png" width="110" height="110">';
					}else if(file.suffix == 'txt'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/text.png" width="110" height="110">';
					}else if(file.suffix == 'zip'){
						html += '<img src="'+projectName+'/page/common/images/fileStore/zip.png" width="110" height="110">';
					}else{
						html += '<img src="'+projectName+'/page/common/images/fileStore/document.png" width="110" height="110">';
					}
					html += '<div class="info" style="width: 110px; overflow: hidden;" title="'+file.fileName+'">' + file.fileName + '</div>';
			        html += '</div>';
				}
				
	        	$('#'+container).html(html);
	        	//alert($('#imgList').height()+"=="+$('#container').height());
	        	window.parent.document.all.uploadIFrame.height = $('#imgList').height()+$('#container').height()+20;
			}else{
				alert("创建失败");
			}
		}
	);
	//dwr调用
	dwr.engine.setAsync(true);
}

var downFileFun = function(obj){
	alert('下载');
	
}

var deleteFileStore = function(id){
	alert('删除');
	
}
