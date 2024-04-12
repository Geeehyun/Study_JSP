<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키로 팝업창 제어</title>
</head>
<body>
<h2>팝업 메인</h2>
<%
String popCheck = "block";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for(Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("쿠키이름 : %s = 쿠키값 : %s<br>", cookieName, cookieVal));
		
		if(cookieName.equals("popup_close")) {
			if(cookieVal.equals("off")) {
				popCheck = "none";
			}
		}
	}
}

%>

<div id="popup" style="display :<%= popCheck %>">
	<h2>공지사항 팝업</h2>
	<div>
	<form name="frmPopup" id="frmPopup">
	<input type="checkbox" name="pop_flag" id="pop_flag" value="y" > 10초 동안 열지 않음
	<input type="button" value="닫기" id="closePopup">
	</form>
	</div>
</div>

<div id="popup2" style="display : <%= popCheck.equals("block")? "none" : "block" %>">
	<h2>공지사항 팝업</h2>
	<div>
		<input type="button" value="닫기" id="openPopup">
	</div>
</div>

<script>
document.querySelector("#closePopup").addEventListener("click", (e) => {
	const frm = document.querySelector("#frmPopup");
	const pop_flag = document.querySelector("#pop_flag").checked;
	console.log("pop_flag" + " : " + pop_flag);
	frm.action = "cookie4.jsp";
	frm.submit();
})

document.quereySe
</script>
</body>
</html>