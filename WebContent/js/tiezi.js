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
				$("#denglu_text")
				$("#denglu_text").append(
						"<span style='font-size: 20px; width: 150px;color: rgb(45, 128, 218)' class='denglu_span' id='denglu_span'></span>"
								+ "<span class='denglu_span'><a href='ExitServlet'  style='color: #1E90FF'>[退出]</a></span>");
				$("#denglu_span").text("欢迎"+data.uName);
				//局部刷新回复框
				$("#fabiaoComment").empty();
				$("#fabiaoComment").append("<textarea id='tie_comment' style='width: 100%; height: 100%'></textarea>")
				$("#fabiaoButton").empty();
				$("#fabiaoButton").append("<div onclick='huifutiezi()'"
					+"style='width: 60px; height: 30px; background-color: rgb(62, 137, 250); text-align: center; line-height: 30px; border-radius: 5px; cursor: pointer; color: #fff'>" +
							"发表</div>");
				$("#username").val(data.uName);
				$("#head_nav").append("<li onclick=window.location.href='InformationServlet'>个人中心</li>");
			}else{
				alert("密码不正确！");
			}
		},
	    error:function(){
	    	
	    }
	
	});
	
}


function huifutiezi(){
	var tieComment = $("#tie_comment").val();
	var tieId = $("#tieId").val();

	var username = $("#username").val();
	window.location.href="TieCommentServlet?tieComment="+tieComment+"&tieId="+tieId+"&username="+username;	
}

function huifuCommentView(i){
	$("#contentHuifu"+i).show();
	$("#huifu"+i).empty();
	$("#huifu"+i).append("<span onclick=huifuCommentNone('"+i+"') style='color: #1E90FF; cursor: pointer'>收起回复</span>");
}
function huifuCommentNone(i){
	$("#contentHuifu"+i).hide();
	$("#huifu"+i).empty();
	$("#huifu"+i).append("<span onclick=huifuCommentView('"+i+"') style='color: #1E90FF; cursor: pointer'>回复</span>");
	$("#huifuDiv"+i).empty();
	$("#huifuDiv"+i).append("<input type='text' id='huifuText"+i+"' style='width: 600px;height:40px;font-size: 20px'><br/>"+
			"<input type='button' value='发送' onclick=sendHuifu('"+$("#comment_name"+i).val()+"','"+i+"','"+$("#commentId"+i).val()+"')>");
	
}
function sendHuifu(username,i,cId){
	var hUsername = $("#username").val();
	if(hUsername==""){
		alert("对不起,您还没有登录,不能进行回复！");
		$("#huifuText"+i).val("");
		return false;
	}
	var huifuContent = $("#huifuText"+i).val();
	if(huifuContent==""){
		alert("对不起,输入框不能为空！");
		return false;
	}
	$.ajax({
		url : "CommentHuifuServlet?hUsername="+hUsername+"&cUsername="+username+"&huifuContent="+huifuContent+"&hcomId="+cId,
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			$("#huifuText"+i).val("");
			$("#huifuTable"+i).append("<tr style='border-bottom: 1px dashed rgb(228,230,235)'> <td>"+data.hUersname+" 回复 "+data.cUsername+":</td> <td>"+data.hContent+"</td> <td>"+data.hDate+"</td><td><span style='color: #1E90FF; cursor: pointer' onclick=huifuhuifu('"+hUsername+"','"+i+"','"+cId+"')>回复</span></td> </tr>")
		},
	    error:function(){
	    	
	    }
	
	});
}

function huifuhuifu(hUsername,i,cId){
	$("#huifuDiv"+i).empty();
	$("#huifuDiv"+i).append("<span>@"+hUsername+":</span><input type='text' id='huifuText"+i+"' style='width: 500px;height:40px;font-size: 20px'><br/>"+
					"<input type='button' style='border:none;background-color:rgb(58,131,241);color:#fff' value='发送' onclick=sendHuifu('"+hUsername+"','"+i+"','"+cId+"')>");
}

function denglu(){
	$(".dengluDiv").css("display","block");
	$(".loginDiv").css("display","block");
}

function denglu_close(){
	$(".dengluDiv").css("display","none");
	$(".loginDiv").css("display","none");
}
