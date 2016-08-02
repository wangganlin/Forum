/**
 * 
 */
function login(){
	var userName=$("#userName").val();
	var password=$("#password").val();
	//alert(userName+":"+password);
	$.ajax({
		url : "UserServlet?userName="+userName,
		type : 'POST',
		dataType : 'json',
		success : function(data) {
			if(data.userName!=userName){
				alert("用户未注册！")
			}else if(data.password==password){
				 window.location.href="homePage.jsp";
			}else{
				alert("密码不正确！");
			}
		},
	    error:function(){
	    	
	    }
	
	});
	
}
