<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>论坛首页</title>
<link type="text/css" rel="stylesheet" href="css/homepage.css" />
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="icon" href="img/huangguan.gif"> <link>
</head>
<body>
	<div class="head">
		<div class="head_pic" style="float: left;">
			<img src="img/logo.png" width="90px" height="80px"
				style="margin-left: 30px; vertical-align: middle;"><span>&reg;</span>
		</div>
		<ul style="list-style: none;" id="head_nav">
			<li onclick="window.location.href='HomepageServlet'" title="homepage">论坛首页</li>
			<li onclick="window.location.href='aboutus.jsp'">关于</li>
			<c:if test="${user != null}">
				<li onclick="window.location.href='InformationServlet'" title="information">个人中心</li>
			</c:if>
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
		<div class="search_info">
			<input type="text" name="search_info" oninput="anno()" id="serach"
				list="dataList2" onclick="kuan()" />
			<datalist id="dataList2"> </datalist>

		</div>
		<img src="img/head_search.png"
			style="float: right; margin-top: 30px; margin-right: -258px;cursor:pointer" onclick="serach()"/>
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp;论坛</span>
		</div>
		<div class="daohang" id="showone">
			<div class="smalltitle">
				<ul style="list-style: none;">
					<li id="jingping_li" onmouseover="jingpingView()">精粹品鉴</li>
					<li id="xintie_li" onmouseover="xintieView()">新帖抢先</li>
				</ul>
			</div>
			<div class="daohang2" id="showtwo">
				<table width="100%" cellspacing="0" cellpadding="0">
					<c:forEach items="${jingList}" var="item" varStatus="i">
						<tr style="height: 27px">
							<td style="width: 15%"><span>精 </span><a
								href="TopicServlet?type=${item.tStyle}">[${item.tStyle}]</a></td>
							<td style="width: 40%"><a
								href="ViewTieServlet?id=${item.id}&style=${item.tStyle}">${item.tTitle}</a></td>
							<td style="width: 30%; color: #4c4c4c;">${item.tDate}</td>
							<td style="color: #ff7f3e; width: 15%">${item.tUsername}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="daohang3" id="showthree">
				<table width="100%">
					<c:forEach items="${xinList}" var="item" varStatus="i">
						<tr style="height: 27px">
							<td style="width: 15%"><span><img src="img/new.gif"></span><a
								href="TopicServlet?type=${item.tStyle}">[${item.tStyle}]</a></td>
							<td style="width: 40%"><a
								href="ViewTieServlet?id=${item.id}&style=${item.tStyle}">${item.tTitle}</a></td>
							<td style="width: 30%; color: #4c4c4c;">${item.tDate}</td>
							<td style="color: #f74d4a; width: 15%">${item.tUsername}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="paihang">
			<div class="smalltitle">排行榜</div>
			<div style="width: 100%">
				<table width="100%;border-spacing: 0;">
					<c:forEach items="${userList}" var="item" varStatus="i">
						<tr style="height: 27px">
							<c:if test="${i.count == 1}">
								<td style="width: 10%; text-align: center"><div
										style="width: 26px; height: 26px; border-radius: 13px; background-color: rgb(237, 116, 28); line-height: 26px; color: #fff">${i.count}</div></td>
							</c:if>
							<c:if test="${i.count == 2}">
								<td style="width: 10%; text-align: center"><div
										style="width: 26px; height: 26px; border-radius: 13px; background-color: rgb(243, 172, 39); line-height: 26px; color: #fff">${i.count}</div></td>
							</c:if>
							<c:if test="${i.count == 3}">
								<td style="width: 10%; text-align: center"><div
										style="width: 26px; height: 26px; border-radius: 13px; background-color: rgb(248, 203, 94); line-height: 26px; color: #fff">${i.count}</div></td>
							</c:if>
							<c:if test="${i.count != 1 &&i.count != 2 &&i.count != 3}">
								<td style="width: 10%; text-align: center"><div
										style="width: 26px; height: 26px; border-radius: 13px; background-color: #ccc; line-height: 26px; color: #fff">${i.count}</div></td>
							</c:if>
							<td style="width: 10%"><img src="photo/${item.uPhoto}"
								alt="头像" style="width:20px;height:20px;border-radius: 3px;"></td>
							<td style="width: 40%">${item.uName}</td>
							<td
								style="color: rgb(153, 153, 153); width: 35%; text-align: right; padding-right: 5%">${item.tNum}帖</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="fenlei">
			<div class="smalltitle">社区交流</div>
			<div class="cs">
				<a href="TopicServlet?type=c&#35;"><img id="cs"
					src="img/cIcon.png" style="margin-left: 3px;"></a><span
					style="margin-top: 20px; float: right; margin-right: 200px;">C#</span>
				<span
					style="color: rgb(204, 204, 204); font-size: 14px; float: right; margin-top: -20px; margin-right: 120px">语言
					/ 编程 / 技巧</span>

			</div>
			<div class="cpp">
				<a href="TopicServlet?type=c&#43;&#43;"><img id="cpp"
					src="img/cppIcon.png"></a><span
					style="margin-top: 20px; float: right; margin-right: 200px;">C++</span>
				<span
					style="color: rgb(204, 204, 204); font-size: 14px; float: right; margin-top: -20px; margin-right: 120px">语言
					/ 编程 / 技巧</span>
			</div>
			<div class="java">
				<a href="TopicServlet?type=java"><img id="java"
					src="img/javaIcon.png" style="margin-left: 3px;"></a><span
					style="margin-top: 20px; float: right; margin-right: 200px;">Java</span>
				<span
					style="color: rgb(204, 204, 204); font-size: 14px; float: right; margin-top: -20px; margin-right: 120px">语言
					/ 编程 / 技巧</span>
			</div>

			<div class="js">
				<a href="TopicServlet?type=js"><img id="js" src="img/jsIcon.png"></a><span
					style="margin-top: 20px; float: right; margin-right: 200px;">JS</span>
				<span
					style="color: rgb(204, 204, 204); font-size: 14px; float: right; margin-top: -20px; margin-right: 120px">语言
					/ 编程 / 技巧</span>
			</div>
		</div>
		<div class="qiandao">
			<iframe style="border: none;margin-top: 5px" width="100%" height="200px"  src="date.html"></iframe>
		</div>
	</div>
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
	<datalist id="data"> </datalist>
</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/homepage.js"></script>
<script type="text/javascript" src="js/emailAuto.js"></script>
</html>