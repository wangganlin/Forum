<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>
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
	</div>
	<div class="title">
		<img src="img/center_img.jpg" alt="中间图片">
	</div>
	<div class="center">
		<div class="center_title">
			<img src="img/smallhouse.png"
				style="margin-top: 8px; margin-left: 10px; float: left;" /><span
				style="line-height: 40px">&nbsp;&gt;&nbsp; 论坛 &gt; 关于</span>
		</div>
		<div style="width:280px;height:500px;float:left;margin-left: 20px;margin-top: 30px;color:rgb(68, 68, 68);">
<pre>
<p>CIT（Communicating with IT）论坛</p>
<p>旨在让更多热爱编程的程序猿或程序媛</p>
<p>能有一个更好的交流平台。</p>
<p>在这个平台上，</p>
<p>可以交换自己的思想，</p>
<p>讨论技术问题，</p>
<p>为码农提供一个便捷的平台。</p>
加入我们吧！</pre>
		</div>
		<div style="width:700px;height:500px;float:right;margin-top: 30px;">
			<table style="border-collapse:collapse;width: 100%;height:100%;text-align:left;color:rgb(68, 68, 68);">
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person1.jpg" style="width:80px; height:80px"></td>
					<td>鲁松</td>
					<td>男</td>
					<td>21</td>
				</tr>
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person2.png" style="width:80px; height:80px"></td>
					<td>王甘林</td>
					<td>男</td>
					<td>21</td>
				</tr>
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person4.jpg" style="width:80px; height:80px"></td>
					<td>李玉明</td>
					<td>男</td>
					<td>23</td>
				</tr>
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person3.jpg" style="width:80px; height:80px"></td>
					<td>罗梦霞</td>
					<td>女</td>
					<td>21</td>
				</tr>
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person5.jpg" style="width:80px; height:80px"></td>
					<td>徐冬冬</td>
					<td>男</td>
					<td>21</td>
				</tr>
				<tr style="border-bottom:1px dashed rgb(228,230,235)">
					<td><img src="img/person6.jpg" style=" width:80px; height:80px"></td>
					<td>刘宏</td>
					<td>男</td>
					<td>21</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="foot">&copy;cit工作室版权所有</div>

</body>
</html>