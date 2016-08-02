
$("#showthree").hide();
$("#jingping_li").css({"background-color":"#ffffff","border":"1px solid #ffffff","border-right":"1px solid gainsboro","cursor":"pointer"});
	
function jingpingView(){
	$("#showtwo").show();
	$("#showthree").hide();
	$("#jingping_li").css({"background-color":"#ffffff","border-bottom":"1px solid #ffffff","border-right":"1px solid gainsboro","cursor":"pointer"});
	$("#xintie_li").css({"background-color":"#F0F8FF","border-bottom":"1px solid gainsboro"});
}

function xintieView(){
	$("#showtwo").hide();
	$("#showthree").show();
	$("#xintie_li").css({"background-color":"#ffffff","border-bottom":"1px solid #ffffff","cursor":"pointer"});
	$("#jingping_li").css({"background-color":"#F0F8FF","border-bottom":"1px solid gainsboro"});
}
/*登陆验证*/
function login(){
	var email=$("#email").val();
	var pwd=$("#pwd").val();
	$.ajax({
		url : "LoginServlet?email="+email,
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			if(data==null){
				alert("用户未注册!")
			}else if(data.uPwd==pwd){
				//关闭登录框
				$(".dengluDiv").css("display","none");
				$(".loginDiv").css("display","none");
				//局部刷新头部信息
				$("#denglu_text").empty();
				$("#denglu_text").append(
						"<span style='font-size: 20px; width: 150px;color: rgb(45, 128, 218)' class='denglu_span' id='denglu_span'></span>"
								+ "<span class='denglu_span'><a href='ExitServlet'  style='color: #1E90FF'>[退出]</a></span>");
				$("#denglu_span").text("欢迎"+data.uName);
				$("#head_nav").append("<li onclick=window.location.href='InformationServlet'>个人中心</li>");
				$("#tie_content").empty();
				$("#tie_content").append("<textarea style='width:100%;height:100%;resize: none;'name='content'></textarea>");
				$("#submitTie").css({"background-color":"rgb(42,125,250)","cursor":"pointer","color":"#fff"});
			}else{
				alert("密码不正确！");
			}
		},
	    error:function(){
	    	
	    }
	
	});	
}

function denglu(){
	$(".dengluDiv").css("display","block");
	$(".loginDiv").css("display","block");
}

function denglu_close(){
	$(".dengluDiv").css("display","none");
	$(".loginDiv").css("display","none");
}

