(function($) {
	function login() {
		var account = $("#account").val();
		var password = $("#password").val();
		$.ajax({
			type : "post",
			url : webRoot + "/page/mylogin",
			success : function(data) {
				if (data) {
					var obj = $.parseJSON(data);
					if (obj.flag) {
						window.location = webRoot
								+ "/page/admin/index";
					} else {
						alert(obj.data.error);
						//$("#login_msg_div_id").addClass("show").find("span").html(obj.data.error);
					}
				}
			},
			data : {
				account : account,
				password : password
			},
			error : function(data) {
				alert("登录异常，请联系管理员");
			}
		});
	}
	$("#btn_login").click(login);
})(jQuery);

function keyDownLogin() {
	if (event.keyCode == 13) {
		event.returnValue = false;
		event.cancel = true;
		loginForm.btn_login.click();
	}
}