$(function() {

	//初始化部门下拉框数据 
	initDepartMentDS = function (){
		 $('#parent').multiselect('dataprovider', getDepartMentDS());
	},
	
	getDepartMentDS = function (){ 
		var ds = [];
		$.ajaxSetup({   
            async : false  
        });
		$.post(webRoot+"/page/admin/department/index",{pageNo:1,pageSize:65535},function(data){
			if(data && data.rows.length>0){
				$(data.rows).each(function(i,obj){
					ds.push({label:obj.orgName,value:obj.departmentId});
				});
			}
		});
	    return ds;
	},

	initFormValidator = function (){
		//部门名称必须填写，不能为空
		var departmentName = $("#departmentName").val();
		if(departmentName == ""){
			formwarning("#alerterror", "部门名称必须填写，不能为空");
			return false;
		}
		
		return true;
	},
	
	addDepartmentFun = function (){
		
		if(!initFormValidator()){
			return false;
		}
		$("body").mask("处理中..");
		SysDepartmentAction.addDepartment({
			orgName:$("#orgName").val(),
			parentId:$("#parent").val(),
			orgRemark:$("#orgRemark").val()
			},function(data){
				$("body").unmask();
			if(data){
				//跳转到部门列表页面
				window.location.href = webRoot +"page/platform/department/departmentList.jsp";
			}else{
				formwarning("#alerterror", "新增部门失败");
			}
		});
	},
	
	uppDepartmentFun = function (){
		$("body").mask("处理中..");
		if(!initFormValidator()){
			return false;
		}
		
		SysDepartmentAction.updateDepartment({
				departmentId:$("#departmentId").val(),
				orgName:$("#orgName").val(),
				parentId:$("#parent").val(),
				orgRemark:$("#orgRemark").val()
			},function(data){
				$("body").unmask();
				if(data){
					//跳转到部门列表页面
					window.location.href = webRoot +"page/platform/department/departmentList.jsp";
				}else{
					formwarning("#alerterror", "修改部门失败");
				}
		});
	}
	
	
	
	//按钮“提交”事件
	$("#submit").click(function(){
		addDepartmentFun();
	});
	
	//按钮“更新”事件
	$("#update").click(function(){
		uppDepartmentFun();
	});
	
	
	//根据departmentId查询部门信息
	var findDepartmentByDepartmentId = function(){
		var departmentId = getUrlParam('departmentId');
		if(isNotEmpty(departmentId)){
			
		 	SysDepartmentAction.getDepartment({departmentId:departmentId},function(data){
        		if(data && data.sucflag){
        			var vo = data.bean;
        			$("#departmentId").val(vo.departmentId);
        			$("#orgName").val(vo.orgName);
        			$('#parent').multiselect('select', vo.parentId);
        			$("#orgRemark").val(vo.orgRemark);
					/*
        			//是否可用
        			if(vo.isDel == '0'){
						$("input[name='isDel']").get(0).checked=true;
					}else{
						$("input[name='isDel']").get(1).checked=true;
					}
					*/
        		}
        	});
        	
        	//提交按钮隐藏
        	$("#submit").hide();
        	//更新按钮显示
			$("#update").show();
        }
	}
	
	
	/**
	 * 获取url参数
	 */
	var operate = getUrlParam('operate'); //getUrlParam(id) 函数获取url的参数  id表示url的ke   www.ttw.com?id=xxx
	
	if(operate=="edit"){
		//初始化部门下拉框
		initDepartMentDS();
		
		//绑定部门数据
		findDepartmentByDepartmentId();
	}else if(operate=="add"){
		//初始化部门下拉框
		initDepartMentDS();
	}
});

