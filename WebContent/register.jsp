<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<title>注册页面</title>
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" rel="stylesheet" href="css/register.css" />
<link rel="icon" href="img/huangguan.gif"> <link>
</head>

<body onload="document.getElementById('username').focus()">
	<div class="head">
		<div class="head_pic" style="float: left;">
			<img src="img/logo.png" width="90px" height="80px" style="margin-left: 30px;vertical-align: middle;"><span>&reg;</span>
		</div>
		<ul style="list-style: none;">
			<li>论坛首页</li>
			<li onclick="window.location.href='aboutus.jsp'">关于</li>
		</ul>
		<div class="denglu">
			<span onclick="denglu()" style="color: #1E90FF; cursor: pointer">[登录]</a></span><span><a href="register.jsp" style="color: #1E90FF">[注册]</a></span>
		</div>
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">  &gt; 用户注册</span>
		</div>
		<div class="center_info">
			<form action="RegisterServlet" method="post">
				<table class="register">
					<tr>
						<td class="td_left"><span>*</span>用户名：</td>
						<td><input type="text" name="username" class="td_text"
							id="username" onfocus="usernameTishi()" onblur="usernameCheck()" ><label
							id="username_lable"></label></td>
					</tr>
					<tr>
						<td class="td_left"><span>*</span>密码：</td>
						<td><input type="password" name="pwd" class="td_text"
							id="pwd" onfocus="pwdTishi()" onblur="pwdCheck()"><label
							id="pwd_lable"></label></td>
					</tr>
					<tr>
						<td class="td_left"><span>*</span>确认密码：</td>
						<td><input type="password" name="re_pwd" class="td_text"
							id="re_pwd" onfocus="re_pwdTishi()" onblur="re_pwdCheck()"><label
							id="re_pwd_lable"></label></td>
					</tr>
					<tr>
						<td class="td_left"><span>*</span>Email：</td>
						<td><input type="text" name="email" class="td_text"
							id="email" onfocus="emailTishi()" onblur="emailCheck()" list="data" oninput="emailAuto()"><label
							id="email_lable"></label></td>
					</tr>
					<tr>
						<td class="td_left"><span>*</span>Tel：</td>
						<td><input type="text" name="tel" class="td_text" id="tel"
							onfocus="telTishi()" onblur="telCheck()" ><label
							id="tel_lable"></label></td>
					</tr>
					<tr>
						<td class="td_left"></td>
						<td><button type=submit class="td_text" style="background-color:rgb(63,137,236);width:120px;height:30px;border:1px solid rgb(63,137,236);color:#ffffff;font-size:16px;text-align:center;margin-left:35px">保  存</button></td>
				</table>
			</form>
		</div>
	</div>
	<div class="foot">cit工作室版权所有</div>
	<div class="dengluDiv"></div>
	<div class="loginDiv">
		<div
			style="width: 100%; height: 50px; background-color: rgb(247, 247, 247); color: rgb(102, 102, 102); font-size: 24px; line-height: 50px">
			<img src="img/user_login.png"
				style="margin-left: 10px; margin-right: 10px; vertical-align: middle">用户登录<img
				src="img/close_icon.png"
				style="float: right; margin-right: 10px; margin-top: 9px; cursor: pointer"
				onclick="denglu_close()">
		</div>
		<div style="width: 100%">
			<table style="width: 100%; margin-top: 40px">
				<tr>
					<td style="width: 20%; text-align: right;">账号:</td>
					<td style="width: 80%"><input type="text" class="td_text"
						list="data" id="login_email" oninput="emailAuto()"><label
						id="username_lable">账号由"邮箱"登陆</label></td>
				</tr>
				<tr></tr>
				<tr>
					<td style="width: 20%; text-align: right;">密码:</td>
					<td style="width: 80%"><input type="password" class="td_text"
						id="password"><label id="username_lable">请填写密码</label></td>
				</tr>
				<tr>
					<td style="width: 20%; text-align: right;"></td>
					<td style="width: 80%"><input type="button" value="登录"
						onclick="login()"
						style="width: 110px; height: 30px; border: none; cursor: pointer; background-color: rgb(63, 137, 236); font-size: 20px; color: #fff; margin-top: 20px; margin-left: 20px; border-radius: 5px;">
						<a href="register.jsp"
						style="color: rgb(245, 83, 82); margin-left: 10px;">立即注册</a></td>
				</tr>

			</table>
		</div>
	</div>
	<datalist id="data">
	</datalist>
</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>
<script type="text/javascript" src="js/emailAuto.js"></script>
</html>