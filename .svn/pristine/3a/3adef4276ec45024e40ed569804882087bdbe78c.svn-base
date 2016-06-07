<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   商品上架申请详情
   @author lihui
   @since  2015年7月17日 下午3:04:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品上架申请详情</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/page/common/js/ckeditor/ckeditor.js"></script>

<script src="${ctx}/dwr/interface/GoodsAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" role="form" id="goodsForm">
	         	   <input type="hidden" id="id" name="id" >
	         	   <input type="hidden" id="grade" name="grade" >
	         	
				   <div class="form-group">
				      <label class="col-sm-3 control-label">商品名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="goodsName" name="goodsName" 
				            placeholder="请输入商品名称">
				      </div>
				   </div>
				   <div class="form-group">
				      <label class="col-xs-3 control-label">分类：</label>
				      <div class="col-sm-3">
				        	<select id="goodsCategoryId" class="form-control">
				        		<option value="">--请选择--</option>
				        	</select>
				      </div>
				      <label class="col-sm-3 control-label">品牌：</label>
				      <div class="col-sm-3">
				        	<select id="brandId" class="form-control">
				        		<option value="">--请选择--</option>
				        	</select>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-xs-3 control-label">价格：</label>
				      <div class="col-xs-3">
    					 <input type="text" class="form-control" id="price" name="price" 
				            placeholder="请输入商品价格">
				      </div>
				      <label for="lastname" class="col-xs-3 control-label">会员价格：</label>
				      <div class="col-xs-3">
    					 <input type="text" class="form-control" id="memberPrice" name="memberPrice" 
				            placeholder="请输入会员价格">
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-xs-3 control-label">数量：</label>
				      <div class="col-xs-3">
    					 <input type="text" class="form-control" id="quantity" name="quantity" 
				            placeholder="请输入商品数量">
				      </div>
				      <label for="lastname" class="col-xs-3 control-label">单位：</label>
				      <div class="col-xs-3">
    					 <input type="text" class="form-control" id="unitName" name="unitName" 
				            placeholder="请输入单位">
				      </div>
				   </div>
				   <div class="form-group">
				      <div class="col-sm-offset-3 col-sm-3">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="isNew" id="isNew" checked="checked" value="1">是否新品
				            </label>
				         </div>
				      </div>
				      <div class="col-sm-offset-3 col-sm-3">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="isSpecificationsOpen" 
				               id="isSpecificationsOpen" checked="checked" value="1">是否上架
				            </label>
				         </div>
				      </div>
				   </div>
				   <div class="form-group">
				      <label class="col-sm-3 control-label">排序：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="sort" name="sort" 
				            placeholder="请输入排序">
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">商品关键字：</label>
				      <div class="col-sm-9">
    					 <textarea class="form-control" rows="3" placeholder="请输入商品关键字"
    					 id="keywordName" name="keywordName" ></textarea>   
				      </div>
				   </div>
				   <div class="form-group">
				   	  <label for="lastname" class="col-sm-3 control-label">商品图片：</label>
				   	  <div class="col-sm-9" id="uploadDiv">
				   	  	保存后，编辑可上传商品图片！
				   	  	<%--
					   	<jsp:include page="/page/common/page/upload/uploadFileCommon.jsp?iframeWidth=420&businessHidden=id"></jsp:include>
				   	  	 --%>
				      </div>
				   </div>
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">商品介绍：</label>
				      <div class="col-sm-9">
    					 <textarea rows="3"
    					 id="intro" name="intro" ></textarea>   
				      </div>
				   </div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var initCategory = function(){
			GoodsAction.initGoodsCategory(
				{},
				function(data){
					if(data){
						var html = "";
						for(var i=0; i<data.CATEGORY.length; i++){
							var gategoryObj = data.CATEGORY[i];
							var grade = gategoryObj.grade;
							var nameStartChar = "";
							
							if(grade != ""){
								var gradeNum = parseInt(grade);
								for(var j=0; j<gradeNum; j++){
									if(j == 0){
										nameStartChar += " └";
									}else{
										nameStartChar += "－";
									}
								}
							}
							
							html += "<option value=\""+gategoryObj.id+"\">";
							html += nameStartChar + gategoryObj.name;
							html += "</option>";
						}
						$('#goodsCategoryId').append(html);
					}else{
						alert("加载失败");
					}
				}
			);
		}
		
		var initBrand = function(){
			GoodsAction.initBrand(
				{},
				function(data){
					if(data){
						var html = "";
						for(var i=0; i<data.BRAND.length; i++){
							var brandObj = data.BRAND[i];
							html += "<option value=\""+brandObj.id+"\">";
							html += brandObj.brandName;
							html += "</option>";
						}
						$('#brandId').append(html);
					}else{
						alert("加载失败");
					}
				}
			);
		}
		
		var initIntro = function(){
			CKEDITOR.replace('intro');
		}
		
		//支持同步调用
		dwr.engine.setAsync(false);
		//加载分类下拉框选项
		initCategory();
		
		//加载品牌下拉框选项
		initBrand();
		
		//加载商品介绍富文本域
		initIntro();
		//dwr调用
		dwr.engine.setAsync(true);
		
		//业务主键
		var goodsId = "${param.id}"; 
		if(isNotEmpty(goodsId)){
			//VacationRequestAction.getVacationRequest({id:id},function(data){
        	//	if(data && data.sucflag){
        	//		$("#vqForm").fillFormData(data.bean);
        	//	}
        	//});
        	
        	GoodsAction.getGoods({id:goodsId},function(data){
        		if(data && data.result){
        			var vo = data.result;
        			
        			$("#id").val(goodsId);
        			$("#goodsName").val(vo.goodsName ? vo.goodsName : '');
        			$("#goodsCategoryId").val(vo.goodsCategoryId ? vo.goodsCategoryId : '');
        			$("#brandId").val(vo.brandId ? vo.brandId : '');
        			$("#price").val(vo.price ? vo.price : '');
        			$("#memberPrice").val(vo.memberPrice ? vo.memberPrice : '');
        			$("#quantity").val(vo.quantity ? vo.quantity : '');
        			$("#unitName").val(vo.unitName ? vo.unitName : '');
        			$("#isNew").prop('checked', (vo.isNew ? vo.isNew : ''));
        			$("#isSpecificationsOpen").prop('checked', (vo.isSpecificationsOpen ? vo.isSpecificationsOpen : ''));
        			$("#sort").val(vo.sort ? vo.sort : '');
        			$("#keywordName").val(vo.keywordName ? vo.keywordName : '');
        			
        			CKEDITOR.instances.intro.setData(vo.intro ? vo.intro : '');
        		}
        	});
        }
		
		/*****走流程的工单必须定义下面两个方法*****/
		//返回业务表单数据
		function getFormData(){
			return $("#goodsForm").serializeObject();
		}
		//返回业务表单key，用于在流程中通过该key获取业务表单值
		/* function getFormKey(){
			return "vacationRequest";
		} */
	</script>
</body>
</html>