<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>具体帖子</title>
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/showdata.css" />
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
				<span class="denglu_span"><a href="ExitServlet"
					style="color: #1E90FF">[退出]</a></span>
			</c:if>
		</div>
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center" style="height: auto">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp;论坛  &gt; ${style}</span>
		</div>
		<div class="center_content">
			<div class="tupian">
			<c:if test="${style=='c#'}">
				<img src="img/cppbig.png" style="margin-left: 10px; margin-top: 10px;" />
			</c:if>
			<c:if test="${style!='c#'}">
				<img src="img/${style}big.png" style="margin-left: 10px; margin-top: 10px;" />
			</c:if>
					<span style="display:block;margin-top:-60px;margin-left:100px;font-size:20px;color:#333;">${style}社区</span>
					<span style="display:block;margin-top:10px;margin-left:100px;font-size:14px;color:#4c4c4c;">${style}不仅是编程，更是艺术</span>
			</div>
			<div class="kantie">
				<ul style="list-style: none;">
					<li style="background-color: rgb(221, 224, 227);">看帖</li>
					<!-- <li style="margin-left: -5px;">精帖</li> -->
				</ul>
				<!-- <div class="searchtie">
					<input type="text" name="searchtie" placeholder="查找帖子" /> <img
						src="img/search.png"
						style="float: right; margin-right: 8px; margin-top: 5px;">
				</div> -->
				<div class="tiecontent">
					<table cellpadding="0" cellspacing="0">
						
						<c:forEach items="${tieList}" var="tie">
							<tr>
								<td width="60%"><a
									href="ViewTieServlet?id=${tie.id}&style=${style}" style="font-size:14px;color:#2d64b3;margin-left:10px;">${tie.tTitle}</a></td>
								<td><span style="font-size:12px;color:#999;">${tie.tDate}</span></td>
								<td><span class="figure"></span><span style="font-size:12px;color:#999;">${tie.tUsername}</span></td>
							</tr>
						</c:forEach>
						
					</table>
					<span class="yeshu">
					总页数    ${page.pageTotal} 
					<c:if test="${page.pageCount>1}">
					<a href="TopicServlet?count=${page.pageCount-1}&&type=${style}" class="fanye">上一页</a>
					</c:if> 
					  第 ${page.pageCount}页 <c:if test="${page.pageCount<page.pageTotal}">
						<a href="TopicServlet?count=${page.pageCount+1}&&type=${style}" style="font-size:12px;border: 1px solid #E7ECF0;color: #0000CD;text-align: center;">下一页</a>
					</c:if> 
					总记录数
					<em>${page.rowTotal}</em>
					</span>
				</div>
				<div class="fabiao">
					<div class="fatieimg">
						<img src="img/fatieimg.png" style="vertical-align:middle;"> <span>发表新帖</span>
					</div>
					<form action="PostTieServlet?type=${style}" method="post">
						<div class="tie_title">
							<span style="margin-left: 160px;">标题：</span> <input type="text"
								name="title" id="title">
						</div>
						<div class="tiezhengwen" style="width:580px; height: 240px; margin-top: 15px;margin-left:160px; border: 1px solid rgb(223, 223, 223); background-color: rgb(250, 250, 250)">
							
							<div class="tie_content" id="tie_content">
								<c:if test="${user == null}">
								<a name="tiecontent"  id="tiecontent"></a>
									<span style="display:block;text-align:center;margin-top:80px;">您还没有登录,不能进行回复！<span onclick="denglu()"
										style="color: #1E90FF; cursor: pointer">登录</span></span>
								</c:if>
								<c:if test="${user != null}">
								<a name="tiecontent"  id="tiecontent"></a>
									<textarea style="width:100%;height:100%;resize: none;"
									name="content"></textarea>
								</c:if>
							</div>
							
						</div>
						<c:if test="${user == null}">
							<button type="submit" id="submitTie"  style="border-radius: 5px;background-color:rgb(223, 223, 223);cursor: not-allowed; color: rgb(153, 153, 153)">发表</button>		
						</c:if>
						<c:if test="${user != null}">
							<button type="submit" id="submitTie"  style="border-radius: 5px;">发表</button>		
						</c:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<ul class="side_bar">
		<li class="side_bar_fatie" ><a href="#tiecontent"><img src="img/side_bar.png" id="inputfocus"></a></li>
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
				<tr>
					<td style="width: 20%; text-align: right;"></td>
					<td style="width: 80%; text-align: right;"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/showdata.js"></script>
<script type="text/javascript" src="js/showdata_top.js"></script>

</html>
