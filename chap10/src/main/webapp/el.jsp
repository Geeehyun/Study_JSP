<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장객체 사용법</title>
</head>
<body>
<%
pageContext.setAttribute("scope","PAGE 영역");
request.setAttribute("scope","REQUEST 영역");
session.setAttribute("scope","SESSION 영역");
application.setAttribute("scope","APPLICATION 영역");
%>

<h2>EL 페이지</h2>
<ul>
	<li>PAGE 영역 : ${pageScope.scope} </li>
	<li>REQUEST 영역 : ${requestScope.scope} </li>
	<li>SESSION 영역 : ${sessionScope.scope} </li>
	<li>APPLICATION 영역 : ${applicationScope.scope} </li>
</ul>

<br><hr><br>
<jsp:forward page="el1.jsp"/>
</body>
</html>