<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
<link type="text/css" rel="stylesheet" href="css/common.css">
<link type="text/css" rel="stylesheet" href="css/information.css">
<link rel="icon" href="img/huangguan.gif"> <link>


</head>
<body>
	<div class="head">
		<div class="head_pic" style="float: left;">
			<img src="img/logo.png" width="90px" height="80px"
				style="margin-left: 30px; vertical-align: middle;"><span>&reg;</span>
		</div>
		<ul style="list-style: none;">
			<li onclick="window.location.href='HomepageServlet'">论坛首页</li>
			<li onclick="window.location.href='aboutus.jsp'">关于</li>
			<li onclick="window.location.href='InformationServlet'">个人中心</li>
			<c:if test="${user!=null&&user.type==1}">
				<li onclick="window.location.href='ManagerCenterServlet'">帖子管理</li>
			</c:if>
		</ul>
		<div class="denglu" id="denglu_text">
			<c:if test="${user == null}">
				<span><span onclick="denglu()"
					style="color: #1E90FF; cursor: pointer">[登录]</span></span>
				<span><a href="register.jsp" style="color: #1E90FF">[注册]</a></span>
			</c:if>
			<c:if test="${user != null}">
				<span
					style="font-size: 20px; width: 150px; color: rgb(45, 128, 218)"
					class="denglu_span" id="denglu_span">欢迎${user.uName}</span>
				<span class="denglu_span"><a href="ExitServlet"
					style="color: #1E90FF">[退出]</a></span>
			</c:if>
		</div>
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center" style="height: 650px">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp; 论坛 &gt; 个人中心</span>
		</div>
		<div class="center_down">
			<div class="pic">
				<img src="photo/${user.uPhoto}" width="150px" height="150px"
					style="margin-top: 3px; margin-left: 5px; float: left;border-radius: 10px;border: 8px solid rgb(255, 255, 255);background: white none repeat scroll 0% 0% padding-box;"> <span
					style="float: left; margin-top: 70px; margin-left: 20px; color: #333; font-size: 18px;">${user.uName}</span>
				<span style="float: left; margin-top: 115px; margin-left: -50px;"
					class="xiugai"> <img src="img/xiugai.png"> <span
					id="change_data" onclick="show2()"
					style="cursor: pointer; color: #5c6573">修改资料</span>
				</span> <span
					style="margin-left: 20px; margin-top: 115px; float: left; color: lightgrey;">|</span>
				<span id="change_pass"
					style="cursor: pointer; margin-top: 115px; float: left; margin-left: 20px; color: #5c6573"
					onclick="show()">修改密码</span> <span
					style="margin-left: 20px; margin-top: 115px; float: left; color: lightgrey;">|</span>
				<span
					style="margin-left: 20px; margin-top: 115px; float: left; color: #5c6573">帖子数[${page.rowTotal}]</span>
			</div>
			<div class="backdiv"></div>
			<div class="info" id="change_passinfo" style="display: none;">
				<div
					style="width: 100%; height: 50px; background-color: rgb(247, 247, 247); color: rgb(102, 102, 102); font-size: 24px; line-height: 50px">
					<img src="img/user_login.png"
						style="margin-left: 10px; margin-right: 10px; vertical-align: middle">修改密码<img
						src="img/close_icon.png"
						style="float: right; margin-right: 10px; margin-top: 9px; cursor: pointer"
						onclick="info_close()">
				</div>
				<!-- <img src="img/close_icon.png"
					style="float: right; color: red; cursor: pointer;"
					onclick="info_close()" /> -->
				<table>
					<tr></tr>
					<tr  style="text-align: center;">
						<td id="alert" colspan="2"></td>
					</tr>
					<tr>
						<td style="text-align: right;"><span
							style="color: red; vertical-align: middle;">*</span>原密码：</td>
						<td width="70%"><input type="password" name="oldpass" id="oldpass"/></td>
					</tr>
					<tr>
						<td style="text-align: right;"><span
							style="color: red; vertical-align: middle;">*</span>新密码：</td>
						<td><input type="password" name="newpass" id="newpass"/></td>
					</tr>

					<tr>
						<td colspan="2" style="text-align: center;">
							<button type="button" style="width: 70px;" onclick="changePassword()">保存</button>
							<button type="button" style="width: 70px;">取消</button>
						</td>
					</tr>
				</table>
			</div>
			<!-- <div id="tishi"><img src="img/smallright.png" style="vertical-align: middle;">修改成功</div> -->
			<div class="info" id="change_info">
				<div
					style="width: 100%; height: 50px; background-color: rgb(247, 247, 247); color: rgb(102, 102, 102); font-size: 24px; line-height: 50px">
					<img src="img/user_login.png"
						style="margin-left: 10px; margin-right: 10px; vertical-align: middle">修改资料<img
						src="img/close_icon.png"
						style="float: right; margin-right: 10px; margin-top: 9px; cursor: pointer"
						onclick="info_close2()">
				</div>
				<!-- <img src="img/close_icon.png"
					style="float: right; color: red; cursor: pointer;"
					onclick="info_close2()" /> -->
				<form action="UploadImageServlet" enctype="multipart/form-data"
					method="post">
					<table>
						<tr></tr>
						<tr></tr>
						<tr>
							<td style="text-align: right; width: 40%;"><span
								style="color: red; vertical-align: middle;">*</span>用户名：</td>
							<td width="70%"><input type="text" name="username" value="${user.uName}"/></td>
						</tr>
						<tr>
							<td style="text-align: right;"><span
								style="color: red; vertical-align: middle;">*</span>邮箱：</td>
							<td><input type="email" name="email" value="${user.email}"/></td>
						</tr>
						<!-- <tr>
						<td style="text-align: right;"><span
							style="color: red; vertical-align: middle;">*</span>原来手机号：</td>
						<td><input type="text" name="oldtel" /></td>
					</tr> -->
						<tr>
							<td style="text-align: right;"><span
								style="color: red; vertical-align: middle;">*</span>手机号：</td>
							<td><input type="text" name="tel" value="${user.tel}"/></td>
						</tr>
						<tr>
							<td style="text-align: right;"><span
								style="color: red; vertical-align: middle;">*</span>图像：</td>
							<td><input type="file" name="image" /></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<button type="submit" style="margin-left: 70px">保存</button>
								<button type="button">取消</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<table class="data" cellpadding="0" cellspacing="0">
				
				<c:forEach items="${tieList}" var="tie">
					<tr>
						<td width="15%" style="font-size: 14px; color: #5c6573;"><span
							style="margin-left: 20px;">${tie.style}</span></td>
						<td width="55%" style="font-size: 14px;"><a
							href="ViewTieServlet?id=${tie.id}&style=${tie.style}">${tie.title}</a></td>
						<td width="30%" style="font-size: 12px; color: #999;">${tie.data}</td>
						<%-- <td width="10%" style="font-size:12px;color:#999;">${tie.name}</td> --%>

					</tr>
				</c:forEach>

			</table>
			<span class="yeshu"> 总页数<em>${page.pageTotal}</em> <c:if
					test="${page.pageCount>1}">
					<a
						href="InformationServlet?count=${page.pageCount-1}&&type=${style}"
						class="fanye">上一页</a>
				</c:if> 第 ${page.pageCount}页 <c:if test="${page.pageCount<page.pageTotal}">
					<a
						href="InformationServlet?count=${page.pageCount+1}&&type=${style}"
						class="fanye">下一页</a>
				</c:if> 总记录数 <em>${page.rowTotal}</em>
			</span>
			<!--<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td><img src="img/animal.jpg" width="150px" height="150px"></td>
						<td>修改资料</td>
						<td>帖子数【0】</td>
					</tr>
					<tr>
						<td colspan="3"></td>
					</tr>
				</table>-->
		</div>

	</div>
	<ul class="side_bar">
		<!-- <li class="side_bar_fatie" ><a href="#tiecontent"><img src="img/side_bar.png" id="inputfocus"></a></li> -->
		<li class="side_bar_top" id="back_to_top"><a href="#top"><img
				src="img/side_bar.png"></a></li>
	</ul>
	<div class="foot">&copy;cit工作室版权所有</div>
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
						list="data" id="email" oninput="emailAuto()"><label
						id="username_lable">账号由"邮箱"登陆</label></td>
				</tr>
				<tr></tr>
				<tr>
					<td style="width: 20%; text-align: right;">密码:</td>
					<td style="width: 80%"><input type="password" class="td_text"
						id="pwd"><label id="username_lable">请填写密码</label></td>
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
</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/aaa.js"></script>
<script type="text/javascript" src="js/showdata_top.js"></script>
<script type="text/javascript" src="js/emailAuto.js"></script>
</html>
