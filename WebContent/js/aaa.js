function show() {
	$("#change_passinfo").css({"display":"block","width": "500px","height": "350px","left": "400px","top": "220px"});
	$(".backdiv").css("display","block");
}

function info_close(){
	$("#change_passinfo").css("display","none");
	$(".backdiv").css("display","none");
}

function show2(){
	$("#change_info").css({"display":"block","position":"fixed","width": "500px","height": "350px","left": "400px","top": "150px"});
	
	$(".backdiv").css("display","block");
	
}

function info_close2(){
	$("#change_info").css("display","none");
	$(".backdiv").css("display","none");
}
/**
 * 修改密码
 */
function changePassword(){
	/*$("#tishi").css("display","block");
	alert("1");*/
	/*setTimeout(function(){$("#tishi").hide();},2000);*/
	$.ajax({
		url:"ChangePassServlet",
		type:"post",
		dataType:"text",
		data:{
			"oldpass":$("#oldpass").val(),
			"newpass":$("#newpass").val()
		},
		success:function(data){
			if(data != "修改成功"){
				$("#alert").html(data);
			} else {
				$(".backdiv").hide();
				$("#change_passinfo").hide();
				$("#denglu_text").empty();
				$("#denglu_text").append("<span><span onclick='denglu()' style='color: #1E90FF; cursor: pointer'>[登录]</span></span> <span><a href='register.jsp' style='color: #1E90FF'>[注册]</a></span>")
				$(".dengluDiv").css("display", "block");
				$(".loginDiv").css("display", "block");
			}
			
		}
	});
}

/* 登陆验证 */
function login() {
	var email = $("#email").val();
	var pwd = $("#pwd").val();
	$
			.ajax({
				url : "LoginServlet?email=" + email,
				type : 'POST',
				dataType : 'json',
				success : function(data) {
					if (data == null) {
						alert("用户未注册!")
					} else if (data.uPwd == pwd) {
						// 关闭登录框
						$(".dengluDiv").css("display", "none");
						$(".loginDiv").css("display", "none");
						// 局部刷新头部信息
						$("#denglu_text").empty();
						$("#denglu_text")
								.append(
										"<span style='font-size: 20px; width: 150px;color: rgb(45, 128, 218)' class='denglu_span' id='denglu_span'></span>"
												+ "<span class='denglu_span'><a href='ExitServlet'  style='color: #1E90FF'>[退出]</a></span>");
						$("#denglu_span").text("欢迎" + data.uName);
						$("#head_nav")
								.append(
										"<li onclick=window.location.href='InformationServlet'>个人中心</li>");
						if(data.type==1){
							$("#head_nav")
							.append(
									"<li onclick=window.location.href='ManagerCenterServlet'>帖子管理</li>");
						}
					} else{
						alert("密码不正确！");
					}
				},
				error : function() {

				}

			});
}

function denglu() {
	$(".dengluDiv").css("display", "block");
	$(".loginDiv").css("display", "block");
}

function denglu_close() {
	$(".dengluDiv").css("display", "none");
	$(".loginDiv").css("display", "none");
}