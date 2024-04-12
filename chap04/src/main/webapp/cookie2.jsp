<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 조회하기</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for(Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("쿠키이름 : %s = 쿠키값 : %s<br>", cookieName, cookieVal));
	}
}

%>
</body>
</html>