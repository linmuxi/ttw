<%--
   Copyright 2015 the original author or phly.
        未经正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 --%>
<%--
   	权限列表
   @author wanglong
   @since  2015年6月19日 下午3:03:41
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
<jsp:include page="/page/common/common.jsp"></jsp:include>
<jsp:include page="/page/common/page/bootstrap.jsp"></jsp:include>
<script src="${ctx}/dwr/interface/SysAuthorityAction.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="table-responsive">
				<table id="authorityGrid" class="table table-condensed table-hover table-striped" >
				    <thead>
				        <tr>
				            <!-- <th data-column-id="authorityId" style="width: 300px;background-color: red;">权限ID</th>  --> 
				           	<th data-column-id="authorityMark">权限标识</th>
				           	<th data-column-id="authorityName">权限名称</th>
				            <th data-column-id="authorityDesc">权限说明</th>
				            <th data-column-id="message">提示信息</th>
				            <th data-column-id="enable" data-formatter="enable">是否可用</th>
				            <th data-column-id="lastUpdateDate"  data-formatter="dateFormat">最后修改时间</th>
         				    <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
				        </tr>
				    </thead>     
				</table>
			</div>
		</div>
	</div>
	
	<!-- 权限编辑 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="authorityForm" aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog">  
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="authorityFormTitle"></h4>
	         </div>
	         <div class="modal-body">
	         	<form class="form-horizontal" role="form" id = "authorityForm">
				   <div class="form-group">
				   	<input type="hidden" id="authorityId" name="authorityId"/>
				      <label for="firstname" class="col-sm-3 control-label">权限标识：</label>
				      <div class="col-sm-9">
				         <input type="text" class="form-control" id="authorityMark" name="authorityMark" 
				            placeholder="请输入权限标识">
				      </div>
				   </div>
				   
				   
				
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">权限名称：</label>
				      <div class="col-sm-9">
    						 <input type="text" class="form-control"  placeholder="请输入权限名称"
    					 id="authorityName" name="authorityName" ></input>   
				   	</div>
				   </div>
				   
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">提示信息：</label>
				      <div class="col-sm-9">
    						 <input type="text" class="form-control"  placeholder="请输入提示信息"
    					 id="message" name="message" ></input>   
				   	</div>
				   </div>
				
				   
				   <div class="form-group">
				      <label for="lastname" class="col-sm-3 control-label">权限说明：</label>
				      <div class="col-sm-9">
    						 <textarea class="form-control" rows="3" placeholder="请输入权限说明"
    					 id="authorityDesc" name="authorityDesc" ></textarea>   
				   	</div>
				   </div>
			
			 	<div class="form-group">
				      <div class="col-sm-offset-3 col-sm-9">
				         <div class="checkbox">
				            <label>
				               <input type="checkbox" name="enable" id="enable" checked="checked"> 是否可用
				            </label>
				         </div>
				      </div>
				   </div>
				</form>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	            <button type="button" class="btn btn-primary" id="btn_authority_submit">提交</button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
<!-- 部门列表js文件 -->
<script type="text/javascript" src="${ctx}/page/admin/js/authority/authorityList.js"></script>
</body>
</html>