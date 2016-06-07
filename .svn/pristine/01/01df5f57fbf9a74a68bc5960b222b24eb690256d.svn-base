$(function() {
	$("#submit").click(function() {
		var account = $("#account").val();
		var oldpass = $("#oldpass").val();
		var pass = $("#pass").val();
		var repass = $("#repass").val();
		if('' == account || null == account){
			lhgdialog.alert('用户账号获取失败，请联系管理员。');
			return false;
		}
		if('' == oldpass || null == oldpass){
			lhgdialog.alert('原密码不能为空。');
			return false;
		}
		if('' == pass || null == pass){
			lhgdialog.alert('新密码不能为空。');
			return false;
		}
		if('' == repass || null == repass){
			lhgdialog.alert('确认新密码不能为空。');
			return false;
		}
		SupplierAction.updateSupplierUserPwd(account, pass, function(val) {
			if (val) {
				$("#oldpass").val("");
				$("#pass").val("");
				$("#repass").val("");
				lhgdialog.tips('密码修改成功',5);
			}else{
				lhgdialog.alert('密码修改失败');
			}
		});
	});
	
	$("#resert").click(function() {
		$("#oldpass").val("");
		$("#pass").val("");
		$("#repass").val("");
	});
	
	// 判断原密码是否正确
	$("#oldpass").blur(function() {
		var account = $("#account").val();
		var password = $("#oldpass").val();
		if (account != '' && account != null && password != null && password != '') {
			SupplierAction.validateOldPwd(account, password, function(val) {
				if (!val) {
					lhgdialog.alert('原密码不正确！请重新输入。');
					$("#oldpass").val("");
				}
			});
		}
	});

	$("#pass").blur(function() {
		var pass = $("#pass").val();
		if (pass != null && pass!="") {
			if (pass.length < 6) {
				lhgdialog.alert("新密码不得少于6位。");
				$("#pass").val("");
				return false;
			}
		}
	});

	$("#repass").blur(function() {
		var pass = $("#pass").val();
		var repass = $("#repass").val();
		if (pass != "" && repass != "" && pass != repass) {
			lhgdialog.alert("两次密码不一致");
			$("#repass").val("");
			return false;
		}
	});
	
	
	$('#pass').keyup(function () { 
		var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g"); 
		var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g"); 
		var enoughRegex = new RegExp("(?=.{1,}).*", "g"); 
	
		if (false == enoughRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-defule'); 
			 //密码小于六位的时候，密码强度图片都为灰色 
		} 
		else if (strongRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-strong'); 
			 //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强 
		} 
		else if (mediumRegex.test($(this).val())) { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass(' pw-medium'); 
			 //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等 
		} 
		else { 
			$('#level').removeClass('pw-weak'); 
			$('#level').removeClass('pw-medium'); 
			$('#level').removeClass('pw-strong'); 
			$('#level').addClass('pw-weak'); 
			 //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的 
		} 
		return true; 
	}); 

});
