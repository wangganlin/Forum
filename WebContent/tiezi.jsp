<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<title>发表帖子</title>
<link rel="shortcut icon" href="img/louzhu.png" type="image/x-icon"/>
<link type="text/css" rel="stylesheet" href="css/tiezi.css" />
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="icon" href="img/huangguan.gif"> <link>
</head>
<body>
	<div class="head">
		<div class="head_pic" style="float: left;">
			<img src="img/logo.png" width="90px" height="80px" style="margin-left: 30px;vertical-align: middle;"><span>&reg;</span>
		</div>
		<ul style="list-style: none;" id="head_nav">
			<li onclick="window.location.href='HomepageServlet'">论坛首页</li>
			<li onclick="window.location.href='aboutus.jsp'">关于</li>
			<c:if test="${user != null}">
				<li onclick="window.location.href='InformationServlet'">个人中心</li>
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
				<span style="font-size: 20px; width: 150px;color:rgb(45,128,218)" class="denglu_span"
					id="denglu_span">欢迎${user.uName}</span>
				<span class="denglu_span"><a href="ExitServlet" style="color: #1E90FF">[退出]</a></span>
			</c:if>
		</div>
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center" style="height: auto;">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp;论坛 &gt; 帖子</span>
		</div>
		<div class="fatie">
			<div class="fatie_img" onclick="window.location.href='#huifutiezi'">
				<span>回复帖子</span> 
			</div>
			<div class="fanhuilist" onclick="window.location.href='TopicServlet?type=${tie.tStyle}'">
				<span style="margin-top: 6px;">返回列表</span>
			</div>

		</div>
		<div class="middle">
			<div class="infomation">
				<div class="louzhu_img"></div>
				<div class="img_div">
					<img src="photo/${user1.uPhoto}" width="110px" height="110px" />
				</div>
				<div class="information_name">${user1.uName}</div>
			</div>
			<div class="content">${tie.tContent}
				<div class="content_bottom">
					<span>1楼 </span> <span>${tie.tDate} </span> <span><a
						href="#huifutiezi">回复</a></span>
				</div>
			</div>
		</div>
		<c:forEach items="${commentList}" var="item" varStatus="i">
			<div class="middle" id="middle${i.count}">
				<div class="infomation">
					<div class="img_div">
						<img src="photo/${usertList[i.count-1].uPhoto}" width="110px"
							height="110px" />
					</div>
					<div class="information_name">${usertList[i.count-1].uName}</div>
					<input type="hidden" value="${usertList[i.count-1].uName}" id="comment_name${i.count}">
					<input type="hidden" value="${item.id}" id="commentId${i.count}">
				</div>
				<div class="content" id="tie_content">${item.cContent}
					<div class="content_bottom">
						<span>${i.count + 1}楼 </span> <span>${item.cDate} </span>
						<lable id="huifu${i.count}">
						<span
							onclick="huifuCommentView('${i.count}')"
							style="color: #1E90FF; cursor: pointer">回复</span></lable>
					</div>
				</div>
			</div>
			<div class="content_huifu" id="contentHuifu${i.count}">  <!-- 回复列表 -->
				<div style="width: 100%;">
					<table id="huifuTable${i.count}" style="width: 60%;margin-left: 39%;border-collapse: collapse;">
						<c:forEach items="${map[item.id]}"  var="imap" varStatus="j">
							<tr>
								<td>${imap.hUersname} 回复 ${imap.cUsername}:</td>
								<td>${imap.hContent}</td>
								<td>${imap.hDate}</td>
								<td><span style="color: #1E90FF; cursor: pointer" onclick="huifuhuifu('${imap.hUersname}','${i.count}','${item.id}')">回复</span></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div style="width: 100%;height:80px" id="huifuDiv${i.count}">        <!-- 回复框 -->
					<input type="text" id="huifuText${i.count}" style="width: 600px;height:40px;font-size: 20px"><br/>
					<span class="fasong" onclick="sendHuifu('${usertList[i.count-1].uName}','${i.count}','${item.id}')">发送</span>
					<%-- <input type="button" value="发送" onclick="sendHuifu('${usertList[i.count-1].uName}','${i.count}','${item.id}')"> --%>
				</div>
				
			</div>
		</c:forEach>
		<div class="huifutiezi" id="huifutiezi">
			<div class="huifu_main">
				<div style="width: 100%">发表回复</div>
				<div
					style="width: 100% -2px; height: 240px; margin-top: 20px; border: 1px solid rgb(223, 223, 223); background-color: rgb(250, 250, 250)">
					<div id="fabiaoComment"
						style="width: 90%; height: 190px; margin-top: 25px; margin-left: 5%; border: 1px solid rgb(204, 204, 204); background-color: #fff;text-align: center;line-height: 190px;color: rgb(204, 204, 204)">
						<c:if test="${user == null}">
							<span>您还没有登录,不能进行回复！<span onclick="denglu()"
								style="color: #1E90FF; cursor: pointer">登录</span></span>
						</c:if>
						<c:if test="${user != null}">
							<textarea id="tie_comment" style="width: 100%; height: 100%;resize:none;"></textarea>
						</c:if>
					</div>
				</div>
				<input type="hidden" value="${tie.id}" id="tieId"/> 
				<input type="hidden" value="${user.uName}" id="username"/>
				<div style="width: 100%; margin-top: 10px" id="fabiaoButton">
					<c:if test="${user == null}">
						<div
							style="width: 60px; height: 30px; background-color: rgb(223, 223, 223); text-align: center; line-height: 30px; border-radius: 5px; cursor: not-allowed; color: rgb(153, 153, 153)">
							发表</div>
					</c:if>
					<c:if test="${user != null}">
						<div onclick="huifutiezi()"
							style="width: 60px; height: 30px; background-color: rgb(62, 137, 250); text-align: center; line-height: 30px; border-radius: 5px; cursor: pointer; color: #fff">
							发表</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<ul class="side_bar">
		<!-- <li class="side_bar_fatie" ><a href="#tiecontent"><img src="img/side_bar.png" id="inputfocus"></a></li> -->
		<li class="side_bar_top" id="back_to_top"><a href="#top"><img src="img/side_bar.png" ></a></li>
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
						id="email"><label id="username_lable">账号由"邮箱"登陆</label></td>
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
						style="width: 110px; height: 30px; border: none; cursor: pointer; background-color: rgb(63, 137, 236); font-size: 20px; color: #fff;margin-top:20px;margin-left:20px;border-radius: 5px;">
					<a href="register.jsp" style="color:rgb(245,83,82);margin-left:10px;">立即注册</a>
					</td>
				</tr>
				
			</table>
		</div>
	</div>

</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/tiezi.js"></script>
<script type="text/javascript" src="js/showdata_top.js"></script>
</html>