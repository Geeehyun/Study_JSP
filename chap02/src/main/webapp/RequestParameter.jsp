<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
<h2>내장객체 - request</h2>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String self = request.getParameter("self").replace("\r\n", "<br>");
String[] favo = request.getParameterValues("favo");

String favoVal = "";
if(favoVal != null) {
	for(int i = 0; i <favo.length; i++){
		favoVal += favo[i] + " ";
	}
}
%>


<ul>
	<li>아이디 : <%= id %></li>
	<li>비밀번호 : <%= pwd %></li>
	<li>이름 : <%= name %></li>
	<li>성별 : <%= gender %></li>
	<li>생년월일 : <%= birthday %></li>
	<li>관심사항 : <%= favoVal %></li>
	<li>자기소개 : <%= self %></li>
</ul>
</body>
</html>