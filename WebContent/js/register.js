function usernameTishi() {
	var ul = $("#username_lable");
	ul.html("用户名由3到5个字符组成");
	ul.css("color", "");
}

function usernameCheck() {
	var username = $("#username").val();
	if (username.length >= 3 && username.length <= 15) {
		var ul = $("#username_lable");
		ul.html("");
	} else if (username.length < 3) {
		var ul = $("#username_lable");
		ul.html("用户名不得小于 3 个字符");
		ul.css("color", "#f00");
	} else if (username.length > 15) {
		var ul = $("#username_lable");
		ul.html("用户名不得大于 15 个字符");
		ul.css("color", "#f00");
	}
}

function pwdTishi() {
	var pl = $("#pwd_lable");
	pl.html("请填写密码, 最小长度为 6 个字符");
	pl.css("color", "");
}

function pwdCheck() {
	var pwd = $("#pwd").val();
	if (pwd.length >= 6) {
		var pl = $("#pwd_lable");
		pl.html("");
	} else if (pwd.length < 6) {
		var pl = $("#pwd_lable");
		pl.html("密码不得小于 6个字符");
		pl.css("color", "#f00");
	}
}

function re_pwdTishi() {
	var re_pl = $("#re_pwd_lable");
	re_pl.html("请再次输入密码");
	re_pl.css("color", "");
}

function re_pwdCheck() {
	var re_pwd = $("#re_pwd").val();
	var pwd = $("#pwd").val();
	if (re_pwd == pwd) {
		var re_pl = $("#re_pwd_lable");
		re_pl.html("");
	} else {
		var re_pl = $("#re_pwd_lable");
		re_pl.html("两次输入的密码不一致,请重新输入");
		re_pl.css("color", "#f00");
	}
}

function emailTishi() {
	var el = $("#email_lable");
	el.html("请输入正确的邮箱地址");
	el.css("color", "");
}

function emailCheck() {
	var email = $("#email").val();
	var el = $("#email_lable");
	if (email == "") {
		el.html("邮箱地址不能为空!");
		el.css("color", "#FF0000");
	} else if (!$("#email")
			.val()
			.match(
					/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)) {
		el.html("<font color='red'>邮箱格式不正确！请重新输入！</font>");
	}else{
		el.html("");
	}
}

function telTishi() {
	var tl = $("#tel_lable");
	tl.html("请输入电话号码");
	tl.css("color", "");

}
function telCheck() {
	var tel = $("#tel").val();
	tl = $("#tel_lable");
	if (tel == "") {
		tl.html("手机号码不能为空！");
		tl.css("color", "#FF0000");
	} else if (!tel.match(/^1[3|4|5|8]\d{9}$/)) {
		tl.html("手机号码格式不正确！请重新输入！");
		tl.css("color", "#FF0000");
	}else{
		tl.html("");
	}
}

function denglu() {
	$(".dengluDiv").css("display", "block");
	$(".loginDiv").css("display", "block");
}

function denglu_close() {
	$(".dengluDiv").css("display", "none");
	$(".loginDiv").css("display", "none");
}

/* 登陆验证 */
function login() {
	var email = $("#login_email").val();
	var pwd = $("#password").val();
	$
			.ajax({
				url : "LoginServlet?email=" + email,
				type : 'POST',
				dataType : 'json',
				success : function(data) {
					if (data == null) {
						alert("用户未注册!")
					} else if (data.uPwd == pwd) {
						window.location.href="HomepageServlet";
					} else{
						alert("密码不正确！");
					}
				},
				error : function() {

				}

			});
}
