<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증 페이지</title>
</head>
<body>
<h2>MVC 패턴의 회원 인증 페이지</h2>
<p>
	<strong>${authMsg}</strong>
	<br>
	<a href="./MemberAuth.mvc?id=admin&pwd=1234">회원인증(관리자)</a><br>
	<a href="./MemberAuth.mvc?id=test&pwd=1234">회원인증(회원)</a><br>
	<a href="./MemberAuth.mvc?id=user&pwd=1234">회원인증(비회원)</a><br>
</p>
</body>
</html>