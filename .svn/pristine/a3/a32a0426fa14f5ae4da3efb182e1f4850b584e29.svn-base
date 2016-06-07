$(function(){
	
	/**
	 * 时间对象的格式化;
	 */
	Date.prototype.format = function(format) {
		var o = {
			"M+" : this.getMonth() + 1, // month
			"d+" : this.getDate(), // day
			"h+" : this.getHours(), // hour
			"m+" : this.getMinutes(), // minute
			"s+" : this.getSeconds(), // second
			"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
			"S" : this.getMilliseconds()
			// millisecond
		};

		if (/(y+)/.test(format)) {
			format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		};

		for (var k in o) {
			if (new RegExp("(" + k + ")").test(format)) {
				format = format.replace(RegExp.$1, RegExp.$1.length == 1? o[k]: ("00" + o[k]).substr(("" + o[k]).length));
			}
		}
		return format;
	};
	
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
	
});