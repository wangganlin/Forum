<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员</title>
<link type="text/css" rel="stylesheet" href="css/homepage.css" />
<link type="text/css" rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/showdata.css" />
</head>
<body>
	<div class="head">
		<div class="head_pic" style="float: left;">
			<img src="img/logo.jpg" width="90px" height="80px"
				style="margin-left: 30px; vertical-align: middle;"><span>&reg;</span>
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
			style="float: right; margin-top: 30px; margin-right: -258px" />
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp;论坛 管理</span>
		</div>
		<div class="center_content">
			<div class="kantie">
				<ul style="list-style: none;">
					<li style="background-color: rgb(221, 224, 227);">帖子管理</li>
					<!-- <li style="margin-left: -5px;">精帖</li> -->
				</ul>
				<div class="searchtie">
					<input type="text" name="searchtie" placeholder="查找帖子" /> <img
						src="img/search.png"
						style="float: right; margin-right: 8px; margin-top: 5px;">
				</div>
				<div class="tiecontent">
					<table cellpadding="0" cellspacing="0">

						<c:forEach items="${tieList}" var="tie">
							<tr>
								<td width="60%"><a
									href="ViewTieServlet?id=${tie.id}&style=${style}"
									style="font-size: 14px; color: #2d64b3; margin-left: 10px;">${tie.tTitle}</a></td>
								<td><span style="font-size: 12px; color: #999;">${tie.tDate}</span></td>
								<td><span class="figure"></span><span
									style="font-size: 12px; color: #999;">${tie.tUsername}</span></td>
								<td><c:choose><c:when test="${tie.tType=='better'}">精帖</c:when><c:otherwise>普通</c:otherwise></c:choose></td>
								<td><a href="DeleteTieServlet?id=${tie.id}">删除</a></td>
								<td><a href="ImproveServlet?id=${tie.id}">设为精帖</a></td>
							</tr>
						</c:forEach>

					</table>
					<span class="yeshu"> 总页数 ${page.pageTotal} <c:if
							test="${page.pageCount>1}">
							<a href="ManagerCenterServlet?count=${page.pageCount-1}&&type=${style}"
								class="fanye">上一页</a>
						</c:if> 第 ${page.pageCount}页 <c:if
							test="${page.pageCount<page.pageTotal}">
							<a href="ManagerCenterServlet?count=${page.pageCount+1}&&type=${style}"
								style="font-size: 12px; border: 1px solid #E7ECF0; color: #0000CD; text-align: center;">下一页</a>
						</c:if> 总记录数 <em>${page.rowTotal}</em>
					</span>
				</div>
			</div>
		</div>
	</div>
			<div class="foot">&copy;cit工作室版权所有</div>
</body>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/homepage.js"></script>
</html>