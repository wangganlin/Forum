/**
 * 
 */

function emailAuto() {
	var arr = new Array("@qq.com", "@163.com", "@sina.com", "@sohu.com");
	var d = $("#email").val();
	$("#data").empty();
	if (d.indexOf("@") <= 0) {
		for (var i = 0; i < arr.length; i++) {
			$("#data").append("<option>" + d + arr[i] + "</option>");
		}
	}
}
