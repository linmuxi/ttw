<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>供应商管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysSupplierAction.js"></script>

<script type="text/javascript">
function hideDiv(val){
	var value = $(val).val();
	//1：单位版   0:个人版   
	if(value == "0"){
		$("div[id^='gs_']").hide();
	}else{
		$("div[id^='gs_']").show();
	}
}

//默认选中单位版
$(document).ready(function(){  
        $("input[type=radio][name=supType][value=1]").attr("checked",true);  
});  
</script>  


</head>
<body>
	<div class="container" style="margin-top:55px;">
		<div class="row">
			<div class="col-lg-12">
				<table id="grid-data" class="table table-condensed table-hover table-striped">
				    <thead>
				        <tr>
				            <!-- <th data-column-id="supplierId" style="width: 300px;background-color: red;">ID</th> -->
				            <th data-column-id="supNo">供应商编号</th>
				            <th data-column-id="contractCode">合同号码</th>
				            <th data-column-id="cmbPeopleName">招商人姓名</th>
				            <th data-column-id="supName">供应商名称</th>
				            <th data-column-id="supPhone">供应商电话</th>
				            <th data-column-id="supAddress">供应商地址</th>
				            <!-- 
				            <th data-column-id="supEmail">供应商邮箱</th>
				           	<th data-column-id="supFaxes">供应商传真</th>
				            <th data-column-id="busLicense">供应商营业执照</th>
				             
				            <th data-column-id="bankAccountName">银行账户名称</th>
				            <th data-column-id="bankAccountNO">银行账号</th>
				            <th data-column-id="bankAddress">银行账户地址</th>
				            <th data-column-id="linkPeopleName">联系人姓名</th>
				            <th data-column-id="likePeoplePhone">联系人电话</th>
				            <!-- <th data-column-id="likePeopleQQ">联系人QQ</th>
				            <th data-column-id="likePeopleEmail">联系人邮箱</th>
				            <th data-column-id="likePeopleAddress">联系人地址</th>
				            
				             
				            <th data-column-id="headPeopleName">负责人姓名</th>
				            <th data-column-id="headPeoplePhone">负责人电话</th>
				            <th data-column-id="headPeopleCardNO">负责人身份证号码</th>
				            <!-- <th data-column-id="headPeopleQQ">负责人QQ</th> -->
				            
				            
				            <th data-column-id="supType" data-formatter="supType">供应商类型</th>
				            <!-- <th data-column-id="isDel">是否删除</th> -->
				            <!-- <th data-column-id="remark">备注</th> -->
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="supDetail" tabindex="-1" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="supDetailTitle"></h4>
	         </div> 
	         <div class="modal-body">
	         	<iframe width="100%" height="450px" frameborder="0" id="supDetailIframe"></iframe>
	         </div>   
	      </div> 
		</div>
	</div>
	
	
	<!-- 供应商编辑 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="supplierForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	            <h4 class="modal-title" id="supplierFormTitle"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form" id="supplierForm">
	         		<input type="hidden" name="supplierId" id="supplierId"/>	
	         		<div class="form-group">
				      <div class="col-sm-offset-3 col-sm-9">
				         <div class="radio">
				            <label>
				               <input type="radio" name="supType" id="supType1" value="1" checked="checked" onclick="hideDiv(this)"> 公司
				            </label>
				            <label>
				               <input type="radio" name="supType" id="supType2" value="0" onclick="hideDiv(this)"> 个人
				            </label>
				         </div>
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">合同编码：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="contractCode" name="contractCode" placeholder="请输入合同编码">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">招商人姓名：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="cmbPeopleName" name="cmbPeopleName" placeholder="请输入招商人姓名">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">供应商名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="supName" name="supName" placeholder="请输入供应商名称">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">供应商电话：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="supPhone" name="supPhone" placeholder="请输入供应商电话" >
				      </div>
				   </div>
				    <div class="form-group">
				      <label  class="col-sm-3 control-label">供应商地址：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="supAddress" name="supAddress" placeholder="请输入供应商地址">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">供应商邮箱：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="supEmail" name="supEmail">
				      </div>
				   </div>
				   
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">供应商传真：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="supFaxes" name="supFaxes">
				      </div>
				   </div>
				   <div class="form-group" id="gs_">
				      <label  class="col-sm-3 control-label">供应商营业执照：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="busLicense" name="busLicense">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">银行账户名称：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="bankAccountName" name="bankAccountName">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">银行账号：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="bankAccountNo" name="bankAccountNo">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">银行账户地址：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="bankAddress" name="bankAddress">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">联系人姓名：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="linkPeopleName" name="linkPeopleName">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">联系人电话：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="linkPeoplePhone" name="linkPeoplePhone">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">联系人QQ：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="linkPeopleQQ" name="linkPeopleQQ">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">联系人邮箱：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="linkPeopleEmail" name="linkPeopleEmail">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">联系人地址：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="linkPeopleAddress" name="linkPeopleAddress">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">负责人姓名：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="headPeopleName" name="headPeopleName">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">负责人电话：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="headPeoplePhone" name="headPeoplePhone">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">负责人身份证号：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="headPeopleCardNo" name="headPeopleCardNo">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">负责人QQ：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="headPeopleQQ" name="headPeopleQQ">
				      </div>
				   </div>
				   <div class="form-group">
				      <label  class="col-sm-3 control-label">负责人邮箱：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="headPeopleEmail" name="headPeopleEmail">
				      </div>
				   </div>
				   <div class="form-group">
				      <label class="col-sm-3 control-label">备注：</label>
				      <div class="col-sm-9">
    					 <textarea class="form-control" rows="3" id="remark" name="remark" ></textarea>   
				      </div>
				   </div>
				</form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary" id="btn_supplier_submit">提交</button>
	         </div>
	      </div>
		</div>
	</div>
</body>
<!-- 供应商列表js文件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/page/admin/js/supplier/supplierList.js"></script>
</html>