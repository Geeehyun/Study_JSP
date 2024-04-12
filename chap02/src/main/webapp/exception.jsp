<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - Exception</title>
</head>
<body>

<%
int status = response.getStatus();
System.out.println(status);
if (status == 404) {
	out.print("404에러 발생");
	out.print("<br>파일 URL 확인");
} else if (status == 405) {
	out.print("405에러 발생");
	out.print("<br>요청 방식 (method) 획인");
} else if (status == 500) {
	out.print("500에러 발생");
	out.print("<br>소스 코드 오류 확인");
}
%>
</body>
</html>