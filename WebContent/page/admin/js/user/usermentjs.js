
$(function(){
	
	$("#delpc").click(function() {
		var str = "";
		var sum = 0;
		$(":checkbox[name='pcpath']").each(function() {
			if ($(this).attr("checked")) {
				sum++;
				str += this.id + ",";
			}
		});
		if (sum == 0) {
			alert('只有在选择图片后才能删除');
			return false;
		}
		var array = new Array();
		array = str.split(",");
		$(array).each(function(k, v) {
			$("#triggers img").remove("img[id=" + v + "]");
			$("#triggers input[name='pcpath']").remove("input[id=" + v + "]");
		});
	});
	
	updateUserT=function(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var enabled=$("input[name='enabled']:checked").val();
		$.post("/updateUser",{
			"userName":userName,
			"password":password,
			"enabled":enabled
		},function(data){
			if(data.sucflag){
				window.location.href="/page/admin/user/user.jsp?operate=find&folder=user";
				return;
			}
		});
	},
	
	findUserByUserid=function(){
		var userid=$.query.get('userId');
		if(userid==""){
			return false;
		}
		$.post(webRoot+"/getUser",{"userId":userid},function(data){
			if(data.sucflag){
				$('#account').attr("value",data.bean.account);
				$("#password").attr("value",data.bean.password);
				$('#userName').attr("value",data.bean.userName);
				if("1"==data.bean.enabled){
					$("input[name='enabled']").get(0).checked=true;
				}else{
					$("input[name='enabled']").get(1).checked=true;
				}
				$("#password").attr("readonly",true);
				$('#account').attr("readonly",true);
				$('#submit').hide();
				$('#update').show();	
			}
		});
		
	},
	
	
	saveUser=function(){
		var account=$("#account").val();
		if(account==""){
			formwarning("#alerterror", "用户名必须填写");
			return false;
		}
		var password=$("#password").val();
		if(password==""){
			formwarning("#alerterror", "密码必须填写");
			return false;
		}
		if(password.length<7||password.length>16){
			formwarning("#alerterror", "密码长度必须大于等于7位小于16位");
			return false;
		}
		var userName=$("#userName").val();
		if(userName==""){
			formwarning("#alerterror", "用户真实名称必须填写");
			return false;
		}
		var enabled=$("input[name='enabled']:checked").val();
		$.post(webRoot+"/addUser",{
			"account":account,
			"password":password,
			"userName":userName,
			"enabled":enabled
		},function(data){
			if(data.sucflag){
				window.location.href=webRoot+"/page/admin/user/user.jsp?operate=find&folder=user";
				return;
			}else{
				if(data.message!=""){
					formwarning("#alerterror",data.message);
					return false;
				}else{
					formwarning("#alerterror", "用户增加失败");
					return false;
				}
			}
		});
	},
	
	findAllUser=function(){
		$("#usermanagement").flexigrid( {
			url : webRoot+'/page/admin/user/index',
			dataType : 'json',
			cache : false,
			colModel : [ { 
				display:'用户名',
				name:'account',
				width:215,
				sortable:true,
				align:'center'
			},{ 
				display:'真名',
				name:'name',
				width:115,
				sortable:true,
				align:'center'
			},{ 
				display:'账户状态',
				name:'enabled',
				width:115,
				sortable:true,
				align:'center'
			},{ 
				display:'用户是否过期',
				name:'accountNonExpired',
				width:115,
				sortable:true,
				align:'center'
			},{ 
				display:'是否锁定',
				name:'accountNonLocked',
				width:115,
				sortable:true,
				align:'center'
			},{ 
				display:'凭证是否过期',
				name:'accountNonLocked',
				width:115,
				sortable:true,
				align:'center'
			},{ 
				display:'最后登录时间',
				name:'lastLoginDate',
				width:115,
				sortable:true,
				align:'center'
			},{ display:'操作',
				name:'operate',
				width:100,
				sortable:true,
				align:'center'
			}],
			buttons : [ {
				name : '添加',
				bclass : 'add',
				onpress : action
			},{
				name : '编辑',
				bclass : 'edit',
				onpress : action
			},
			//{
			//	name : '修改密码',
			//	bclass : 'edit',
			//	onpress : action
			//},
			{
				name:'删除',
				bclass:'del',
				onpress:action
			},
			//{
			//	name:'激活',
			//	bclass:'edit',
			//	onpress:action
			//},{
			//	name:'设置角色',
			//	bclass:'edit',
			//	onpress:action
			//}
//			,{
//				name:'查看权限',
//				bclass:'edit',
//				onpress:action
//			},
			{
				separator : true
			} ],

			searchitems : [{
				display:'请选择搜索条件',
				name:'sc',
				isdefault : true
			}, {
				display : '用户名',
				name : 'username'
			} ],
			sortname : "registtime",
			sortorder : "desc",
			usepager : true,
			title : '',
			useRp : true,
			rp : 20,
			rpOptions : [ 5, 20, 40, 100 ],
			showTableToggleBtn : true,
			width :'auto',
			height : 'auto',
			pagestat : '显示{from}到{to}条，共{total}条记录',
			procmsg : '正在获取数据，请稍候...',
			checkbox:true
		});
		function action(com, grid){
			if(com=='编辑'){
				if ($('.trSelected', grid).length == 1) {
					var str = $('.trSelected', grid)[0].id.substr(3);
					window.location.href="/page/admin/user/user.jsp?operate=edit&folder=member&userId="+str;
					return;
				} else {
					formwarning("#alerterror", "请选择一条信息");
					return false;
				}
			}else if(com=='删除'){
				if ($('.trSelected', grid).length > 0) {
					var str="";
					$(".trSelected td:nth-child(1) div", $('#usermanagement')).each(function(i){
						str+=this.innerHTML+"  ";
					});
					$("#contentp").text(str);
					$("#delModal").modal({
						keyboard:true,
						show:true,
					});
					$("#btnok").click(function(){
						var str = "";
						$('.trSelected', grid).each(function() {
							str += this.id.substr(3) + ",";
						});
						$.post("DelUsert.action", {
							"userid" : str
						}, function(data) {
							if (data.sucflag) {
								$("#delModal").modal('hide');
								$('#usermanagement').flexReload();
								forminfo("#alertinfo", "删除系统用户成功");
							}
						});
					});
					$("#btnclose").click(function(){
						$("#delModal").modal('hide');
					});
					return;
				} else {
					formwarning("#alerterror", "请选择要删除的信息");
					return false;
				}
			}else if(com=="添加"){
				window.location.href=webRoot+"/page/admin/user/user.jsp?operate=add";
				return;
			}else if(com=="修改密码"){
				if ($('.trSelected', grid).length == 1) {
					var str = $('.trSelected', grid)[0].id.substr(3);
					$.post("findUserById.action",{"userid":str},function(data){
						if(data.beanlist.state!=3 && data.beanlist.state!=2){
							formwarning("#alerterror", "这不是管理员和超级管理员，不能修改");
							return false;
						}else{
							window.location.href="editmember.jsp?session="+session+"#member&userid="+str+"";
						}
					});
				} else {
					formwarning("#alerterror", "请选择一条信息");
					return false;
				}
			}else if(com=='激活'){
				if ($('.trSelected', grid).length == 1) {
					var str = $('.trSelected', grid)[0].id.substr(3);
					var userstate="1";
					$.post("updateUserbyuserstate.action",{"userid":str,"userstate":userstate},function(data){
						if(data.sucflag){
							formwarning("#alertinfo", "操作成功");
							return false;			
						}else{
							formwarning("#alerterror", "操作失败");
							return false;
						}
					});
				} else {
					formwarning("#alerterror", "请选择一条信息");
					return false;
				}
			}else if(com=='设置角色'){
				if ($('.trSelected', grid).length == 1) {
					var str = $('.trSelected', grid)[0].id.substr(3);
					window.location.href="userrole.jsp?operate=edit&folder=user&userid="+str;
				} else {
					formwarning("#alerterror", "请选择一条信息");
					return false;
				}
			}
//			else if(com='查看权限'){
//				//这里要进入权限列表
//				if ($('.trSelected', grid).length == 1) {
//					var str = $('.trSelected', grid)[0].id.substr(3);
//					$.post("findUserRoleMByuserid.action",{"userid":str},function(data){
//						if(data.sucflag){
//							jAlert(data.bean.rolename,"信息提示");
//							return ;				
//						}else{
//							jAlert("操作失败","信息提示");
//							return ;
//						}
//					});
//				} else {
//					formwarning("#alerterror", "请选择一条信息");
//					return false;
//				}
//			}
		}
	}
	
	$("#submit").click(function(){
		saveUser();
	});
	$("#update").click(function(){
		updateUserT();
	});
	
	
  	/**
	 * main logic
	 */
	var operate = $.query.get("operate");
	if (operate == "add") {
		
	}else if(operate=="edit"){
		findUserByUserid();
	}else if(operate=="find"){
		findAllUser();
	}
});
