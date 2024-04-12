<%@page import="common.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장객체</title>
</head>
<body>
<%
CookieUtil.setCookie(response,  "EL", "ELCookie", 10,  "/");
%>
<h2>쿠키 읽기</h2>
<ul>
	<li> 쿠키값 : ${ cookie.EL.value }</li>
</ul>

<h2>헤더값</h2>
<ul>
<li>host : ${header.host }</li>
<li>user-agent : ${header["user-agent"] }</li>
<li>cookie : ${header.cookie }</li>
</ul>
<h2>컨텍스트 변수</h2>
<ul>
<li>web.xml 초기 변수 : ${header["user-agent"] }</li>
<li>컨텍스트 루트 : ${pageContext.request.contextPath }</li>
</ul>
</body>
</html>