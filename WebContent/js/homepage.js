$("#showthree").hide();
$("#jingping_li").css({
	"background-color" : "#ffffff",
	"border" : "1px solid #ffffff",
	"border-right" : "1px solid gainsboro",
	"cursor" : "pointer"
});

function jingpingView() {
	$("#showtwo").show();
	$("#showthree").hide();
	$("#jingping_li").css({
		"background-color" : "#ffffff",
		"border-bottom" : "1px solid #ffffff",
		"border-right" : "1px solid gainsboro",
		"cursor" : "pointer"
	});
	$("#xintie_li").css({
		"background-color" : "#F0F8FF",
		"border-bottom" : "1px solid gainsboro"
	});
}

function xintieView() {
	$("#showtwo").hide();
	$("#showthree").show();
	$("#xintie_li").css({
		"background-color" : "#ffffff",
		"border-bottom" : "1px solid #ffffff",
		"cursor" : "pointer"
	});
	$("#jingping_li").css({
		"background-color" : "#F0F8FF",
		"border-bottom" : "1px solid gainsboro"
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

function anno() {
	var keyword = $("#serach").val();
	$("#dataList2").empty();
	if (keyword != null) {
		$.ajax({
			url : "SearchServlet",
			type : "post",
			data : {
				"keyword" : keyword
			},
			dataType : "json",
			success : function(data) {
				/* $("#dataList").empty(); */
				/*if (data.length > 1) {*/
				if(data.length==1&data[0].tTitle==keyword){
					
				}else{
					for (var i = 0; i < data.length; i++) {
						$("#dataList2").append(
								"<option>" + data[i].tTitle + "</option>");
					}
				}
				/*}*/
			}
		});
	}
}

/*
 * function kuan(){ $("#serach").click(function(){
 * $("#serach").css("width","220px"); }); }
 */

$(function() {
	document.onclick = function(e) {

		var event = e || window.event;
		var ele = event.srcElement || event.target;
		if (ele.id != "serach") {
			$("#serach").css("width", "160px");

		} else {
			$("#serach").css("width", "220px");

		}
	}
})
function serach(){
	var value=$("#serach").val();
	window.location.href="QueryIDServlet?search_info="+value;
}
