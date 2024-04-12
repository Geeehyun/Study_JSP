<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - Response</title>
</head>
<body>
<h2>로그인</h2>
<% 
String err = request.getParameter("loginErr");
if(err != null) {
	out.print("로그인 실패<br>");
} 

String user_id = request.getParameter("user_id") != null? request.getParameter("user_id") : "";
String pwd = request.getParameter("pwd") != null? request.getParameter("pwd") : "";
%>
<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
	<label for="user_id">아이디 : <input type="text" id="user_id" name="user_id" value="<%= user_id %>" maxlength="20"></label>
	<label for="pwd">비밀번호 : <input type="password" id="pwd" name="pwd" value="<%= pwd %>" maxlength="20"></label>
	<input type="submit" value="로그인">
</form>

<br><hr><br>

<h2>응답 헤더 설정</h2>
<form name="frmHeader" id="frmHeader" action="response_header.jsp" method="get">
	<label for="date_type">날짜형식 : <input type="text" name="date_type" id="date_type" value="2024-03-06 09:20:00"></label>
	<label for="no_type">숫자 : <input type="number" name="no_type" id="no_type" value="20000"></label>
	<label for="text_type">숫자 : <input type="text" name="text_type" id="text_type" value="몰라" maxlength="20"></label>
	<input type="submit" value="응답 헤더 설정">
</form>
</body>
</html>