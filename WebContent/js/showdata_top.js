$(function() {
	//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	$(function() {
		$(window).scroll(function() {
			if ($(window).scrollTop() > 100) {
				
				$("#back_to_top>a>img").css({
					"visibility": "visible"
				});
			} else {
				$("#back_to_top>a>img").css("visibility", "hidden");
			}
		});
		//当点击跳转链接后，回到页面顶部位置
		$("#back_to_top").click(function() {
			$('body,html').animate({scrollTop: 0}, 300);//滚动条跳到0的位置 速度为300
			return false;
		});
		

	});
});